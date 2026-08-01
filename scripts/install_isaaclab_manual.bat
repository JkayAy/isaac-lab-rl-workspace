@echo off
REM Manual Isaac Lab install when isaaclab.bat --install fails on Windows pip setups.
REM Prerequisites: Isaac Sim in C:\Isaac\env_isaaclab, Isaac Lab v2.3.2 at C:\Isaac\IsaacLab

setlocal
call "%~dp0_common.bat" || exit /b 1

echo Installing wheel, torchaudio, flatdict 4.1.0...
python -m pip install wheel setuptools --upgrade
python -m pip install torchaudio==2.7.0 --index-url https://download.pytorch.org/whl/cu128
python -m pip install flatdict==4.1.0
python -m pip install prettytable==3.3.0 hidapi==0.14.0.post2 gymnasium==1.2.1 "pyglet<2" transformers==4.57.6 einops warp-lang starlette==0.49.1

set "SRC=%ISAACLAB_PATH%\source"
for %%M in (isaaclab isaaclab_assets isaaclab_tasks isaaclab_rl isaaclab_mimic isaaclab_contrib) do (
  echo === pip install -e %%M ===
  if /I "%%M"=="isaaclab" (
    python -m pip install -e "%SRC%\%%M" --no-deps
  ) else (
    python -m pip install -e "%SRC%\%%M"
  )
)

python -m pip install "rsl-rl-lib==3.1.2" "onnxscript>=0.5" "packaging<24"
python -m pip install tensordict==0.7.2 --no-deps
echo Manual Isaac Lab install finished.
endlocal
