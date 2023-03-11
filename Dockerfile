FROM nginx:latest

# Set the working directory
WORKDIR /app

# Copy the application files to the container
COPY . /app

# Install any dependencies required by the application
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip3 install -r requirements.txt

# Set the environment variable
ARG VERSION
ENV VERSION=$VERSION

# Expose port 80 to the outside world
EXPOSE 80 

# Start the application
CMD ["python3", "chatpot.py"]

CMD ["nginx", "-g", "daemon off;"]