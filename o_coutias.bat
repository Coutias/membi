@echo off

echo Limpando arquivos desnecessarios do uTorrent...

del del "%APPDATA%\uTorrent\*.torrent"

echo Arquivos desnecessarios do uTorrent excluidos com sucesso!

echo Limpando pastas desnecessárias do FiveM...
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\data\cache"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\data\nui-storage"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\data\server-cache"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\data\server-cache-priv"
echo Cache do FiveM limpo com sucesso!

echo Limpando cache e crashlogs do Minecraft...
del /s /q "%appdata%\.minecraft\logs\*"
del /s /q "%appdata%\.minecraft\crash-reports\*"
echo Cache do Minecraft limpo com sucesso!

echo Limpando cache e logs do League of Legends...
del /s /q "%ProgramData%\Riot Games\League of Legends\Logs\*"
del /s /q "%ProgramData%\Riot Games\League of Legends\Crashes\*"
echo Cache do League of Legends limpo com sucesso!

echo Todos os caches foram limpos com sucesso!


echo Limpando a memória RAM...
echo.
FreeMem.exe > nul
FreeMem.exe > nul
FreeMem.exe > nul
echo.
echo Memória RAM limpa com sucesso.

echo Limpando arquivos temporarios...
echo.
rem Remove arquivos temporarios.
del /s /q %TEMP%\*.*
rem Remove cache do Internet Explorer.
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
rem Remove cache do Firefox.
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 1
rem Remove cache do Chrome.
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2
del /s /q "%APPDATA%\Opera Software\Opera Stable\Cache\*.*"
rem Remove cache do Opera GX.
del /s /q "%APPDATA%\Opera Software\Opera GX Stable\Cache\*.*"
echo.
echo Arquivos temporarios limpos com sucesso.

echo Desativando serviços desnecessarios...
echo.
rem Desativa o serviço de impressao.
sc config Spooler start= disabled
rem Desativa o serviço de pesquisa do Windows.
sc config WSearch start= disabled
rem Desativa o serviço Superfetch.
sc config SysMain start= disabled
echo.
echo Serviços desnecessarios desativados com sucesso.

echo Desativando efeitos visuais...
echo.
rem Desativa os efeitos visuais do Windows.
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 90,12,03,80 /f
echo.
echo Efeitos visuais desativados com sucesso.

echo Limpando a pasta de arquivos temporarios do Windows...
echo.
rem Remove arquivos temporarios do Windows.
del /s /q %windir%\temp\*.*
del /s /q %USERPROFILE%\AppData\Local\Temp\*.*
REM Limpar a pasta Recent
DEL /Q %USERPROFILE%\AppData\Roaming\Microsoft\Windows\Recent\*
echo A pasta Recent foi limpa com sucesso.

REM Limpar a pasta Prefetch
DEL /Q %SystemRoot%\Prefetch\*
echo A pasta Prefetch foi limpa com sucesso.

REM Limpar a pasta Temp
RD /S /Q %SystemRoot%\Temp
MD %SystemRoot%\Temp
echo A pasta Temp foi limpa com sucesso.

echo.
echo Pasta de arquivos temporarios do Windows limpa com sucesso.


echo Limpando arquivos de log do Windows...
echo.
rem Limpa os arquivos de log do Windows.
:: Limpa os logs de eventos do Windows
wevtutil.exe cl Analytic
wevtutil.exe cl Application
wevtutil.exe cl DirectShowFilterGraph
wevtutil.exe cl DirectShowPluginControl
wevtutil.exe cl EndpointMapper
wevtutil.exe cl ForwardedEvents
wevtutil.exe cl HardwareEvents
wevtutil.exe cl Internet Explorer
wevtutil.exe cl Key Management Service
wevtutil.exe cl MF_MediaFoundationDeviceProxy
wevtutil.exe cl "Media Center"
wevtutil.exe cl MediaFoundationDeviceProxy
wevtutil.exe cl MediaFoundationPerformance
wevtutil.exe cl MediaFoundationPipeline
wevtutil.exe cl MediaFoundationPlatform
wevtutil.exe cl Microsoft-IE/Diagnostic
wevtutil.exe cl Microsoft-IEFRAME/Diagnostic
wevtutil.exe cl Microsoft-PerfTrack-IEFRAME/Diagnostic
wevtutil.exe cl Microsoft-PerfTrack-MSHTML/Diagnostic
wevtutil cl Application
wevtutil cl Security
wevtutil cl Setup
wevtutil cl System
wevtutil cl ForwardedEvents
del /s /q %USERPROFILE%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\*.log

:: Limpa a pasta temp
RD /S /Q %temp%

:: Limpa a pasta prefetch
RD /S /Q %windir%\Prefetch

:: Limpa a pasta de arquivos temporarios do Windows
RD /S /Q %windir%\Temp

:: Limpa a pasta de logs do Windows
RD /S /Q %windir%\Logs

:: Limpa a pasta de relatórios de erros do Windows
RD /S /Q %windir%\system32\config\systemprofile\AppData\Local\Microsoft\Windows\WER\ReportQueue

:: Limpa a pasta de logs do sistema
RD /S /Q %windir%\system32\LogFiles

:: Limpa a pasta de atualizações do Windows
RD /S /Q %windir%\SoftwareDistribution\Download

:: Limpa a pasta de backup do sistema anterior do Windows
RD /S /Q %windir%\old

:: Limpa a pasta de arquivos de impressao
RD /S /Q %windir%\System32\spool\PRINTERS

