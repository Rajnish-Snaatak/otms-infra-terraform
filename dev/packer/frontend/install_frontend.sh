#!/bin/bash
set -e

echo "==== Updating system ===="
sudo apt update -y
sudo apt upgrade -y

echo "==== Installing required packages ===="
sudo apt install -y \
  curl \
  git \
  nginx \
  ca-certificates \
  gnupg

echo "==== Installing Node.js 18 ===="
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

echo "Node version:"
node -v
npm -v

echo "==== Cloning frontend repository ===="
cd /opt
sudo git clone https://github.com/liya0077/OTMS-Frontend.git
sudo chown -R ubuntu:ubuntu OTMS-Frontend

cd OTMS-Frontend

echo "==== Installing frontend dependencies ===="
npm install

echo "==== Building frontend application ===="
export NODE_OPTIONS="--max-old-space-size=4096"
npm run build

echo "==== Configuring NGINX ===="

# Remove default site
sudo rm -f /etc/nginx/sites-enabled/default

# Create NGINX config
sudo tee /etc/nginx/sites-available/frontend <<EOF
server {
    listen 80;
    server_name _;

    root /opt/OTMS-Frontend/build;
    index index.html;

    location / {
        try_files \$uri /index.html;
    }
}
EOF

# Enable site
sudo ln -s /etc/nginx/sites-available/frontend /etc/nginx/sites-enabled/frontend

echo "==== Restarting NGINX ===="
sudo nginx -t
sudo systemctl enable nginx
sudo systemctl restart nginx

echo "==== Frontend installation completed ===="
