@echo off
setlocal
set "WORKSPACE_ROOT=%~dp0.."
for %%I in ("%WORKSPACE_ROOT%") do set "WORKSPACE_ROOT=%%~fI"
cd /d "%WORKSPACE_ROOT%"

if not exist "env_isaaclab\Scripts\activate.bat" (
  echo Run scripts\setup_venv.bat first.
  exit /b 1
)
call env_isaaclab\Scripts\activate.bat

echo Installing PyTorch cu128...
pip install -U torch==2.7.0 torchvision==0.22.0 --index-url https://download.pytorch.org/whl/cu128
if errorlevel 1 exit /b 1

echo Installing Isaac Sim 5.1.0 (this may take a long time)...
pip install "isaacsim[all,extscache]==5.1.0" --extra-index-url https://pypi.nvidia.com
if errorlevel 1 exit /b 1

echo Isaac Sim pip install finished.
endlocal
