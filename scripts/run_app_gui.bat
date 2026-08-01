@echo off
REM Isaac Lab with viewport (heavier on GPU). Stop with Ctrl+C.
setlocal
call "%~dp0_common.bat" || exit /b 1
set "N=%~1"
if "%N%"=="" set "N=4"
echo GUI smoke test: Isaac-Cartpole-v0, %N% envs...
"%ISAACLAB_PYTHON%" scripts/environments/random_agent.py --task Isaac-Cartpole-v0 --num_envs %N%
endlocal
