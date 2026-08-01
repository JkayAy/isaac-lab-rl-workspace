@echo off
setlocal
call "%~dp0_common.bat" || exit /b 1

echo Training locomotion: %LOCOMOTION_TASK%
echo num_envs=%LOCOMOTION_NUM_ENVS% max_iterations=%LOCOMOTION_MAX_ITERATIONS% seed=%SEED%
echo Extra args: %*

call "%~dp0run_isaaclab_py.bat" scripts/reinforcement_learning/rsl_rl/train.py ^
  --task %LOCOMOTION_TASK% ^
  --num_envs %LOCOMOTION_NUM_ENVS% ^
  --max_iterations %LOCOMOTION_MAX_ITERATIONS% ^
  --seed %SEED% ^
  --headless ^
  %*

endlocal
