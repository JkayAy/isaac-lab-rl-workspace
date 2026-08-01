# Technical report: Rough-terrain ANYmal-C locomotion (Isaac Lab)

**Author:** Ayodele Kolawole · M.Sc Artificial Intelligence  
**Contact:** jkay.com@gmail.com · https://ayokolawole.co.uk  
**Project:** [isaac-lab-rl-workspace](https://github.com/JkayAy/isaac-lab-rl-workspace)  
**Date:** 2026-08-01  
**Hardware:** RTX 5060 Laptop, 8 GB VRAM · Windows 11  
**Stack:** Isaac Sim 5.1 · Isaac Lab v2.3.2 · RSL-RL PPO (`rsl-rl-lib 3.1.2`)

---

## 1. Motivation

Flat-terrain velocity tracking (`Isaac-Velocity-Flat-Anymal-C-v0`) validates that GPU-parallel PPO training works on this machine. Rough terrain is the natural stretch: contact-rich dynamics, terrain curriculum, and a closer match to research themes in labs such as ETH RSL (sim-to-real legged locomotion).

**Question:** Can the same 8 GB laptop pipeline train a rough-terrain ANYmal-C policy to completion without OOM, and what does the learning curve imply about remaining failure modes?

---

## 2. Method

| Item | Setting |
|------|---------|
| Task | `Isaac-Velocity-Rough-Anymal-C-v0` |
| Play task | `Isaac-Velocity-Rough-Anymal-C-Play-v0` |
| Algorithm | RSL-RL PPO (task default runner cfg) |
| `num_envs` | **64** (lower than flat’s 128; rough meshes are heavier) |
| `max_iterations` | **1000** |
| Seed | `0` |
| Mode | Headless |

**Scripts:** `scripts/train_locomotion_rough.bat`, `scripts/play_locomotion_rough.bat`  
**Defaults:** `config/training_defaults.env` (`ROUGH_*` keys)

Training command (via wrapper):

```bat
scripts\train_locomotion_rough.bat
```

---

## 3. Results

| Metric | Value |
|--------|--------|
| Wall-clock training time | **~1453 s (~24 min)** learning time reported by runner |
| Final iteration | **999 / 1000** |
| Final mean reward | **~−0.43** |
| Mean episode length (final) | **~22** steps (short) |
| Throughput (late iters) | **~1100–1150** steps/s |
| Log dir | `C:\Isaac\IsaacLab\logs\rsl_rl\anymal_c_rough\2026-08-01_01-23-11` |
| Checkpoint | `...\2026-08-01_01-23-11\model_999.pt` |

### Learning dynamics (qualitative)

- Early iterations: mean reward dropped from about **−0.3** toward **−5** (exploration / falls).
- Mid–late training: recovered toward about **−0.4** by iteration 999.
- Compared with flat terrain (final mean reward **~+1.6** after 1500 iters @ 128 envs), rough terrain remains **much harder** under this budget.

### Failure-mode signals (final logs)

- `Episode_Termination/base_contact ≈ 1.0` — episodes still end predominantly by base collision (falls), not timeouts.
- `Curriculum/terrain_levels ≈ 0.0` — terrain curriculum did not advance under this run.
- Short episode lengths indicate the policy has **not** yet achieved stable rough locomotion.

**Honest takeaway:** the experiment **succeeds as a systems result** (full 1000-iter rough PPO run on 8 GB VRAM). It does **not** yet demonstrate a high-performing rough walker; longer training, more envs if VRAM allows, or curriculum/reward tuning is required.

---

## 4. Limitations

1. **Budget:** 1000 iterations at 64 envs is a stretch demo, not a paper-grade ablation suite.
2. **No novel algorithm:** standard Isaac Lab task + RSL-RL defaults.
3. **No GUI/play video** attached here (viewport crashes observed earlier on this laptop); evaluation is log-based.
4. **Checkpoints not in git** (large binaries); paths documented for local replay only.
5. **Single seed** — no statistical multi-seed comparison.

---

## 5. Next research question

> How should terrain curriculum, observation (height scan / proprioception), and training budget be co-designed so that base-contact terminations drop and terrain levels advance on consumer GPU hardware?

Concrete follow-ups:

1. Retrain rough with **2000–5000** iterations; plot reward, episode length, and `terrain_levels`.
2. Ablate **`num_envs` ∈ {32, 64, 96}** under fixed VRAM.
3. Transfer flat checkpoint as init vs train-from-scratch on rough.
4. Optional: Franka lift as a second contact-rich baseline.

---

## 6. Reproducibility

```bat
scripts\train_locomotion_rough.bat
scripts\play_locomotion_rough.bat C:\Isaac\IsaacLab\logs\rsl_rl\anymal_c_rough\2026-08-01_01-23-11\model_999.pt --headless
```

See also [TRAINING_RESULTS.md](TRAINING_RESULTS.md) and [PHD_PORTFOLIO.md](PHD_PORTFOLIO.md).
