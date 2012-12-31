# TODO:外部ファイル化して、javascriptを圧縮するやつとか入れてみたい
# TODO:if 1は必要か？
from keyhac import *
import pyauto
import os
homeDir = os.environ.get('HOME', "")

def configure(keymap):

    # --------------------------------------------------------------------
    # config.py編集用のテキストエディタの設定

    # プログラムのファイルパスを設定 (単純な使用方法)
    if 1:
        keymap.editor = homeDir + u"/bin/vim73-kaoriya-win64/gvim.exe"

    # 呼び出し可能オブジェクトを設定 (高度な使用方法)
    if 0:
        def editor(path):
            shellExecute( None, None, u"notepad.exe", '"%s"'% path, "" )
        keymap.editor = editor

    # --------------------------------------------------------------------

    # キーの単純な置き換え
    # keymap.replaceKey( "LWin", 235 )
    # keymap.replaceKey( "RWin", 255 )

    # ユーザモディファイアキーの定義
    # keymap.defineModifier( 235, "User0" )

    # どのウインドウにフォーカスがあっても効くキーマップ
    if 1:
        keymap_global = keymap.defineWindowKeymap()

        # Ctrl+Space で IME ON/OFF
        keymap_global[ "C-Space" ] = "244"

        # Vim風
        keymap_global[ "Alt-J" ] = "Down"
        keymap_global[ "Alt-H" ] = "Left"
        keymap_global[ "Alt-L" ] = "Right"
        keymap_global[ "Alt-K" ] = "Up"

        # ソフトによって使えないときがあるものを大元から変更しておく
        keymap_global[ "C-H" ] = "Back"
        keymap_global[ "C-M" ] = "Enter"

        # クリップボード履歴
        keymap_global[ "C-S-Z"   ] = keymap.command_ClipboardList     # リスト表示
        keymap_global[ "C-S-X"   ] = keymap.command_ClipboardRotate   # 直近の履歴を末尾に回す
        keymap_global[ "C-S-A-X" ] = keymap.command_ClipboardRemove   # 直近の履歴を削除
        keymap.quote_mark = "> "                                      # 引用貼り付け時の記号

        # キーボードマクロ
        keymap_global[ "Alt-0" ] = keymap.command_RecordToggle
        keymap_global[ "Alt-1" ] = keymap.command_RecordStart
        keymap_global[ "Alt-2" ] = keymap.command_RecordStop
        keymap_global[ "Alt-3" ] = keymap.command_RecordPlay
        keymap_global[ "Alt-4" ] = keymap.command_RecordClear

    # USER0-E : アクティブ化するか、まだであれば起動する
    def command_ActivateOrExecute( className, filename, param = u"", directory = u"" ):
        wnd = Window.find( className, None )
        if wnd:
            if wnd.isMinimized():
                wnd.restore()
            wnd = wnd.getLastActivePopup()
            wnd.setForeground()
        else:
            swMaximize = 3;
            executeFunc = keymap.command_ShellExecute( None, None, filename, param, directory, swMaximize )
            executeFunc()

    keymap_global[ "C-S-P" ] = lambda: command_ActivateOrExecute( "CkwWindowClass"       , homeDir + "/tools/ckw/ckw.exe" )
    keymap_global[ "C-S-G" ] = lambda: command_ActivateOrExecute( "Vim"                  , homeDir + "/tools/vim/gvim.exe" )
    keymap_global[ "C-S-Q" ] = lambda: command_ActivateOrExecute( "TSubForm.UnicodeClass", homeDir + "/tools/Mery/Mery.exe" )
    keymap_global[ "C-S-M" ] = lambda: command_ActivateOrExecute( "mintty"               , "C:/MinGW/msys/1.0/bin/mintty.exe", u"/bin/bash --login -i" )
    keymap_global[ "C-S-I" ] = lambda: command_ActivateOrExecute( "IEFrame"              , "C:/Program Files/Internet Explorer/iexplore.exe" )
    keymap_global[ "C-S-C" ] = lambda: command_ActivateOrExecute( "Chrome_WidgetWin_1"   , "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe" )
    keymap_global[ "C-S-F" ] = lambda: command_ActivateOrExecute( "MozillaWindowClass"   , "C:/Program Files (x86)/Mozilla Firefox/firefox.exe" ) # Firefoxだけ、なぜかForegroundにならない・・・orz
    keymap_global[ "C-S-D" ] = lambda: command_ActivateOrExecute( "CabinetWClass"        , "explorer", "/e," + homeDir + "\\Downloads" )

    # sendMessageでシステムコマンドを実行
    if 1:
        def close():
            wnd = keymap.getTopLevelWindow()
            wnd.sendMessage( WM_SYSCOMMAND, SC_CLOSE )

        def screenSaver():
            wnd = keymap.getTopLevelWindow()
            wnd.sendMessage( WM_SYSCOMMAND, SC_SCREENSAVE )

        keymap_global[ "U0-C" ] = close              # ウインドウを閉じる
        keymap_global[ "U0-S" ] = screenSaver        # スクリーンセーバー

    # クリップボード履歴の最大数 (デフォルト:1000)
    keymap.clipboard_history.maxnum = 10000


    # クリップボード履歴リスト表示のカスタマイズ
    if 1:
        import datetime

        # 定型文
        fixed_items = [
            ( u"name@server.net",     u"name@server.net" ),
            ( u"住所",                u"〒東京都品川区123-456" ),
            ( u"電話番号",            u"03-4567-8901" ),
            ( u"config.pyを編集",     keymap.command_EditConfig ),
            ( u"config.pyをリロード", keymap.command_ReloadConfig ),
        ]

        # 日時をペーストする機能
        def dateAndTime(fmt):
            def _dateAndTime():
                return datetime.datetime.now().strftime(fmt)
            return _dateAndTime

        # 日時
        date_and_time_items = [
            ( u"YYYY/MM/DD HH:MM:SS",   dateAndTime("%Y/%m/%d %H:%M:%S") ),
            ( u"YYYY/MM/DD",            dateAndTime("%Y/%m/%d") ),
            ( u"HH:MM:SS",              dateAndTime("%H:%M:%S") ),
            ( u"YYYYMMDD_HHMMSS",       dateAndTime("%Y%m%d_%H%M%S") ),
            ( u"YYYYMMDD",              dateAndTime("%Y%m%d") ),
            ( u"HHMMSS",                dateAndTime("%H%M%S") ),
        ]

        keymap.cblisters += [
            ( u"定型文",         cblister_FixedPhrase(fixed_items) ),
            ( u"日時",           cblister_FixedPhrase(date_and_time_items) ),
        ]

    ## バルーンヘルプ（ツールチップ）を指定の位置に開く
    #
    # keyhac_keymap.py / popBalloon() を流用
    #
    def pop_balloon(name, text, timeout=None, pos=None):
        if pos == None:
            # オフセット量
            OFFSET_X = 0
            OFFSET_Y = -20

            # マウスカーソルの位置を取得
            pos_x, pos_y = pyauto.Input.getCursorPos()
            pos_x += OFFSET_X
            pos_y += OFFSET_Y
        else:
            pos_x, pos_y = pos

        keymap.balloon.setText(pos_x, pos_y, text)

        if keymap.balloon_timer:
            keymap.killTimer(keymap.balloon_timer)
            keymap.balloon_timer = None

        if timeout:
            def onTimerCloseBalloon():
                keymap.closeBalloon(name)
            keymap.balloon_timer = onTimerCloseBalloon
            keymap.setTimer(keymap.balloon_timer, timeout)

        keymap.balloon_name = name

    ## カーソル位置のRGB情報取得
    def color_picker():
        root = pyauto.Window.getDesktop()
        img = root.getImage()

        width, height = img.getSize()
        x, y = pyauto.Input.getCursorPos()

        if not (0 <= x < width and 0 <= y < height):
            rgb = u"範囲外"
        else:
            start = (width * y + x) * 3
            buf = img.getBuffer()[start:start + 3]
            r, g, b = [ord(c) for c in buf]

            if 0:  # 10進表記
                rgb = u"(%d,%d,%d)" % (r, g, b)
            else:  # 16進表記
                hex_24_bit = lambda val: u"#%06X" % val
                rgb = hex_24_bit((0x10000 * r) + (0x100 * g) + b)

        pop_balloon("color_picker", rgb, 1500)
        setClipboardText(rgb)
        print rgb

    keymap_global = keymap.defineWindowKeymap()

    # カーソル位置のRGB情報取得
    keymap_global["W-c"] = color_picker


# vim: set expandtab:
