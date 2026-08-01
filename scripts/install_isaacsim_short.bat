@echo off
setlocal
set "ISAAC_ROOT=C:\Isaac"
if not exist "%ISAAC_ROOT%" mkdir "%ISAAC_ROOT%"

where py >nul 2>&1 || (echo Install Python 3.11 first. & exit /b 1)
py -3.11 --version >nul 2>&1 || (echo Python 3.11 missing. & exit /b 1)

if not exist "%ISAAC_ROOT%\env_isaaclab\Scripts\python.exe" (
  echo Creating %ISAAC_ROOT%\env_isaaclab ...
  py -3.11 -m venv "%ISAAC_ROOT%\env_isaaclab"
)
call "%ISAAC_ROOT%\env_isaaclab\Scripts\activate.bat"
python -m pip install --upgrade pip

echo Installing PyTorch...
pip install -U torch==2.7.0 torchvision==0.22.0 --index-url https://download.pytorch.org/whl/cu128
if errorlevel 1 exit /b 1

echo Installing Isaac Sim 5.1.0 to short path venv...
pip install "isaacsim[all,extscache]==5.1.0" --extra-index-url https://pypi.nvidia.com
if errorlevel 1 (
  echo.
  echo If WinError 206 persists, enable long paths and reboot — see docs\WINDOWS_LONG_PATH.md
  exit /b 1
)
echo Success.
endlocal
