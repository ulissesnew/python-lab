FROM continuumio/anaconda3

COPY environment.yml /tmp/environment.yml

RUN conda env create -f /tmp/environment.yml && conda clean --all -y

# Activate environment
SHELL ["conda", "run", "-n", "myenv", "/bin/bash", "-c"]

# Set working directory
WORKDIR /opt/notebooks

EXPOSE 8888

# RUN conda install -n myenv jupyterlab
CMD ["jupyter", "lab", "--notebook-dir=/opt/notebooks", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
