# Isaac Lab Training

Reproducible **GPU-parallel reinforcement learning** workspace for [Isaac Lab](https://github.com/isaac-sim/IsaacLab): train **ANYmal-C** velocity tracking and **Franka** reach with **RSL-RL PPO**, tuned for ~**8 GB VRAM** (Windows).

This repo is a thin project layer (scripts, configs, docs). Install **Isaac Sim** / **Isaac Lab** separately — do not treat this as the upstream NVIDIA Isaac Lab repository.

> **Note:** Isaac Gym Preview is legacy. This workspace targets **Isaac Lab** only.

**GitHub About (suggested):** `GPU-parallel RL training workspace for NVIDIA Isaac Lab: ANYmal locomotion + Franka reach with RSL-RL PPO, scripts, and 8GB-VRAM defaults.`  
**Topics:** `isaac-lab` `isaac-sim` `reinforcement-learning` `rsl-rl` `ppo` `robotics` `locomotion` `manipulation` `anymal` `franka`

---

## Quick start

1. Follow every step in **[docs/SETUP.md](docs/SETUP.md)** (Python 3.11, Isaac Sim 5.1, clone + install Isaac Lab).
2. Use **[docs/TRAINING.md](docs/TRAINING.md)** as a printable checklist for verify → train → play.
3. See **[docs/BUILD_STATUS.md](docs/BUILD_STATUS.md)** for what is already installed on this machine vs pending steps.
4. Verify: `scripts\list_envs.bat` and `scripts\smoke_test.bat`
5. Train:
   - Locomotion (flat): `scripts\train_locomotion.bat`
   - Locomotion (rough): `scripts\train_locomotion_rough.bat`
   - Manipulation: `scripts\train_manipulation.bat`
6. Play a checkpoint: see [docs/TRAINING_RESULTS.md](docs/TRAINING_RESULTS.md) for paths from the latest runs.

Shortcut after PyTorch is in the venv: `scripts\install_all.bat` (Isaac Sim pip + Isaac Lab install + smoke test).

Defaults for parallel env count and iterations: [`config/training_defaults.env`](config/training_defaults.env) (tuned for **~8 GB VRAM**).

---

## What you are training

| Pipeline | Task ID | Robot / skill |
|----------|---------|----------------|
| Locomotion (flat) | `Isaac-Velocity-Flat-Anymal-C-v0` | ANYmal-C tracks velocity on flat terrain |
| Locomotion (rough) | `Isaac-Velocity-Rough-Anymal-C-v0` | ANYmal-C on rough terrain (64 envs default) |
| Manipulation | `Isaac-Reach-Franka-v0` | Franka reaches sampled end-effector targets |

Rough-terrain write-up: [docs/TECHNICAL_REPORT_ROUGH_ANYMAL.md](docs/TECHNICAL_REPORT_ROUGH_ANYMAL.md).

Play / eval uses `-Play-v0` variants (see `config/training_defaults.env`).

---

## Project layout

```
isaac-lab-rl-workspace/
├── README.md                 ← this file
├── LICENSE                   ← MIT (this repo’s scripts/docs)
├── docs/
│   ├── SETUP.md
│   ├── TRAINING.md
│   ├── TRAINING_RESULTS.md   ← checkpoints, timings, play commands
│   ├── BUILD_STATUS.md
│   └── WINDOWS_LONG_PATH.md
├── config/
│   └── training_defaults.env
├── scripts/
│   ├── install_all.bat
│   ├── install_isaacsim_short.bat
│   ├── clone_isaaclab_short.bat
│   ├── train_locomotion.bat / train_manipulation.bat
│   └── play_*.bat, list_envs.bat, smoke_test.bat
│
│  Install roots (config/training_defaults.env):
│    C:\Isaac\IsaacLab\
│    C:\Isaac\env_isaaclab\
```

Logs and checkpoints appear under **`C:\Isaac\IsaacLab\logs\rsl_rl\`** after training.

---

## Helper scripts

| Script | Purpose |
|--------|---------|
| `setup_venv.bat` | Create `env_isaaclab` with Python 3.11 |
| `install_isaacsim_short.bat` | PyTorch + Isaac Sim into `C:\Isaac\env_isaaclab` (fixes long paths) |
| `clone_isaaclab_short.bat` | Clone Isaac Lab to `C:\Isaac\IsaacLab` |
| `clone_isaaclab.bat` | Clone official Isaac Lab repo |
| `install_isaaclab.bat` | Run `isaaclab.bat --install` |
| `install_all.bat` | Isaac Sim (if needed) + Isaac Lab + list_envs + smoke test |
| `repair_venv.bat` | Restore torch 2.7, numpy 1.26, rsl-rl-lib 3.1.2, tensordict 0.7.2 |
| `list_envs.bat` | List registered Gym tasks |
| `smoke_test.bat` | Parallel Cartpole sanity check |

All train/play scripts activate `C:\Isaac\env_isaaclab` when present and `cd` into `C:\Isaac\IsaacLab` (see `config/training_defaults.env`).

---

## Training loop (conceptual)

1. **Simulation:** Isaac Sim steps `N` independent env clones on GPU.
2. **RL:** RSL-RL PPO collects rollouts, updates actor-critic, writes TensorBoard + `.pt` checkpoints.
3. **Eval:** `play.py` loads a checkpoint and runs the `-Play-v0` env (fewer envs, visualization friendly).

Always use **`--headless`** for training on a laptop GPU to save VRAM unless debugging visuals.

---

## Success criteria

- [x] Smoke test / sim env loads (headless Cartpole)
- [x] Locomotion training (1500 iter @ 128 envs, ~22 min) — see [docs/TRAINING_RESULTS.md](docs/TRAINING_RESULTS.md)
- [x] Manipulation training (1000 iter @ 128 envs, ~12 min)
- [x] Rough-terrain locomotion (1000 iter @ 64 envs, ~24 min)
- [x] Checkpoints + play scripts verified (headless)

Working **`num_envs` on this PC:** **128** in [config/training_defaults.env](config/training_defaults.env).

---

## Optional next steps

- Longer rough training / curriculum analysis — see [docs/TECHNICAL_REPORT_ROUGH_ANYMAL.md](docs/TECHNICAL_REPORT_ROUGH_ANYMAL.md)
- **Pick and lift:** `Isaac-Lift-Cube-Franka-v0`
- **Humanoid / loco-manipulation stacks:** NVIDIA [WBC-AGILE](https://github.com/nvidia-isaac/WBC-AGILE) or LeggedManip Lab (heavier GPU/RAM)

---

## Links

- [Isaac Lab documentation](https://isaac-sim.github.io/IsaacLab/main/index.html)
- [Isaac Lab GitHub](https://github.com/isaac-sim/IsaacLab)
- [RSL-RL](https://github.com/leggedrobotics/rsl_rl)

---

## License

Copyright © 2026 Ayodele Kolawole (jkay.com@gmail.com) · https://ayokolawole.co.uk

This repository’s project scripts and documentation are licensed under the [MIT License](LICENSE).

NVIDIA Isaac Sim, Isaac Lab, and related third-party packages remain under their own licenses. Clone and install Isaac Lab separately; do not vendor proprietary Isaac Sim binaries into this repo.
