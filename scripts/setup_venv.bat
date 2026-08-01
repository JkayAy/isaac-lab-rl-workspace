@echo off
setlocal
set "WORKSPACE_ROOT=%~dp0.."
for %%I in ("%WORKSPACE_ROOT%") do set "WORKSPACE_ROOT=%%~fI"
cd /d "%WORKSPACE_ROOT%"

where py >nul 2>&1
if errorlevel 1 (
  echo ERROR: Python launcher 'py' not found. Install Python 3.11 from python.org or winget.
  exit /b 1
)

py -3.11 --version >nul 2>&1
if errorlevel 1 (
  echo ERROR: Python 3.11 not found. Run: winget install Python.Python.3.11
  exit /b 1
)

if exist "env_isaaclab\Scripts\python.exe" (
  echo Virtual env already exists at env_isaaclab
  exit /b 0
)

echo Creating env_isaaclab with Python 3.11...
py -3.11 -m venv env_isaaclab
call env_isaaclab\Scripts\activate.bat
python -m pip install --upgrade pip
echo Done. Activate with: env_isaaclab\Scripts\activate.bat
endlocal
