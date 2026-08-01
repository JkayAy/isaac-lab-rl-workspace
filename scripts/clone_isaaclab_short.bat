@echo off
setlocal
set "ISAAC_ROOT=C:\Isaac"
if not exist "%ISAAC_ROOT%" mkdir "%ISAAC_ROOT%"

if exist "%ISAAC_ROOT%\IsaacLab\isaaclab.bat" (
  echo Isaac Lab already at %ISAAC_ROOT%\IsaacLab
  exit /b 0
)

where git >nul 2>&1 || (echo git not found & exit /b 1)
git clone --depth 1 --branch v2.3.2 https://github.com/isaac-sim/IsaacLab.git "%ISAAC_ROOT%\IsaacLab"
if errorlevel 1 exit /b 1
echo Checked out Isaac Lab v2.3.2 (Isaac Sim 5.1 + Python 3.11).
endlocal
