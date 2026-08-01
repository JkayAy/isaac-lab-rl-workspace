# Build and install status

Track what is done on this machine vs what you still need to run locally.

Last updated: 2026-07-28

## Completed in this workspace

| Step | Status | Notes |
|------|--------|--------|
| Project docs | Done | [README.md](../README.md), [SETUP.md](SETUP.md), [TRAINING.md](TRAINING.md), [WINDOWS_LONG_PATH.md](WINDOWS_LONG_PATH.md) |
| Batch scripts | Done | Includes `repair_venv.bat`, `run_isaaclab_py.bat`, `install_isaaclab_manual.bat` |
| Training defaults | Done | [config/training_defaults.env](../config/training_defaults.env) → `C:\Isaac\`, **128 envs** (8 GB VRAM) |
| Python 3.11 | Done | winget 3.11.9 |
| Isaac Sim 5.1 pip | Done | `C:\Isaac\env_isaaclab` |
| Isaac Lab source | Done | `C:\Isaac\IsaacLab` @ **v2.3.2** |
| Isaac Lab packages | Done | Manual editable install |
| **RL stack pin** | Done | `rsl-rl-lib==3.1.2`, `tensordict==0.7.2` (--no-deps), torch **2.7.0+cu128**, numpy **1.26.0** |
| Verify | Done | `list_envs.bat`; Cartpole env loads; **2-iter Anymal PPO** succeeded (see `train_rl_smoke.log`) |

## If pip breaks the venv

```bat
scripts\repair_venv.bat
```

Never run `pip install tensordict --force-reinstall` without `--no-deps` (it can upgrade torch/numpy).

## Verify and train

Phases 2–3 **completed 2026-07-28** — details in [TRAINING_RESULTS.md](TRAINING_RESULTS.md).

```bat
scripts\list_envs.bat
scripts\smoke_test.bat 4
scripts\train_locomotion.bat
scripts\train_manipulation.bat
```

## Version matrix (do not mix)

| Component | Pin |
|-----------|-----|
| Isaac Sim | 5.1.0 pip |
| Python | 3.11 |
| Isaac Lab | **v2.3.2** tag (not `main`) |
| PyTorch | 2.7.0+cu128 |
| RSL-RL | **rsl-rl-lib==3.1.2** |
| tensordict | **0.7.2** (install with `--no-deps` after RSL-RL) |

## Log files

- `isaacsim_install.log` — failed Desktop-path install (WinError 206)
- `isaacsim_install_short.log` — successful install into `C:\Isaac\env_isaaclab`

## One-shot after clone on a new machine

```bat
scripts\install_isaacsim_short.bat
scripts\clone_isaaclab_short.bat
scripts\install_isaaclab_manual.bat
scripts\smoke_test.bat 8
```

Or: `scripts\install_all.bat` (chains the above where possible).
