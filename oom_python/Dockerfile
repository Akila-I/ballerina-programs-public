# Use official Python image as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Python Flask application code into the container
COPY . .

# Expose the port that the Flask app runs on
EXPOSE 8080

USER 10014

# Command to run the Flask application
CMD ["python", "main.py"]
