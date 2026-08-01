@echo off
setlocal
call "%~dp0_common.bat" || exit /b 1

set "NUM=%~1"
if "%NUM%"=="" set "NUM=16"

echo Smoke test: Isaac-Cartpole-v0 with %NUM% parallel envs...
call "%~dp0run_isaaclab_py.bat" scripts/environments/random_agent.py --task Isaac-Cartpole-v0 --num_envs %NUM% --headless
endlocal
