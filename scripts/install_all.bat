@echo off
REM Run remaining install steps after venv + PyTorch exist.
REM Isaac Sim pip may take 30+ minutes.

setlocal
set "WORKSPACE_ROOT=%~dp0.."
for %%I in ("%WORKSPACE_ROOT%") do set "WORKSPACE_ROOT=%%~fI"
cd /d "%WORKSPACE_ROOT%"

echo === Step A: Short-path Isaac Sim (C:\Isaac) ===
if not exist "C:\Isaac\IsaacLab\isaaclab.bat" call scripts\clone_isaaclab_short.bat
C:\Isaac\env_isaaclab\Scripts\python.exe -c "import isaacsim" 2>nul
if errorlevel 1 (
  call scripts\install_isaacsim_short.bat
  if errorlevel 1 exit /b 1
) else (
  echo isaacsim already importable in C:\Isaac\env_isaaclab
)

echo === Step B: Isaac Lab extensions ===
call scripts\install_isaaclab.bat
if errorlevel 1 exit /b 1

echo === Step C: Verify ===
call scripts\list_envs.bat
call scripts\smoke_test.bat 16

echo === Done. Train with scripts\train_locomotion.bat ===
endlocal
