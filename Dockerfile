# Use python:3.10.0-alpine as the base image
FROM python:3.10.0-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt .

# Install the dependencies using pip
RUN pip install --no-cache-dir -r requirements.txt

# copy rest application code in container
COPY . .

# Expose port 8000 for the FastAPI app
EXPOSE 8000

# Command to run the app using uvicorn when the container starts
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
