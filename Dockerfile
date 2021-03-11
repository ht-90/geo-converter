# Base image
FROM python:3.9

# Linux username
USER root

# Update linux and install git and vim
RUN apt-get update \
 && apt-get install -y git

# Downgrade pip (to work with python3.9) and upgrade setuptools
RUN pip install --trusted-host pypi.python.org --trusted-host pypi.org --trusted-host files.pythonhosted.org pip==19 \
 && pip install --trusted-host pypi.python.org --trusted-host pypi.org --trusted-host files.pythonhosted.org --upgrade setuptools

# Copy requirements file and move to workspace
WORKDIR /workspace
COPY . ${PWD}

# Install python pacckages
RUN pip install --trusted-host pypi.python.org --trusted-host pypi.org --trusted-host files.pythonhosted.org -r requirements.txt
