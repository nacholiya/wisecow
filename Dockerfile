# Use lightweight Debian base image
FROM debian:bullseye-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the Wisecow script
COPY wisecow.sh .

# Make the script executable
RUN chmod +x wisecow.sh

# Expose the default port
EXPOSE 4499

# Start the Wisecow application
CMD ["./wisecow.sh"]
