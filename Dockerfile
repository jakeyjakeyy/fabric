# Use golang alpine as base
FROM golang:1.23-alpine

# Set working directory
WORKDIR /app

# Install git
RUN apk add --no-cache git

# Clone Fabric repository
RUN git clone https://github.com/danielmiessler/fabric.git .

# Install Fabric CLI
RUN go install github.com/danielmiessler/fabric@latest

# Set Go environment variables
ENV GOROOT=/usr/local/go
ENV GOPATH=/root/go
ENV PATH=$GOPATH/bin:$GOROOT/bin:/root/.local/bin:/usr/local/bin:$PATH

# Create config directory
RUN mkdir -p /root/.config/fabric

# Volume for configuration
VOLUME /root/.config/fabric

# Default command
CMD [ "fabric", "-h" ]