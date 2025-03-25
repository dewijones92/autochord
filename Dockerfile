# Use an official lightweight Python image
FROM python:3.8-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    gcc \
    g++ \
    make \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy the entire repository into the container
COPY . /app

# Upgrade pip and install dependencies in the correct order
RUN pip install --upgrade pip && \
    pip install numpy && \
    pip install .

# Set a default command (this can be overridden at runtime)
CMD ["python", "-c", "import autochord; print('Autochord library is ready to use.')"]

