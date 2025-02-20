FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

RUN pip install numpy==1.26.4

# Copy project files
COPY . .


# Default command for preprocessing
CMD ["python", "-m", "src.data.clean_data"]
