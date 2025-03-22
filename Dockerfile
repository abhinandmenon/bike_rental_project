# Use an official Docker Python 3.12 base image
FROM python:3.12

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