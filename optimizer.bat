@echo off
title MULTI TOOL  BY:AB7
chcp 65001 >nul
mode con: cols=150 lines=35
:: Enabling ANSI Escape Sequences
Reg.exe add "HKCU\CONSOLE" /v "VirtualTerminalLevel" /t REG_DWORD /d "1" /f  > nul
:MENU
cls
color d
echo.
echo.
echo.
echo.
echo                         █████╗ ██████╗ ███████╗      ███╗   ███╗██╗   ██╗██╗  ████████╗██╗    ████████╗ ██████╗  ██████╗ ██╗    
echo                        ██╔══██╗██╔══██╗╚════██║      ████╗ ████║██║   ██║██║  ╚══██╔══╝██║    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     
echo                        ███████║██████╔╝    ██╔╝█████╗██╔████╔██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║     
echo                        ██╔══██║██╔══██╗   ██╔╝ ╚════╝██║╚██╔╝██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║     
echo                        ██║  ██║██████╔╝   ██║        ██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║       ██║   ╚██████╔╝╚██████╔╝███████╗
echo                        ╚═╝  ╚═╝╚═════╝    ╚═╝        ╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝
echo.
echo.
echo.
echo                                                  ╔═══════════════════════════════════════════════╗
echo                                                  ║      [1]  clean all temp files.               ║
echo                                                  ║      [2]  memory . GPU . CPU optimize.        ║
echo                                                  ║      [3]  network optimazation.               ║
echo                                                  ║      [0]  Exit.                               ║
echo                                                  ║      [m]  About ME.                           ║
echo                                                  ╚═══════════════════════════════════════════════╝
echo.
set /p choice=# Choose an option 0-13 :
if "%choice%"=="1" goto clean
if "%choice%"=="2" goto hardware
if "%choice%"=="3" goto net
if "%choice%"=="m" goto me
goto MENU
:hardware
cls
echo Optimizing memory...
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=4096,MaximumSize=8192
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 1 /f

cls

cls
pause > nul
echo [1] Optimize AMD GPUs
echo [2] Optimize NVIDIA GPUs
set /p gpuChoice=Choose GPU brand  1  or  2: 
if "%gpuChoice%"=="1" (
  echo Applying AMD GPUs...
  reg add "HKLM\SOFTWARE\AMD\Settings" /v Tessellation /t REG_DWORD /d 0 /f
  reg add "HKLM\SOFTWARE\AMD\Settings" /v ChillEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdkmdag" /v EnableUlps /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\explorer.exe" /t REG_SZ /d "GpuPreference=2;" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v OverlayTestMode /t REG_DWORD /d 5 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 2 /f

)
if "%gpuChoice%"=="2" (
  echo Applying NVIDIA GPUs...
  reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v EnableACPI /t REG_DWORD /d 0 /f
  reg add "HKCU\Software\NVIDIA Corporation\Global" /v ShaderCache /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\explorer.exe" /t REG_SZ /d "GpuPreference=2;" /f
del /q /s "%LocalAppData%\NVIDIA\DXCache\*.*"
del /q /s "%LocalAppData%\NVIDIA\GLCache\*.*"
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v OverlayTestMode /t REG_DWORD /d 5 /f

)

cls
pause > nul
echo [1] AMD CPUs
echo [2] Intel CPUs
set /p cpuChoice=Choose CPU brand 1 or 2: 
if "%cpuChoice%"=="1" (
  echo Applying AMD CPU op ...
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v EnergyEstimationEnabled /t REG_DWORD /d 0 /f
  bcdedit /set useplatformclock true
powercfg -setacvalueindex scheme_current sub_processor PERFBOOSTMODE 0
powercfg -setacvalueindex scheme_current sub_processor PROCTHROTTLEMAX 100
bcdedit /set disabledynamictick yes
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdppm" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "Attributes" /t REG_DWORD /d 0 /f
powercfg -setacvalueindex scheme_current sub_processor CPMINCORES 100
powercfg -setactive scheme_current
)
if "%cpuChoice%"=="2" (
  echo Applying Intel CPU op...
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v ProcessorEnergyPerformancePreference /t REG_DWORD /d 0 /f
  bcdedit /set useplatformtick yes
powercfg -setacvalueindex scheme_current sub_processor PERFBOOSTMODE 0
powercfg -setacvalueindex scheme_current sub_processor PROCTHROTTLEMAX 100
bcdedit /set disabledynamictick yes
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "Attributes" /t REG_DWORD /d 0 /f
powercfg -setacvalueindex scheme_current sub_processor CPMINCORES 100
powercfg -setactive scheme_current

)

cls
goto MENU

pause > nul


:clean
cls
echo Cleaning system...
del /s /f /q %windir%\temp\*.*    
rd /s /q %windir%\temp    
md %windir%\temp    
del /s /f /q %windir%\Prefetch\*.*    
rd /s /q %windir%\Prefetch    
md %windir%\Prefetch    
del /s /f /q %windir%\system32\dllcache\*.*    
rd /s /q %windir%\system32\dllcache    
md %windir%\system32\dllcache    
del /s /f /q "%SysteDrive%\Temp"\*.*    
rd /s /q "%SysteDrive%\Temp"    
md "%SysteDrive%\Temp"    
del /s /f /q %temp%\*.*    
rd /s /q %temp%    
md %temp%    
del /s /f /q "%USERPROFILE%\Local Settings\History"\*.*    
rd /s /q "%USERPROFILE%\Local Settings\History"    
md "%USERPROFILE%\Local Settings\History"    
del /s /f /q "%USERPROFILE%\Local Settings\Temporary Internet Files"\*.*    
rd /s /q "%USERPROFILE%\Local Settings\Temporary Internet Files"    
md "%USERPROFILE%\Local Settings\Temporary Internet Files"    
del /s /f /q "%USERPROFILE%\Local Settings\Temp"\*.*    
rd /s /q "%USERPROFILE%\Local Settings\Temp"    
md "%USERPROFILE%\Local Settings\Temp"    
del /s /f /q "%USERPROFILE%\Recent"\*.*    
rd /s /q "%USERPROFILE%\Recent"    
md "%USERPROFILE%\Recent"    
del /s /f /q "%USERPROFILE%\Cookies"\*.*    
rd /s /q "%USERPROFILE%\Cookies"    
md "%USERPROFILE%\Cookies"
del /f /s /q %TEMP%\*
del /f /s /q C:\Windows\Temp\*
del /f /s /q %SystemRoot%\Prefetch\*
del /f /q "%APPDATA%\Microsoft\Windows\Recent\*"
del /f /q "%APPDATA%\Microsoft\Windows\Explorer\thumbcache_*.db"
pause > nul
cls 
goto MENU

:me
cls
echo.
color 2
echo ╔══════════ ABOUT ME ═════════╗
echo ║ MULTI TOOL v1               ║
echo ║ AB7                         ║
echo ║ DM:                         ║
echo ║ . Discord:                  ║
echo ║ . Email:                    ║
echo ╚═════════════════════════════╝
pause
goto MENU

:MENU
cls
echo.
echo Done.
pause
goto MENU