:: Limpa a pasta recent
del /s /q %userprofile%\AppData\Roaming\Microsoft\Windows\Recent\*
:: Limpa a pasta de atualizações do Windows
RD /S /Q %windir%\SoftwareDistribution\Download\

:: Limpa a pasta de backup do sistema anterior do Windows
RD /S /Q %windir%\old
echo.
echo Arquivos de log do Windows limpos com sucesso.

echo Desabilitando delay e aceleração de teclado e mouse...
echo.
rem Desabilita o delay do teclado.
reg add "HKCU\Control Panel\Keyboard" /v KeyboardDelay /t REG_SZ /d 0 /f
rem Desabilita a aceleração do mouse.
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f
echo.
echo Delay e aceleração de teclado e mouse desabilitados com sucesso.

echo Desabilitando limitador de internet do Windows...
echo.
rem Desabilita o limitador de banda da rede do Windows.
netsh int tcp set global autotuninglevel=disabled
echo.
echo Limitador de internet do Windows desabilitado com sucesso.

echo Ativando todos os nucleos do processador...
echo.
rem Ativa todos os nucleos do processador.
bcdedit /set disabledynamictick yes
echo.
echo Todos os nucleos do processador ativados com sucesso.

echo Limpando cache DNS...
echo.
rem Limpa o cache DNS.
ipconfig /release
ipconfig /renew
ipconfig /flushdns
ipconfig /registerdns
nbtstat -rr
netsh int ip reset all
netsh winsock reset
echo Cache DNS limpo com sucesso.

echo As configuracoes de rede estao sendo redefinidas..

netsh int ip reset all
netsh winsock reset
netsh interface ipv6 isatap set state state=disabled
netsh interface ipv6 6to4 set state state=disabled undoonstop=disabled

echo As configuracoes de rede foram redefinidas com sucesso.

echo A pasta Windows.old esta sendo excluida..

RD /S /Q C:\Windows.old

echo A pasta Windows.old foi excluida com sucesso.


echo As pastas de atualizacao estao sendo excluidas..

RD /S /Q C:\$Windows.~BT
RD /S /Q C:\$Windows.~WS
RD /S /Q C:\Windows10Upgrade
RD /S /Q %SystemDrive%\Windows10Upgrade
RD /S /Q %SystemDrive%\ESD

echo As pastas de atualizacao foram excluidas com sucesso.

echo Adicionando um otimizadores de regedit para diminuir usos inuteis

REM NaO LEMBRO OQUE TUDO FAZ MAIS AJUDA!
reg add HKLM\SYSTEM\CurrentControlSet\Control /v SvcHostSplitThresholdInKB /t REG_DWORD /d 67108864 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettings /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 3 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d 0 /f

REM Desativa o Game DVR
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d 0 /f

REM Configura o PowerThrottling
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f

REM Configura o GameConfigStore
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "windowsCompatible" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "behaviorMode" /t REG_DWORD /d 0 /f
reg delete "HKEY_CURRENT_USER\System\GameConfigStore" /va /f

REM Configura o SystemProfile
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "CPU Priority" /t REG_DWORD /d 8 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 6 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_SZ /d "High" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0xffffffff /f

REM Configura o Desktop
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d 0 /f

REM Configura a acessibilidade
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\MouseKeys" /v "Flags" /t REG_SZ /d 0 /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d 0 /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d 0 /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d 0 /f

REM Modifica o valor de KeyboardDataQueueSize para diminuir o delay entre clicks
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d 50 /f

REM Cria a pasta Parameters e modifica o valor de MouseDataQueueSize para diminuir o delay entre clicks
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d 50 /f

REM Configura a manutenção
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d 1 /f

REM Verifica qual o teu windows se e 64x ou 32x e adiciona o valor somente no windows certo para da a diferencia na internet!
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_QWORD /d 0x7fff /f
) else (
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d 0x7fff /f
)

echo Procedimentos feitos no REGEDIT!

echo -
echo -
echo -
echo -
echo Se inscreve e deixa o like para ajudar!
start "" "https://www.youtube.com/channel/UCkQohOaQwvVpVWURNI0jb7g"
echo -
del "%~f0"
echo ------------------------------------------
echo Sobre:
echo YT: https://www.youtube.com/channel/UCkQohOaQwvVpVWURNI0jb7g [Coutias] | IG: @CoutiasPY
echo Sou Coutias, trabalhei como tecnico de computador entre os meus 13 anos aos meus 20 anos..
echo Fiz esse arquivo para ajudar, entao se poder retribuir com sua inscricao e like em algum video meu, eu serei muito grato!
echo ------------------------------------------
echo Obs 1:
echo Obrigado por ter assistido o video sobre a otimizacao!
echo E tomara que esse arquivo tenha otimizado o maximo possivel!
echo Estarei sempre a procura de novas formas e metodos de otimizacao!
echo ------------------------------------------
echo Obs 2:
echo Esse .bat vai funcionar perfeitamente no windows 10/11 ou superior!
echo Pode usar em windows com versoes inferiores, mais nao e garantido que funcione tudo!
echo ------------------------------------------
echo Creditos: Microsoft, ChatGPT, meu .bat antigo xD, e pessoas que postaram alguns dos codigos em forum's gringos na net
echo Creditos para regedit: DEXX TV, HSRoficial, Paulo Thierry Informática e Tec. e Marquezinho.
echo ------------------------------------------
echo -
echo -
echo -
echo -
del "%~f0"
pause
