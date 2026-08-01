@echo off
setlocal
call "%~dp0_common.bat" || exit /b 1

echo Listing registered Isaac Lab environments...
call "%~dp0run_isaaclab_py.bat" scripts/environments/list_envs.py
endlocal
