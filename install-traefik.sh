#!/bin/bash

# Exit jika terjadi error
set -e

echo "📁 Membuat folder traefik dan subfolder..."
mkdir -p traefik/certs traefik/config traefik/logs

echo "📥 Mengunduh file stack.yml dari GitHub..."
curl -fsSL https://raw.githubusercontent.com/askareija/labs-tutorial/refs/heads/main/traefik/stack.yml \
  -o traefik/stack.yml

echo "📥 Mengunduh file traefik.yml ke folder config..."
curl -fsSL https://raw.githubusercontent.com/askareija/labs-tutorial/refs/heads/main/traefik/traefik.yml \
  -o traefik/config/traefik.yml

echo "📥 Mengunduh file dynamic.yml ke folder config..."
curl -fsSL https://raw.githubusercontent.com/askareija/labs-tutorial/refs/heads/main/traefik/dynamic.yml \
  -o traefik/config/dynamic.yml

echo "🔗 Membuat Docker network traefiknet (overlay)..."
docker network create traefiknet --driver overlay || echo "⚠️ Network sudah ada, lanjut..."

echo "🚀 Deploy stack Traefik..."
docker stack deploy -c traefik/stack.yml traefik

echo "✅ Traefik berhasil di-deploy ke Docker Swarm."
