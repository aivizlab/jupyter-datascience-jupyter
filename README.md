# Data Science Environment with JupyterLab and Docker

This project demonstrates how to create a data science environment using JupyterLab and Docker. This setup ensures reproducibility, easy deployment, and portability.

## Features

- JupyterLab environment for data science and analysis.
- Dockerized environment for consistent and portable deployment.
- Support for custom Python libraries and dependencies.
- Easy-to-follow instructions for setup and usage.

## Prerequisites

Before you begin, make sure you have the following installed on your system:

- [Docker Desktop](https://www.docker.com/products/docker-desktop/): Download Docker Desktop
- [Git](https://git-scm.com/) (optional): For cloning repositories or version control
- Basic Knowledge of Docker: Familiarity with concepts like images, containers, and volumes is helpful but not required.

## Project Structure

The project directory is organized as follows:

jupyter-voila/
├── notebooks/ # Contains Jupyter Notebooks
│ └── example.ipynb # Example notebook
├── data/ # Directory for data files
│ └── your_data.csv # Example data file (optional)
├── Dockerfile # Docker configuration file
├── docker-compose.yml # Docker Compose configuration file
└── README.md # Project documentation
text

## Setup Instructions

1. **Clone the Repository (Optional)**
   If you have the project in a Git repository, clone it to your local machine:

git clone <repository-url>
cd jupyter-voila
text

2. **Create the Project Directory (If starting from scratch)**
Open a terminal or command prompt.

Create the project directory:

mkdir jupyter-voila
cd jupyter-voila
mkdir notebooks
mkdir data
text

3. **Create the `Dockerfile`**
Create a file named `Dockerfile` in the root of your project directory with the following content:

FROM jupyter/datascience-notebook
USER root
Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends
python3-dev
&& rm -rf /var/lib/apt/lists/*
Upgrade pip and install Python packages
RUN pip install --no-cache-dir --upgrade pip &&
pip install --no-cache-dir
ipywidgets
pandas
matplotlib
seaborn
scikit-learn
Set permissions for the default user
USER jovyan
Expose port for JupyterLab
EXPOSE 8888
Set the working directory
WORKDIR /home/jovyan/work
Default command to start JupyterLab
CMD ["start-notebook.sh"]
text

4. **Create the `docker-compose.yml`**
Create a file named `docker-compose.yml` in the root of your project directory:

version: '3.8'
services:
jupyter:
build: .
ports:
- "8888:8888" # JupyterLab port
volumes:
- ./notebooks:/home/jovyan/work/notebooks # Mount notebooks directory
- ./data:/home/jovyan/work/data # Mount data directory
environment:
JUPYTER_ENABLE_LAB: "yes" # Enable JupyterLab interface
text

5. **Create an Example Notebook (`example.ipynb`)**
Create a new file named `example.ipynb` in the `notebooks/` directory with some basic data science code.

6. **Build and Run the Docker Container**

- Open Docker Desktop to ensure it is running.
- Navigate to your project directory in the terminal:

  ```
  cd jupyter-voila
  ```

- Build and start the container using Docker Compose:

  ```
  docker-compose up --build
  ```

- Wait for Docker to build the image and start the container.

7. **Access JupyterLab**

- Open your browser and go to:
  ```
  http://localhost:8888/
  ```

- You should see the JupyterLab interface.

## Troubleshooting & Common Issues

- **Port Conflicts**:
- If port `8888` is already in use, change it in `docker-compose.yml`.

- **File Permissions**:
- If you encounter permission errors when mounting volumes, ensure that your local directories have appropriate permissions.

- **Missing Dependencies**:
- Add any additional Python packages required by your notebook to the `Dockerfile`, then rebuild the image using:

 ```
 docker-compose build --no-cache
 ```

## Customization Options

- **Add More Notebooks**:
- Place additional `.ipynb` files in the `notebooks/` directory.

- **Use Your Own Data**:
- Add data files to the `data/` directory and modify your notebook code accordingly.

- **Install Additional Libraries**:
- Add more Python libraries by modifying the `Dockerfile`:

 ```
 RUN pip install ipywidgets pandas matplotlib seaborn scikit-learn <your-library>
 ```

## Conclusion

This setup provides a robust framework for data science using JupyterLab inside a Dockerized environment. By following these steps, you can easily create reproducible data science environments.

Happy Coding! 🚀✨