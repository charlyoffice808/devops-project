# Pick a low configuration python base image
FROM python:3.10-slim-bullseye

#  Expose the port 5000 of the docker container
 #EXPOSE 5050

ENV JWT_SECRET=jwt_secret
ENV REDIS_URL=redis://169.10.0.10:6379/0

# Create a folder app in container and work inside it
WORKDIR /app

COPY requirements.txt .

# Install all the requirements
RUN pip3 install -r requirements.txt

# Copy all the flask project files into the WORKDIR
COPY . .

# Execute flask application inside the container

CMD ["python","run.py"]


