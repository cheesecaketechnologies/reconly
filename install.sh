#!/bin/bash

# Reconly Installer by Cheesecake Technologies

echo "Installing dependencies for Reconly..."

# Update & install system packages
sudo apt update && sudo apt install -y curl git python3 python3-pip unzip jq whois dnsutils

# Install Go if it's not installed
if ! command -v go &> /dev/null; then
    echo "Go not found. Installing Go..."
    curl -OL https://golang.org/dl/go1.21.0.linux-amd64.tar.gz
    sudo rm -rf /usr/local/go
    sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
    echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
    source ~/.bashrc
    rm go1.21.0.linux-amd64.tar.gz
else
    echo "Go is already installed."
fi

# Ensure Go environment is ready
export PATH=$PATH:/usr/local/go/bin
mkdir -p ~/go/bin

# Install Go-based recon tools
echo "Installing recon tools..."
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/owasp-amass/amass/v3/...@latest
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
go install -v github.com/tomnomnom/httprobe@latest

# Add Go binaries to PATH
echo 'export PATH=$PATH:~/go/bin' >> ~/.bashrc
source ~/.bashrc

# Python dependencies (e.g., for email sending)
pip3 install --upgrade pip
pip3 install yagmail

echo "Done 🎉! You are all set. Run ./reconly.sh to get started."
