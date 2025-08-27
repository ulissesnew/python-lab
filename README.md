# 🐍 Anaconda Jupyter Environment with Docker Compose

This project sets up a containerized Anaconda environment running **Jupyter Notebook**, perfect for data science experiments and notebooks.

---

## 📦 What's Inside

- **Anaconda 3**: Includes Python, Conda, and many pre-installed libraries (NumPy, pandas, etc.)
- **Jupyter Notebook**: Web-based environment for running and editing notebooks
- **Docker Compose**: Simple setup and run with one command

---

## 🚀 Quick Start

1. **Clone the repo**  
   ```bash
   git clone <your-repo-url>
   cd <your-project-folder>


## 2. Start the container
```sh
 docker-compose up

```

## 3. Access Jupyter Notebook
Open your browser and go to:
http://localhost:8888

### jupyter lab
http://localhost:8888/lab

📌 You’ll see a token in the terminal. Copy and paste it into your browser when prompted.


## Conda create environment
```sh 
#environment.yml
name: myenv
channels:
  - defaults
dependencies:
  - python=3.9
  - pandas
  - numpy
  - jupyter
```

Then run inside container:

```sh 
conda env create -f /opt/notebooks/environment.yml

```

Activate environment:
```sh 
  conda activate myenv
```


### Folder structure

```sh
> notebooks
.gitignore
docker-compose.yml 
Dockerfile 
environment.yml 
README.md
```