# Base docker image
FROM ubuntu:22.04

# Set environment variables
ENV ENERGI_VERSION=1.1.8

# Create a normal user
RUN useradd -m energi-wasif

# Install necessary packages
# Clean up the package list to reduce image size
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Download Energi Node binary and checksum file
# The checksum file is used to verify the integrity of the downloaded binary
RUN wget https://s3-us-west-2.amazonaws.com/download.energi.software/releases/energi3/v${ENERGI_VERSION}/energi3-v${ENERGI_VERSION}-linux-amd64.tgz \
    && wget https://s3-us-west-2.amazonaws.com/download.energi.software/releases/energi3/v${ENERGI_VERSION}/SHA256SUMS

# Verify the checksum of the Energi Node
# The checksum is extracted from the SHA256SUMS file and verified using sha256sum
# If the checksum verification fails, the build process will stop with an error
##Reference for this checksum verification method was sourced from ChatGPT
RUN grep "energi3-v${ENERGI_VERSION}-linux-amd64.tgz" SHA256SUMS | sha256sum -c - \
    && tar -xzf energi3-v${ENERGI_VERSION}-linux-amd64.tgz -C /home/energi/ \
    && mv /home/energi/energi3-v${ENERGI_VERSION}-linux-amd64/bin/energi3 /home/energi/energi3 \
    && chown -R energi:energi /home/energi/energi3 \
    && rm -rf /home/energi/energi3-v${ENERGI_VERSION}-linux-amd64 \
    && rm energi3-v${ENERGI_VERSION}-linux-amd64.tgz SHA256SUMS

# Switch to the normal user
USER energi-wasif

# Set the working directory
WORKDIR /home/energi

# Run the Energi Node client
CMD ["./energi3", "console"]