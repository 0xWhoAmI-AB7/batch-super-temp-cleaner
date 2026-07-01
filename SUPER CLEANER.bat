@echo off
chcp 65001 >nul
title Super Cleaner  By : Abdera7man (AB7)
mode con: cols=110 lines=10
Reg.exe add "HKCU\CONSOLE" /v "VirtualTerminalLevel" /t REG_DWORD /d "1" /f  > nul
color 5

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
cls
echo.
echo.
echo                                      DON'T FORGET TO RUN AS ADMINISTRATOR !
echo.
echo                                 ╔═══════════════════════════════════════════════╗
echo                                 ║                     DONE !                    ║
echo                                 ║        The Clean has Finished sucsesfuly !    ║
echo                                 ║       Press SPACE botton in order to exit     ║
echo                                 ╚═══════════════════════════════════════════════╝
pause > nul