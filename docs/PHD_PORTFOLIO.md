# PhD Portfolio Package — GPU-Parallel Robot Learning (Isaac Lab)

Use this as source material for applications to **funded robotics / robot learning / sim-to-real RL** PhD programs. Tailor advisor names, lab themes, and geographic preferences before submitting.

---

## 1. CV bullets (pick 3–5)

### Research / project (preferred framing)

- Built an end-to-end **GPU-parallel reinforcement learning** pipeline in **NVIDIA Isaac Lab / Isaac Sim 5.1**, training policies with **128 concurrent physics environments** on a consumer GPU (**RTX 5060 Laptop, 8 GB VRAM**).
- Trained **RSL-RL PPO** locomotion policies for **ANYmal-C** velocity tracking (`Isaac-Velocity-Flat-Anymal-C-v0`) to **1500 iterations (~22 min)** and manipulation policies for **Franka reach** (`Isaac-Reach-Franka-v0`) to **1000 iterations (~12 min)**; produced reproducible checkpoints and evaluation scripts.
- Diagnosed and resolved production-style stack failures on Windows (path-length limits, dependency pin conflicts between `rsl-rl-lib` / `tensordict` / PyTorch, Kit process crashes), documenting a **pinned, repairable environment** for repeatable training.
- Authored a reproducible research workspace (setup docs, training checklists, version matrix, train/play automation) suitable for onboarding collaborators onto Isaac Lab RL experiments.

### Shorter one-liner variants

- **Systems ML:** Delivered a pinned Isaac Lab + RSL-RL stack and trained multi-task GPU-parallel policies (quadruped locomotion + arm reach) under 8 GB VRAM constraints.
- **Robotics:** Implemented parallel-sim RL for legged locomotion and robotic manipulation with logged metrics, checkpoints, and headless evaluation workflows.

### Skills keywords (CV Skills line)

`Isaac Lab` · `Isaac Sim` · `GPU-parallel RL` · `PPO` · `RSL-RL` · `PyTorch` · `ANYmal` · `Franka` · `locomotion` · `manipulation` · `Windows research systems` · `reproducible ML`

---

## 2. Statement of Purpose paragraph (~180–220 words)

Paste into the research-experience / preparation section; adjust the first and last sentences to match each program’s themes.

> My preparation for doctoral research centers on building reliable robot-learning systems rather than only consuming pretrained demos. I designed and operated a GPU-parallel reinforcement learning workspace on NVIDIA Isaac Lab (Isaac Sim 5.1, Isaac Lab v2.3.2, RSL-RL PPO), training policies across hundreds of concurrent simulated environments on an 8 GB laptop GPU. Within that constraint I completed locomotion training for ANYmal-C velocity tracking (1500 PPO iterations, ~22 minutes at 128 environments) and manipulation training for Franka end-effector reach (1000 iterations, ~12 minutes), with checkpoints, logs, and play scripts for evaluation. Equally important was the engineering path to those results: diagnosing Windows path-length failures, pinning incompatible RL dependency graphs, and recovering a broken virtual environment so training remained reproducible. This experience clarified my research interest in **sample-efficient, scalable robot learning in high-fidelity simulation**—especially locomotion under contact-rich dynamics, manipulation under goal-conditioned rewards, and the systems questions that determine whether parallel simulation actually accelerates learning. I am seeking a PhD where I can extend this foundation toward domain randomization, sim-to-real transfer, and multi-skill robot policies under the guidance of a lab already working at the intersection of robotics and deep RL.

### Optional closing sentence (swap by lab)

- **Locomotion lab:** …particularly rough-terrain locomotion, perceptive walking, and robust whole-body control.
- **Manipulation lab:** …particularly contact-rich manipulation, grasp-to-place pipelines, and vision-conditioned policies.
- **Sim-to-real lab:** …particularly bridging GPU-parallel training with domain randomization and hardware validation.

---

## 3. One-page research summary

