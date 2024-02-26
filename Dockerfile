# Pull base image
FROM docker.io/library/python:3.12-slim-bullseye
# Set environment variables
ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
# Set a working directory on our new image (inherited from -slim-bullseye)
WORKDIR /code
# Copy req.txt from current directory (in our local computer) into working directory
COPY ./requirements.txt .
# Install dependencies into the image (in the working directory)
RUN pip install -r requirements.txt
# Copy all project's files from current directory into working directory on new image
COPY . .