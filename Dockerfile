FROM jupyter/datascience-notebook

USER root

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install Python packages
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir \
    ipywidgets \
    pandas \
    matplotlib \
    seaborn \
    scikit-learn

# Set permissions for the default user
USER jovyan

# Expose port for JupyterLab
EXPOSE 8888

# Set the working directory
WORKDIR /home/jovyan/work

# Default command to start JupyterLab
CMD ["start-notebook.sh"]
