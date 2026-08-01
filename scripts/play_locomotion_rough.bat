@echo off
setlocal
call "%~dp0_common.bat" || exit /b 1

if "%~1"=="" (
  echo Usage: play_locomotion_rough.bat ^<path-to-checkpoint.pt^> [extra args]
  exit /b 1
)

echo Playing rough locomotion: %ROUGH_LOCOMOTION_PLAY_TASK%
echo checkpoint=%~1 num_envs=%PLAY_NUM_ENVS%

call "%~dp0run_isaaclab_py.bat" scripts/reinforcement_learning/rsl_rl/play.py ^
  --task %ROUGH_LOCOMOTION_PLAY_TASK% ^
  --num_envs %PLAY_NUM_ENVS% ^
  --checkpoint "%~1" ^
  %2 %3 %4 %5 %6 %7 %8 %9

endlocal
