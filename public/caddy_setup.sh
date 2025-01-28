#!/bin/bash

# Install Caddy
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy

# Configure firewall
sudo ufw allow 80
sudo ufw allow 443

# Create Caddyfile
sudo tee /etc/caddy/Caddyfile << EOF
gulfofwhat.com {
    reverse_proxy localhost:3000

    encode gzip

    header {
        Strict-Transport-Security "max-age=31536000;"
        Permissions-Policy "interest-cohort=()"
        X-Content-Type-Options "nosniff"
        X-Frame-Options "DENY"
        Referrer-Policy "strict-origin-when-cross-origin"
    }
}

# Optional: Add www subdomain redirect
www.gulfofwhat.com {
    redir https://gulfofwhat.com{uri} permanent
}
EOF

# Reload Caddy
sudo systemctl reload caddy

# Enable Caddy
sudo systemctl enable caddy

# Show status
sudo systemctl status caddy

echo "Setup complete! Make sure your DNS records point to this server:"
echo "A record: gulfofwhat.com -> $(curl -s ifconfig.me)"
echo "A record: www.gulfofwhat.com -> $(curl -s ifconfig.me)"
