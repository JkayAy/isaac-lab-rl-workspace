@echo off
REM No setlocal — must persist cd and venv activation for caller.

set "WORKSPACE_ROOT=%~dp0.."
for %%I in ("%WORKSPACE_ROOT%") do set "WORKSPACE_ROOT=%%~fI"

if not exist "%WORKSPACE_ROOT%\config\training_defaults.env" (
  echo ERROR: Missing config\training_defaults.env
  exit /b 1
)

for /f "usebackq tokens=1,* delims==" %%A in (`findstr /v /b /c:"REM" "%WORKSPACE_ROOT%\config\training_defaults.env"`) do (
  if not "%%A"=="" set "%%A=%%B"
)

set "ISAACLAB_PATH=%ISAACLAB_DIR%"
if /I not "%ISAACLAB_DIR:~0,3%"=="C:\" if /I not "%ISAACLAB_DIR:~0,3%"=="D:\" (
  set "ISAACLAB_PATH=%WORKSPACE_ROOT%\%ISAACLAB_DIR%"
)

if not exist "%ISAACLAB_PATH%\isaaclab.bat" (
  echo ERROR: Isaac Lab not found at %ISAACLAB_PATH%
  echo Run scripts\clone_isaaclab_short.bat — see docs\SETUP.md Step 5.
  exit /b 1
)

set "VENV_PATH=%VENV_DIR%"
if /I not "%VENV_DIR:~0,3%"=="C:\" if /I not "%VENV_DIR:~0,3%"=="D:\" (
  set "VENV_PATH=%WORKSPACE_ROOT%\%VENV_DIR%"
)

if exist "%VENV_PATH%\Scripts\activate.bat" (
  call "%VENV_PATH%\Scripts\activate.bat"
) else (
  echo WARNING: Virtual env not found at %VENV_PATH%. Using current Python on PATH.
)

cd /d "%ISAACLAB_PATH%"
set "ISAACLAB_PYTHON=%VENV_PATH%\Scripts\python.exe"
if not exist "%ISAACLAB_PYTHON%" set "ISAACLAB_PYTHON=python"

REM Required for non-interactive Isaac Sim / Kit (see docs/SETUP.md)
set "OMNI_KIT_ACCEPT_EULA=YES"

exit /b 0
