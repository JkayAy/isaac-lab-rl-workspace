# Windows long-path fix for Isaac Sim pip

Isaac Sim’s pip package unpacks deeply nested paths under `site-packages\isaacsim\extscache\`. On Windows you may see:

```text
OSError: [WinError 206] The filename or extension is too long
```

This project’s default layout uses a **short install root** on `C:\` while keeping your docs and scripts on the Desktop.

## Recommended layout

| Path | Purpose |
|------|---------|
| `C:\Isaac\env_isaaclab` | Python 3.11 venv (short) |
| `C:\Isaac\IsaacLab` | Isaac Lab git clone |
| `Desktop\...\NVIDIA Isaac Lab` | README, docs, batch scripts only |

[`config/training_defaults.env`](../config/training_defaults.env) sets `VENV_DIR` and `ISAACLAB_DIR` to these paths.

## Step 1 — Enable long paths (still recommended)

Admin PowerShell:

```powershell
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force
```

Reboot after changing the registry.

## Step 2 — Create short-path install dirs

Admin **not** required:

```powershell
New-Item -ItemType Directory -Force -Path C:\Isaac
```

## Step 3 — Venv on short path

From anywhere:

```bat
py -3.11 -m venv C:\Isaac\env_isaaclab
C:\Isaac\env_isaaclab\Scripts\pip install --upgrade pip
```

Then run from Desktop workspace:

```bat
scripts\install_isaacsim_short.bat
scripts\clone_isaaclab_short.bat
scripts\install_isaaclab.bat
```

## Step 4 — If an old failed install exists

Remove broken partial install before retrying:

```powershell
Remove-Item -Recurse -Force "C:\Users\jkay5\Desktop\Robotics\NVIDIA Isaac Lab\env_isaaclab" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "C:\Isaac\env_isaaclab\Lib\site-packages\isaacsim" -ErrorAction SilentlyContinue
```

Then reinstall Isaac Sim pip into `C:\Isaac\env_isaaclab`.

## Alternative — entire project on `C:\`

Clone or move the whole workspace to e.g. `C:\IsaacLab` and use relative `env_isaaclab` there (shorter than Desktop path).

See also [SETUP.md](SETUP.md) Step 1.
