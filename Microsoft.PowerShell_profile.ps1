$home_dir = $env:userprofile

if (-not (Test-Path ~\backuptxt)) { mkdir ~\backuptxt }

function backup {
    param([string]$filename, $exepath)

    $backup = Join-Path "~\backuptxt" ((Get-Date).ToString("yyyyMMdd_hhmmss_") + (Split-Path $filename -Leaf))
    cp $filename $backup
    & $exepath $filename
}

function vi($filename) {
    vim.bat $filename -N -u NONE -i NONE --noplugin
}

function vim($filename) {
    backup $filename "$home_dir\tools\vim\gvim.exe"
}

function gvim($filename) {
    backup $filename "$home_dir\tools\vim\gvim.exe"
}

# https://bitbucket.org/moswald/powershell/src/805b6eca148347357ae94f737c26ad6f43689359/curl.ps1?at=default
function curl {
    param([string]$url)
    return (new-object System.Net.WebClient).DownloadString($url)
}

function hibernate {
    param($min)
    timeout ($min * 60)
# Get-History | Export-CliXML ~\.posh_history.xml
    shutdown /h
}

function x {
# Get-History | Export-CliXML ~\.posh_history.xml
    # Prompt �ň�s���Ƃɒǉ������ق�����������
    # ~\.posh_history �̏d�����폜����
    exit
}

Import-Csv ~\.posh_history.csv | Add-History

function sb {
    & 'C:\Program Files\Spybot - Search & Destroy\spybot_update.bat'
}

Set-Alias firefox 'C:\Program Files\Mozilla Firefox\firefox.exe'
Set-Alias chrome  'C:\Program Files\Google\Chrome\Application\chrome.exe'
Set-Alias sh      'C:\MinGW\msys\1.0\bin\sh.exe'

function gst { git status }
function gcmm($message) { git commit -m $message }

$MaximumHistoryCount = 2000

# Load posh-git profile
. 'C:\tools\poshgit\dahlbyk-posh-git-22f4e77\profile.ps1'

# �Q�l: https://github.com/dahlbyk/posh-git/blob/master/GitPrompt.ps1
$global:GitPromptSettings.BranchForegroundColor    = [ConsoleColor]::DarkGreen
$global:GitPromptSettings.WorkingForegroundColor   = [ConsoleColor]::DarkYellow
$global:GitPromptSettings.BeforeForegroundColor    = [ConsoleColor]::DarkCyan
$global:GitPromptSettings.AfterForegroundColor     = [ConsoleColor]::DarkCyan
$global:GitPromptSettings.UntrackedForegroundColor = [ConsoleColor]::DarkRed

function sudo {
    $args[1] = (Convert-Path $args[1])
    Start-Process $args[0] -Verb "runas" -ArgumentList $args[1..($args.Length - 1)]
}

function Prompt {
    # PowerShell 3.0+
    # Export-Csv -Path ~\.posh_history.csv -InputObject (Get-History)[-1] -Append

    # PowerShell 2.0+
    if (-not (Test-Path ~\.posh_history.csv)) {
        "#TYPE Microsoft.PowerShell.Commands.HistoryInfo" | Out-File ~\.posh_history.csv -encoding UTF8
        '"Id","CommandLine","ExecutionStatus","StartExecutionTime","EndExecutionTime"' | Out-File ~\.posh_history.csv -encoding UTF8 -append
    }
    $h = (Get-History)[-1]
    $csv = "`"$($h.Id)`",`"$($h.CommandLine)`",`"$($h.ExecutionStatus)`",`"$($h.StartExecutionTime)`",`"$($h.EndExecutionTime)`""
    $csv | Out-File ~\.posh_history.csv -encoding UTF8 -append

    return "$pwd > "
}
