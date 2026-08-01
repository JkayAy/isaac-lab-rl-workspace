@echo off
setlocal
set "WORKSPACE_ROOT=%~dp0.."
for %%I in ("%WORKSPACE_ROOT%") do set "WORKSPACE_ROOT=%%~fI"
cd /d "%WORKSPACE_ROOT%"

if exist "IsaacLab\isaaclab.bat" (
  echo IsaacLab already cloned at IsaacLab\
  exit /b 0
)

where git >nul 2>&1
if errorlevel 1 (
  echo ERROR: git not found. Install Git for Windows.
  exit /b 1
)

git clone https://github.com/isaac-sim/IsaacLab.git IsaacLab
if errorlevel 1 exit /b 1
echo Clone complete.
endlocal
