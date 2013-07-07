$home_dir = $env:userprofile

function vi($filename) {
    vim.bat $filename -N -u NONE -i NONE --noplugin
}

function vim($filename) {
    &  "$home_dir\tools\vim\gvim.exe" $filename
}

function gvim($filename) {
    & "$home_dir\tools\vim\gvim.exe" $filename
}

function me($filename) {
	if($filename -eq $null)
	{
		$filename = $(Get-Date).ToString("yyyyMMdd_hhmmss") + ".txt"
		$filepath = "C:\Program Files\TeraPad\tmp\" + $filename
		New-Item $filepath -itemType File
		& "$home_dir\tools\Mery\Mery.exe" "$filepath"
	}
	else
	{
		& "$home_dir\tools\Mery\Mery.exe" "$filename"
	}
}

function x() { exit }
function q() { exit }

function sb() {
	& 'C:\Program Files\Spybot - Search & Destroy\spybot_update.bat'
}

Set-Alias firefox 'C:\Program Files\Mozilla Firefox\firefox.exe'
Set-Alias chrome 'C:\Program Files\Google\Chrome\Application\chrome.exe'
Set-Alias sh 'C:\MinGW\msys\1.0\bin\sh.exe'

function gst() { git status }
function gcmm($message) { git commit -m $message }

$MaximumHistoryCount = 2000

# Load posh-git profile
. 'C:\tools\poshgit\dahlbyk-posh-git-22f4e77\profile.ps1'

# éQçl: https://github.com/dahlbyk/posh-git/blob/master/GitPrompt.ps1
$global:GitPromptSettings.BranchForegroundColor    = [ConsoleColor]::DarkGreen
$global:GitPromptSettings.WorkingForegroundColor   = [ConsoleColor]::DarkYellow
$global:GitPromptSettings.BeforeForegroundColor    = [ConsoleColor]::DarkCyan
$global:GitPromptSettings.AfterForegroundColor     = [ConsoleColor]::DarkCyan
$global:GitPromptSettings.UntrackedForegroundColor = [ConsoleColor]::DarkRed

function sudo {
    $args[1] = (Convert-Path $args[1])
    Start-Process $args[0] -Verb "runas" -ArgumentList $args[1..($args.Length - 1)]
}
