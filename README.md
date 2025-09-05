# 🐍 Local Python Lab — Simple Setup with `environment.yml`

> **Goal:** Run Python notebooks locally with Conda, JupyterLab, `.env` secrets, and the OpenAI SDK, using only an `environment.yml` file for package management.

---

## 1) Install prerequisites

* **Miniconda** or **Anaconda** → [https://docs.conda.io/en/latest/miniconda.html](https://docs.conda.io/en/latest/miniconda.html)
* **Git** (optional)

---

## 2) Create `environment.yml`

In your project root, create this file:

```yaml
name: myenv
channels:
  - conda-forge
  - defaults
dependencies:
  - python=3.9
  - jupyterlab
  - ipykernel
  - pandas
  - numpy
  - python-dotenv
  - requests
  - beautifulsoup4
  - ipython
  - pip
  - pip:
      - openai>=1.30.0
```

---

## 3) Create the environment

```bash
conda env create -f environment.yml
conda activate myenv
```

---

## 4) Register kernel for Jupyter

```bash
python -m ipykernel install --user --name=myenv --display-name "Python (myenv)"
```

---

## 5) Start JupyterLab

```bash
jupyter lab
```

* In JupyterLab, choose kernel **Python (myenv)** if not already active.

**Check active Python:**

```python
import sys
print(sys.executable)
```

Should show `.../envs/myenv/bin/python`.

---

## 6) Use `.env` for secrets

Create a `.env` file:

```dotenv
OPENAI_API_KEY=sk-your-key-here
```

Load it in notebooks:

```python
import os
from dotenv import load_dotenv
from openai import OpenAI

load_dotenv()
client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))
print("Client OK")
```

---

## 7) Update environment if needed

When you add new packages:

```bash
conda install -n myenv <package>
```

Export back to file:

```bash
conda env export --no-builds > environment.yml
```

---

## 8) Recommended `.gitignore`

```gitignore
**/.ipynb_checkpoints/
__pycache__/
*.py[cod]
.env
.DS_Store
```

---

## 9) Optional: GUI Options

By default, **Miniconda** has no graphical interface. If you prefer a GUI:

### A) Install Anaconda Navigator

```bash
conda install anaconda-navigator
```

Launch it with:

```bash
anaconda-navigator
```

This opens a desktop GUI for managing environments, packages, and Jupyter.

### B) Use JupyterLab as your GUI

```bash
conda activate myenv
jupyter lab
```

This opens a modern browser-based interface for running notebooks.

### C) Use VS Code

* Install [VS Code](https://code.visualstudio.com/)
* Install the **Python extension**
* Select the Conda env `myenv` as your interpreter
* Run notebooks or scripts directly in VS Code

---

✅ Done! Your whole setup is reproducible with just `environment.yml`, and you can choose GUI options that best fit your workflow.


### Add new package to environment.yml
→ Run: 
```bash
  conda env update --file environment.yml --prune
```
→ This updates and cleans your env
