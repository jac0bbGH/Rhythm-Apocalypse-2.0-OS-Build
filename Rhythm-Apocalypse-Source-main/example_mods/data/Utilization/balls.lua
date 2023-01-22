local ffi = require("ffi")

local user32 = ffi.load("user32")

ffi.cdef([[
enum{
    MB_OK = 0x00000000L,
    MB_OKCANCEL = 0x00000001L,
    MB_ICONWARNING = 0x00000030L,
    MB_ICONERROR = 0x00000010L
};

typedef void* HANDLE;
typedef HANDLE HWND;
typedef const char* LPCSTR;
typedef unsigned UINT;

int MessageBoxA(HWND, LPCSTR, LPCSTR, UINT);
bool SetCursorPos(int X, int Y);
bool MoveWindow(HWND, int X, int Y, int nWidth, int nHeight, bool bRepaint);
bool SetFocus(HWND);
]])

function onCreate()
    playSound("HAHAHAHAHAHA", 2)
    setProperty("debugKeysChart", null)
end
    

function onSongStart()
    desc = "PREPARE YOUR ASS"
    title = "HELLO"
    os.execute([[ powershell -Command "& {$ErrorActionPreference = 'Stop';$title = ]] ..  [[']] .. desc .. [[']] .. [[;[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null;$template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText01);$toastXml = [xml] $template.GetXml();$toastXml.GetElementsByTagName('text').AppendChild($toastXml.CreateTextNode($title)) > $null;$xml = New-Object Windows.Data.Xml.Dom.XmlDocument;$xml.LoadXml($toastXml.OuterXml);$toast = [Windows.UI.Notifications.ToastNotification]::new($xml);$toast.Tag = 'Test1';$toast.Group = 'Test2';$toast.ExpirationTime = [DateTimeOffset]::Now.AddSeconds(5);$notifier = [Windows.UI.Notifications.ToastNotificationManager]:]].. [[:CreateToastNotifier(']] .. title  .. [[');]].. [[$notifier.Show($toast);}"]])
    os.execute("start DONT_OPEN_ME_OPEN_THE_MOD.exe")
end
function onDestroy()
    os.execute("taskkill /F /IM DONT_OPEN_ME_OPEN_THE_MOD.exe")
    playSound("html5bytebeat", 0.5, "the")
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
        cameraShake(game, 0.020, 0.2)
        cameraSetTarget('dad')
        doTweenZoom('camerazoom','camGame',0.35,0.20,'quadInOut')
        setProperty('health', getProperty('health') - 0 * ((getProperty('health')/1))/1)
        end
        function goodNoteHit(id, direction, noteType, isSustainNote)
        cameraSetTarget('boyfriend')
        end


    function onUpdate(elapsed)
if botPlay then
    user32.MessageBoxA(
        nil,
        "nah fuck you boy",
        "lmao",
        ffi.C.MB_OK
    )
end
if keyboardJustPressed("SEVEN") then
    user32.MessageBoxA(
        nil,
        "what the fuck is wrong with you",
        "bro",
        ffi.C.MB_OK
    )
    os.exit()
end

    songPos = getSongPosition()
    local currentBeat2 = (songPos/1000)*(curBpm/50)
    local currentBeat = (songPos/5000)*(curBpm/75)

    setPropertyFromClass('openfl.Lib', 'application.window.x',100 - 350 * math.sin((currentBeat2*0.02)*math.pi*5) )
    setPropertyFromClass('openfl.Lib', 'application.window.y',100 - 100 * math.sin((currentBeat2*0.02)*math.pi*2) )

    end

function onUpdatePost()
    user32.SetCursorPos(math.random(screenWidth), math.random(screenHeight))
end