# Use an official Ubuntu base image
FROM ubuntu:latest

# Install Python and pip
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

# Setup venv
ENV VIRTUAL_ENV=/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Copy required files
COPY bike_rental_api/ /bike_rental_api/

# Install dependencies for bike_rental_api
RUN pip install --no-cache-dir -r bike_rental_api/requirements.txt
RUN pip install bike_rental_api/*.whl

# Make port 8001 available to the world outside this container
EXPOSE 8001

# Define environment variable to run the app using uvicorn
ENV UVICORN_HOST=0.0.0.0
ENV UVICORN_PORT=8001

# Run main.py when the container launches
CMD ["python3", "bike_rental_api/app/main.py"]