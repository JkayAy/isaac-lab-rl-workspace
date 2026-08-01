# Training checklist

Use after [SETUP.md](SETUP.md). **Latest run results:** [TRAINING_RESULTS.md](TRAINING_RESULTS.md).

## One-time setup

- [x] Step 1: Long paths enabled (SETUP.md Step 1)
- [x] Step 2: Python 3.11 installed (`py -3.11 --version`)
- [x] Step 3: Short-path venv `C:\Isaac\env_isaaclab`
- [x] Step 4: Isaac Sim 5.1 pip (`scripts\install_isaacsim_short.bat`)
- [x] Step 5: Isaac Lab v2.3.2 (`scripts\clone_isaaclab_short.bat`)
- [x] Step 6: `scripts\install_isaaclab_manual.bat` / `repair_venv.bat` if needed
- [x] Step 7: `scripts\list_envs.bat` + `scripts\smoke_test.bat`

## Locomotion (ANYmal-C)

- [x] `config/training_defaults.env`: 128 envs, 1500 iterations
- [x] `scripts\train_locomotion.bat`
- [x] Checkpoint: `C:\Isaac\IsaacLab\logs\rsl_rl\anymal_c_flat\2026-07-28_09-07-24\model_1499.pt`
- [x] `scripts\play_locomotion.bat <checkpoint>` (headless or GUI)

## Manipulation (Franka reach)

- [x] `config/training_defaults.env`: 128 envs, 1000 iterations
- [x] `scripts\train_manipulation.bat`
- [x] Checkpoint: `C:\Isaac\IsaacLab\logs\rsl_rl\franka_reach\2026-07-28_09-44-33\model_999.pt`
- [x] `scripts\play_manipulation.bat <checkpoint>`

## Record results here

| Run | Task | num_envs | max_iter | Checkpoint path | Notes |
|-----|------|----------|----------|-----------------|-------|
| 2026-07-28 | Locomotion | 128 | 1500 | `...\anymal_c_flat\2026-07-28_09-07-24\model_1499.pt` | ~22 min, mean reward ~1.6 |
| 2026-07-28 | Manipulation | 128 | 1000 | `...\franka_reach\2026-07-28_09-44-33\model_999.pt` | ~12 min |

## Stretch goals

- [ ] `Isaac-Velocity-Rough-Anymal-C-v0` (lower envs)
- [ ] `Isaac-Lift-Cube-Franka-v0`
