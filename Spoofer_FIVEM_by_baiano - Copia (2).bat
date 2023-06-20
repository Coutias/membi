set "folderPath1=%LOCALAPPDATA%\DigitalEntitlements"
set "folderPath2=%APPDATA%\CitizenFX"

echo Deletando a pasta DigitalEntitlements


if exist "%folderPath1%" (
    echo Pasta encontrada. Excluindo...
    rmdir /s /q "%folderPath1%"
    echo Pasta excluída com sucesso!
) else (
    echo Pasta não encontrada.
)

echo Deletando a pasta CitizenFX

if exist "%folderPath2%" (
    echo Pasta encontrada. Excluindo...
    rmdir /s /q "%folderPath2%"
    echo Pasta excluída com sucesso!
) else (
    echo Pasta não encontrada.
)

set "folderPath=%LOCALAPPDATA%\FiveM\FiveM.app"

echo Deletando as pastas crashes e logs

if exist "%folderPath%" (
    echo Pasta encontrada. Excluindo...
    rmdir /s /q "%folderPath%\crashes"
    rmdir /s /q "%folderPath%\logs"
    echo Pastas excluídas com sucesso!
) else (
    echo Pasta não encontrada.
)

REM Gerar um endereço MAC aleatório
set /a oct1=%random% %% 256
set /a oct2=%random% %% 256
set /a oct3=%random% %% 256
set /a oct4=%random% %% 256
set /a oct5=%random% %% 256
set /a oct6=%random% %% 256

REM Converter os octetos em um formato de endereço MAC válido
set mac_address=%02x:%02x:%02x:%02x:%02x:%02x
echo Gerando novo endereço MAC aleatório: %mac_address%

REM Alterar o endereço MAC usando o macshift
cd C:\macshift\
macshift.exe "Nome da sua placa de rede" %mac_address%

echo Identificando discos rígidos e unidades de estado sólido (HD e SSD):
echo.

for /F "skip=1 tokens=1,2 delims= " %%i in ('wmic diskdrive get DeviceID^, SerialNumber ^| findstr /r /v "^$"') do (
    echo Disco: %%i
    echo ID Antigo: %%j
    set /a new_id=!random!
    echo Novo ID: !new_id!
    wmic diskdrive where DeviceID="%%i" call SetSerialNumber="!new_id!"
    echo.
)

echo IDs de discos alterados com sucesso.

echo Mudando dados HWID.
echo Mudando dados HWID..
echo Mudando dados HWID...

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography" /v MachineGuid /t REG_SZ /d %Hex8%-%Hex1%-%Hex0%-%Hex1%-%Hex10% /f>nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v BuildGUID /t REG_SZ /d %Hex8%-%Hex1%-%Hex0%-%Hex1%-%Hex10% /f>nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Class\{4d36e967-e325-11ce-bfc1-08002be10318}\Configuration\Variables\BusDeviceDesc" /v PropertyGuid /t REG_SZ /d {%Hex8%-%Hex1%-%Hex0%-%Hex1%-%Hex10%} /f>nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\Configuration\Variables\DeviceDesc" /v PropertyGuid /t REG_SZ /d {%Hex8%-%Hex1%-%Hex0%-%Hex1%-%Hex10%} /f>nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\Configuration\Variables\Driver" /v PropertyGuid /t REG_SZ /d {%Hex8%-%Hex1%-%Hex0%-%Hex1%-%Hex10%} /f>nul 2>&1W
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SystemInformation" /v ComputerHardwareId /t REG_SZ /d {%Hex8%-%Hex1%-%Hex0%-%Hex1%-%Hex10%} /f>nul 2>&1
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v InstallDate /t REG_SZ /d %random% /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v ProductId /t REG_SZ /d %random% /f
REG ADD HKLM\SOFTWARE\Microsoft\Cryptography /v GUID /t REG_SZ /d %Hex1%-%Hex8%-%Hex1%-%Hex0%-%Hex10% /f
REG ADD HKLM\SOFTWARE\Microsoft\Cryptography /v GUID /t REG_SZ /d %random%-%random%-%random%-%random%-%random% /f
REG ADD HKLM\SOFTWARE\Microsoft\Cryptography /v MachineGuid /t REG_SZ /d %random%-%random%-%random%-%random%-%random% /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v BuildGUID /t REG_SZ /d %random%-%random% /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v InstallDate /t REG_SZ /d %random% /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v ProductId /t REG_SZ /d %random%-%random%-%random%-%random% /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v RegisteredOrganization /t REG_SZ /d FS%random% /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v RegisteredOrganization /t REG_SZ /d %random%-%random% /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v RegisteredOwner /t REG_SZ /d FS%random% /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion /v RegisteredOwner /t REG_SZ /d %random%-%random% /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName /v ComputerName /t REG_SZ /d %random% /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName /v ComputerName /t REG_SZ /d %random%-%random% /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName /v ComputerName /t REG_SZ /d %random% /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName /v ComputerName /t REG_SZ /d %random%-%random% /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\IDConfigDB\Hardware" "Profiles\0001 /v GUID /t REG_SZ /d {%random%-%random%-%random%-%random%-%random%} /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\IDConfigDB\Hardware" "Profiles\0001 /v HwProfileGuid /t REG_SZ /d {%random%-%random%-%random%-%random%-%random%} /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\SystemInformation /v ComputerHardwareId /t REG_SZ /d {%random%-s%random%-%random%-%random%-%random%} /f
REG ADD HKLM\SYSTEM\HardwareConfig /v LastConfig /t REG_SZ /d {eac%random%} /f
REG ADD HKLM\SYSTEM\HardwareConfig /v LastConfig /t REG_SZ /d {fefefee%random%-%random%-%random%-%random%} /f
REG ADD HKLM\Software\Microsoft\Windows NT\CurrentVersion /v InstallDate /t REG_SZ /d %random% /f
REG ADD HKLM\Software\Microsoft\Windows NT\CurrentVersion /v ProductId /t REG_SZ /d %random% /f
REG ADD HKLM\System\CurrentControlSet\Control\SystemInformation /v ComputerHardwareId /t REG_SZ /d %random% /f
REG ADD HKLM\System\CurrentControlSet\Control\WMI\Security /v 671a8285-4edb-4cae-99fe-69a15c48c0bc /t REG_SZ /d %random% /f

