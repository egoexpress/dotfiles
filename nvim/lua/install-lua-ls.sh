#!/bin/bash
# Install Lua Language Server locally

# Create bin directory in nvim config
mkdir -p bin

# Download and extract
cd /tmp
tar -xzf lua-language-server.tar.gz

# Copy to local bin directory
cp -r lua-language-server/* ~/.config/nvim/lua/bin/

echo "Lua Language Server installed to ~/.config/nvim/lua/bin/"