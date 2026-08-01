# Training results (this machine)

Recorded after Phase 2–3 runs on **RTX 5060 Laptop (8 GB VRAM)**.

## Shared settings

| Setting | Value |
|---------|--------|
| Venv | `C:\Isaac\env_isaaclab` |
| Isaac Lab | `C:\Isaac\IsaacLab` @ **v2.3.2** |
| Isaac Sim | **5.1.0** pip |
| RSL-RL | **rsl-rl-lib 3.1.2**, tensordict **0.7.2** |
| Seed | `0` ([config/training_defaults.env](../config/training_defaults.env)) |
| Parallel envs | **128** (headless training) |

---

## Phase 2 — Locomotion (ANYmal-C flat)

| Field | Value |
|-------|--------|
| Task | `Isaac-Velocity-Flat-Anymal-C-v0` |
| Play task | `Isaac-Velocity-Flat-Anymal-C-Play-v0` |
| Iterations | **1500** |
| Wall time | **~1296 s (~22 min)** |
| Final mean reward (iter 1499) | **~1.60** |
| Log file | [locomotion_train_full.log](../locomotion_train_full.log) |

**Checkpoint (use for play):**

`C:\Isaac\IsaacLab\logs\rsl_rl\anymal_c_flat\2026-07-28_09-07-24\model_1499.pt`

**Play:**

```bat
scripts\play_locomotion.bat C:\Isaac\IsaacLab\logs\rsl_rl\anymal_c_flat\2026-07-28_09-07-24\model_1499.pt --headless
```

TensorBoard (if enabled): under `C:\Isaac\IsaacLab\logs\rsl_rl\anymal_c_flat\2026-07-28_09-07-24\`.

---

## Phase 3 — Manipulation (Franka reach)

| Field | Value |
|-------|--------|
| Task | `Isaac-Reach-Franka-v0` |
| Play task | `Isaac-Reach-Franka-Play-v0` |
| Iterations | **1000** |
| Wall time | **~705 s (~12 min)** |
| Final mean reward (iter 999) | **~-0.71** (task-specific scale; policy trained) |
| Log file | [manipulation_train_full.log](../manipulation_train_full.log) |

**Checkpoint:**

`C:\Isaac\IsaacLab\logs\rsl_rl\franka_reach\2026-07-28_09-44-33\model_999.pt`

**Play:**

```bat
scripts\play_manipulation.bat C:\Isaac\IsaacLab\logs\rsl_rl\franka_reach\2026-07-28_09-44-33\model_999.pt --headless
```

---

## Phase 5 — Success criteria

- [x] Locomotion training ≥100 iterations without OOM (1500 @ 128 envs)
- [x] Manipulation training ≥100 iterations without OOM (1000 @ 128 envs)
- [x] Checkpoints saved under `C:\Isaac\IsaacLab\logs\rsl_rl\`
- [x] Play scripts load checkpoints (headless); use `run_app_gui.bat` for viewport

## Optional next steps

- Increase `num_envs` if `nvidia-smi` shows headroom (512 not recommended on 8 GB).
- **Rough terrain:** `Isaac-Velocity-Rough-Anymal-C-v0`, lower envs.
- **Lift:** `Isaac-Lift-Cube-Franka-v0`.
- Retrain longer or tune rewards if play behavior needs improvement.
