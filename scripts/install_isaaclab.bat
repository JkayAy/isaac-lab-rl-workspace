@echo off
setlocal
call "%~dp0install_isaaclab_manual.bat"
if errorlevel 1 exit /b 1
echo.
echo If upstream isaaclab.bat works on your machine, you can alternatively run:
echo   cd C:\Isaac\IsaacLab ^&^& isaaclab.bat --install rsl_rl
endlocal