**Title:** GPU-Parallel Reinforcement Learning for Locomotion and Manipulation in Isaac Lab  
**Candidate:** Ayodele Kolawole  
**Affiliation / contact:** M.Sc Artificial Intelligence · jkay.com@gmail.com · https://ayokolawole.co.uk · https://github.com/JkayAy/isaac-lab-rl-workspace

### Motivation

Modern robot learning depends on **massively parallel simulation**: thousands of environment clones stepped on GPU so PPO-style algorithms can collect experience far faster than real robots allow. Consumer hardware makes this accessible—but only if the software stack, memory budget, and training recipe are engineered carefully. This project demonstrates that capability end-to-end and frames the next research questions I want to pursue in a PhD.

### What I built

| Component | Choice |
|-----------|--------|
| Simulator | NVIDIA Isaac Sim **5.1** (pip) |
| Framework | Isaac Lab **v2.3.2** |
| Algorithm | RSL-RL **PPO** (`rsl-rl-lib 3.1.2`) |
| Hardware | RTX 5060 Laptop, **8 GB** VRAM |
| Parallelism | **128** environments (headless) |

**Tasks completed**

1. **Locomotion** — `Isaac-Velocity-Flat-Anymal-C-v0`: ANYmal-C tracks commanded base velocity on flat terrain; **1500** iterations; wall time **~22 min**; checkpoint saved for evaluation.
2. **Manipulation** — `Isaac-Reach-Franka-v0`: Franka arm reaches sampled EE targets; **1000** iterations; wall time **~12 min**; checkpoint saved for evaluation.

Supporting deliverables: install/repair scripts, training defaults tuned for 8 GB VRAM, documented version pins, and train/play automation.

### Key engineering findings (research-relevant)

- Parallel env count is a first-class hyperparameter under VRAM limits; **128** was a stable operating point for this GPU.
- RL library pins matter as much as model hyperparameters: mismatched `rsl-rl` / `tensordict` / torch combinations can crash Kit before learning begins.
- Reproducibility on Windows requires treating path length, EULA, and environment repair as part of the experimental method.

### Results (honest scope)

This project validates a **working training and evaluation pipeline** with logged rewards and saved policies. It is **not** yet a novel algorithm paper: policies use standard Isaac Lab task definitions and RSL-RL defaults. Strength for admissions is **demonstrated capacity to run serious robot-learning experiments**, not a claim of SOTA scores.

### Proposed PhD directions (talking points for advisors)

1. **Rough-terrain / perceptive locomotion** — extend from flat ANYmal velocity tracking to rough terrain and height-map / depth observations.
2. **Contact-rich manipulation** — move from reach to lift/stack with object dynamics and multi-stage rewards.
3. **Sim-to-real transfer** — domain randomization, actuator modeling, and hardware deployment of policies trained in Isaac Lab.
4. **Systems for robot learning** — memory-aware env scheduling, curriculum over `num_envs`, and reproducible multi-GPU training recipes.

### Evidence package for applications

- Project README + setup/training docs  
- `docs/TRAINING_RESULTS.md` (iterations, timings, checkpoint paths)  
- Checkpoints under `logs/rsl_rl/...`  
- Optional: TensorBoard curves, short play video (when GUI/recording available), GitHub mirror  

---

## 4. How to use this in applications (checklist)

| Asset | Action |
|-------|--------|
| CV | Paste 3 bullets under Research Experience; keep numbers (128 envs, 1500/1000 iters, ~22/~12 min). |
| SOP | Use §2 as one paragraph; add a second paragraph naming 2–3 faculty and their recent papers. |
| Email to PIs | Attach §3 as PDF (1 page); open with one sentence of fit + ask for a 15-min call. |
| Interview | Be ready to explain PPO rollout loop, why headless training, and what you would change for rough terrain / lift. |
| Strengthen next | Add rough-terrain run, lift task, ablations (`num_envs`), or a short technical report with figures. |

---