echo Dados HWID mudados :D

echo Deletando serviços.
echo Deletando serviços..
echo Deletando serviços...

REG DELETE "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f
REG DELETE "HKEY_CURRENT_USER\Software\7-Zip\FM" /F
REG DELETE "HKEY_CURRENT_USER\Software\WinRAR\ArcHistory" /F
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /F
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /F
REG DELETE "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\CIDSizeMRU" /F
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppLaunch" /F
REG DELETE "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /F
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\ShowJumpView" /F
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched" /F
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam" /F
REG DELETE "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSLicensing\HardwareID" /f

echo Servicos deletados :D

echo Modificando dados de registros.
echo Modificando dados de registros..
echo Modificando dados de registros...

REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\StillImage\Events\Connected" /v GUID /t REG_SZ /d "{A28BBADE-%Hex1%-%Hex0%-%Hex1%-00%Hex10%}" /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\StillImage\Events\Disconnected" /v GUID /t REG_SZ /d "{143E4E83-%Hex1%-%Hex0%-%Hex1%-00%Hex10%}" /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\StillImage\Events\EmailImage" /v GUID /t REG_SZ /d "{C66DCEE1-%Hex1%-%Hex0%-%Hex1%-2F%Hex10%}" /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\StillImage\Events\FaxImage" /v GUID /t REG_SZ /d "{C00EB793-%Hex1%-%Hex0%-%Hex1%-00%Hex10%}" /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\StillImage\Events\PrintImage" /v GUID /t REG_SZ /d "{B441F425-%Hex1%-%Hex0%-%Hex1%-00%Hex10%}" /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\StillImage\Events\ScanButton" /v GUID /t REG_SZ /d "{A6C5A715-%Hex1%-%Hex0%-%Hex1%-00%Hex10%}" /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\StillImage\Events\STIproxyEvent" /v GUID /t REG_SZ /d "{d711f81f-%Hex1%-%Hex0%-%Hex1%-92%Hex10%}" /f

echo Alterando nome do computador.
echo Alterando nome do computador..
echo Alterando nome do computador...

wmic computersystem where name="%computername%" call rename="DESKTOP-%random%%random%" >nul 2>nul
wmic useraccount where name='%username%' rename %random% >nul 2>nul

echo Desvinculando o XBOX do computador.
echo Desvinculando o XBOX do computador..
echo Desvinculando o XBOX do computador...

REM "Desvinculando o XBOX"
:folderclean
call :getDiscordVersion
goto :xboxclean
:getDiscordVersion
for /d %%a in ("%appdata%\Discord\*") do (
   set "varLoc=%%a"
   goto :d1
)
:d1
for /f "delims=\ tokens=7" %%z in ('echo %varLoc%') do (
   set "discordVersion=%%z"
)
goto :EOF
:xboxclean

powershell -Command "& {Get-AppxPackage -AllUsers xbox | Remove-AppxPackage}"
sc stop XblAuthManager
sc stop XblGameSave
sc stop XboxNetApiSvc
sc stop XboxGipSvc
sc delete XblAuthManager
sc delete XblGameSave
sc delete XboxNetApiSvc
sc delete XboxGipSvc
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\xbgm" /f
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTask" /disable
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTaskLogon" /disableL
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f
set hostspath=%windir%\System32\drivers\etc\hosts
echo 127.0.0.1 xboxlive.com >> %hostspath%
echo 127.0.0.1 user.auth.xboxlive.com >> %hostspath%
echo 127.0.0.1 presence-heartbeat.xboxlive.com >> %hostspath%

system(skCrypt("ipconfig /release")); -- O código aparecerá no console.
system(skCrypt("ipconfig /release >nul 2>nul")); -- O código não aparecerá no console.
del "%~f0"
echo -
echo -
echo -
echo -
echo Se inscreve e deixa o like para ajudar!
start "" "https://www.youtube.com/channel/UCkQohOaQwvVpVWURNI0jb7g"
echo -
echo ------------------------------------------
echo Sobre:
echo YT: https://www.youtube.com/channel/UCkQohOaQwvVpVWURNI0jb7g [Coutias] | IG: @CoutiasPY
echo Sou Coutias, trabalhei como tecnico de computador entre os meus 13 anos aos meus 20 anos..
echo Fiz esse arquivo para ajudar, entao se poder retribuir com sua inscricao e like em algum video meu, eu serei muito grato!
echo ------------------------------------------
echo Obs 1:
echo Obrigado por ter assistido o video sobre o spoofer gratuito!
echo E tomara que esse arquivo tenha funcionado para voce!
echo Estarei sempre a procura de novas formas e metodos! so que eu preciso de mais conhecimento.
echo ------------------------------------------
echo Obs 2:
echo Esse .bat vai funcionar perfeitamente no windows 10/11 ou superior!
echo Pode usar em windows com versoes inferiores, mais nao e garantido que funcione tudo!
echo ------------------------------------------
echo Creditos: Coutias e ChatGPT
echo ------------------------------------------
echo -
echo -
echo -
echo -

echo PC SPOOFADOOOO
echo puuuffff
del "%~f0"



