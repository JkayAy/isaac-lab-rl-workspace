@echo off
REM Restore Isaac Sim 5.1 + Isaac Lab v2.3.2 compatible pins after a bad pip upgrade.
setlocal
call "%~dp0_common.bat" || exit /b 1

echo === PyTorch 2.7 cu128 ===
python -m pip install torch==2.7.0+cu128 torchvision==0.22.0+cu128 torchaudio==2.7.0+cu128 --index-url https://download.pytorch.org/whl/cu128

echo === Isaac Sim / Isaac Lab core pins ===
python -m pip install numpy==1.26.0 packaging==23.0 sympy==1.13.3 typing_extensions==4.12.2 filelock==3.13.1 fsspec==2024.6.1 networkx==3.3 MarkupSafe==2.1.3

echo === RSL-RL stack (Isaac Lab v2.3.2) ===
python -m pip install "rsl-rl-lib==3.1.2" "onnxscript>=0.5" "packaging<24"
python -m pip install tensordict==0.7.2 --no-deps
python -m pip install typing_extensions==4.12.2

echo === Verify ===
python -c "import torch; print('torch', torch.__version__)"
python -c "import numpy; print('numpy', numpy.__version__)"
python -c "import tensordict; print('tensordict', tensordict.__version__)"
python -c "from rsl_rl.runners import OnPolicyRunner; print('rsl_rl ok')"
echo Repair finished.
endlocal