## 5. Honest positioning for funded admits

**Strong signal:** you can stand up Isaac Lab RL, train nontrivial robots, and debug systems failures—rare among applicants who only list coursework.

**Not sufficient alone:** most funded offers still need **letters**, **clear advisor fit**, and preferably **novel results** (workshop paper, thesis chapter, or ablation-driven technical report).

**Best next uplift (highest ROI):**
1. One stretch experiment (rough ANYmal **or** Franka lift) with a 2–3 page write-up and 1 figure.
2. Cold-email 5–10 labs with §3 + one sentence of why their last paper matters to you.
3. Ask a faculty member who knows your work for a letter that mentions **independence + systems depth**.

---

## 6. ETH Zurich — tailored application package

### Why ETH is a strong fit for *this* project

Your stack is unusually aligned with ETH robotics:

| Your work | ETH connection |
|-----------|----------------|
| **RSL-RL PPO** | Open-source training stack from / widely used by **Robotic Systems Lab (RSL)** |
| **ANYmal-C** locomotion | Flagship platform of **Prof. Marco Hutter / RSL** |
| GPU-parallel sim RL + sim-to-real interest | Core RSL theme ([RL for robotics](https://rsl.ethz.ch/research/researchtopics/rl-robotics.html), [legged locomotion](https://rsl.ethz.ch/research/researchtopics/legged-locomotion.html)) |
| Manipulation / loco-manipulation curiosity | Also relevant to **Computational Robotics Lab (CRL)**, Prof. **Stelian Coros** (hybrid RL + model-based whole-body control) |

**Primary target:** RSL (Hutter).  
**Secondary:** CRL (Coros) for loco-manipulation / hybrid control.  
**Broader umbrella:** ETH D-MAVT / D-INFK doctoral admission after a supervisor agrees.

### How funding works at ETH (important)

- ETH PhDs are typically **paid doctoral assistant positions** (employment contract + salary), not US-style “tuition scholarship + stipend” packages.
- Admission is usually **advisor-first**: get a professor/lab to hire you → then register for the doctorate via ETH **eApply**.
- For RSL specifically: apply via their **official application form** with CV + transcripts + motivation letter. **Email-only applications are often ignored** ([RSL open positions](https://rsl.ethz.ch/the-lab/open-positions.html)).

### Target faculty / themes (name these carefully)

1. **Prof. Marco Hutter — Robotic Systems Lab**  
   Themes to cite: sim-to-real RL for legged robots, robust proprioceptive locomotion, perceptive/rough-terrain walking, RL for robot control.  
   Your hook: “I already train ANYmal-C with RSL-RL in Isaac Lab; I want to push toward rough terrain / perception / hardware transfer.”

2. **Prof. Stelian Coros — Computational Robotics Lab**  
   Themes to cite: loco-manipulation, hybrid learning + model-based control (e.g. Rambo-style RL-augmented WBC).  
   Your hook: “I have baseline locomotion + arm reach in parallel sim; I want whole-body interaction policies that stay precise under contact.”

### ETH-specific SOP / motivation paragraph (replace §2 closing)

> My preparation for doctoral research at ETH Zurich is grounded in building reliable robot-learning systems in high-fidelity simulation. Using NVIDIA Isaac Lab and Isaac Sim 5.1 with **RSL-RL PPO**—the training stack closely associated with ETH’s Robotic Systems Lab—I trained GPU-parallel policies on a constrained 8 GB laptop GPU: **ANYmal-C** velocity tracking for 1500 iterations (~22 minutes at 128 environments) and Franka reach for 1000 iterations (~12 minutes), with reproducible checkpoints and evaluation scripts. Getting there required the kind of experimental discipline RSL research demands: diagnosing stack and dependency failures, pinning a reproducible environment, and treating simulation throughput (`num_envs`) as a first-class design choice. I want to extend this baseline from flat-terrain tracking toward **robust, perceptive legged locomotion and sim-to-real transfer**, and—where relevant—toward **loco-manipulation** that couples mobility with contact-rich interaction. ETH is the natural place for that agenda because RSL’s ANYmal platform and RL-for-control research, together with complementary work in hybrid whole-body control at ETH, define the problems I am prepared to contribute to as a doctoral researcher.

### Motivation letter outline for RSL form (1–1.5 pages)

1. **Opening (4–5 lines):** Why RSL / RL for robot control; one sentence on ANYmal + RSL-RL experience.  
2. **Preparation:** Isaac Lab pipeline, 128-env PPO, both tasks, systems debugging → signals independence.  
3. **Research interests (pick 2):** e.g. (A) rough-terrain / map-aware locomotion; (B) sim-to-real + actuator modeling; optionally (C) mobile manipulation.  
4. **Fit:** Link each interest to an RSL research topic page or a recent RSL paper (name title + year).  
5. **Skills honesty:** Strong PyTorch / Isaac Lab / RL training; note C++/ROS as **in progress** if not yet strong—RSL lists them as requirements, so either show evidence or a concrete learning plan.  
6. **Close:** Ask to be considered for PhD openings in RL for robot control / legged locomotion; list CV + transcripts attached via form.

### What RSL says they want vs what you have

| RSL expectation | Your status | Action |
|-----------------|-------------|--------|
| Outstanding grades, strong MSc | Unknown here | Lead with transcripts; explain rank if available |
| Relevant experience (legged robots, learning, control) | **Strong** (ANYmal + RSL-RL + Isaac Lab) | Put this first in the letter |
| C++ and ROS | Often a gap for Isaac-Lab-only applicants | Add a small ROS2 + C++ controller/tutorial project before applying |
| Publications | Not required for entry, but competitive | 2–3 page technical report + rough-terrain stretch experiment helps |

### Cold contact note (CRL / other labs — not a substitute for RSL form)

Use only where the lab invites email contact. Keep it short:

```
Subject: PhD interest — GPU-parallel RL (ANYmal / Isaac Lab) → loco-manipulation

Dear Prof. Coros,

I am applying for doctoral study at ETH and am writing because of your lab’s work on
hybrid learning and model-based whole-body control for loco-manipulation (e.g. Rambo).

I recently built an Isaac Lab + RSL-RL pipeline and trained ANYmal-C locomotion and
Franka reach policies under 8 GB VRAM constraints (128 parallel envs). I am looking
to move from these baselines toward contact-rich whole-body interaction policies.

May I share a 1-page summary and ask whether you anticipate doctoral openings in
this area in the next admissions cycle?

Best regards,
Ayodele Kolawole | M.Sc Artificial Intelligence | jkay.com@gmail.com | https://ayokolawole.co.uk | https://github.com/JkayAy/isaac-lab-rl-workspace
```

**Do not** use this as your only RSL channel—submit the **RSL application form**.

### ETH application checklist

- [ ] Read [RSL open positions](https://rsl.ethz.ch/the-lab/open-positions.html) and submit **form** (CV, transcripts, motivation letter).  
- [ ] Tailor letter with **ANYmal + RSL-RL** as the lead sentence.  
- [ ] Add one stretch result: `Isaac-Velocity-Rough-Anymal-C-v0` (closest narrative to RSL).  
- [ ] Strengthen **C++/ROS** evidence before or during application.  
- [ ] Optional second track: D-INFK / D-MAVT central doctoral info + CRL contact.  
- [ ] After a supervisor commits: ETH doctorate registration (**eApply**) with signed supervision confirmation.

### Competitive reality check (ETH / RSL)

Your Isaac Lab + ANYmal + RSL-RL project is an **excellent fit signal**—better than generic ML coursework. For RSL it is still typically **necessary but not sufficient**: grades, letters, and preferably a clear next research question (rough terrain / sim-to-real / perception) decide funded offers. Treat this portfolio as the **technical proof**, then close the gaps above.
