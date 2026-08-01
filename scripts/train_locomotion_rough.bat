@echo off
setlocal
call "%~dp0_common.bat" || exit /b 1

echo Training rough locomotion: %ROUGH_LOCOMOTION_TASK%
echo num_envs=%ROUGH_LOCOMOTION_NUM_ENVS% max_iterations=%ROUGH_LOCOMOTION_MAX_ITERATIONS% seed=%SEED%
echo Extra args: %*

call "%~dp0run_isaaclab_py.bat" scripts/reinforcement_learning/rsl_rl/train.py ^
  --task %ROUGH_LOCOMOTION_TASK% ^
  --num_envs %ROUGH_LOCOMOTION_NUM_ENVS% ^
  --max_iterations %ROUGH_LOCOMOTION_MAX_ITERATIONS% ^
  --seed %SEED% ^
  --headless ^
  %*

endlocal
