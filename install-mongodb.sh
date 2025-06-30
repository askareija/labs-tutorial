#!/bin/bash

# Exit saat terjadi error
set -e

echo "📦 Menginstal dependensi: gnupg & curl..."
sudo apt-get update
sudo apt-get install -y gnupg curl

echo "🔑 Mengimpor public key MongoDB..."
curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
  sudo gpg --dearmor -o /usr/share/keyrings/mongodb-server-8.0.gpg

echo "📄 Menambahkan repository MongoDB ke sources list..."
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" | \
  sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list

echo "🔄 Memperbarui database paket..."
sudo apt-get update

echo "📥 Menginstal MongoDB 8.0..."
sudo apt-get install -y mongodb-org

echo "✅ Instalasi selesai. Kamu dapat menjalankan MongoDB dengan:"
echo "   sudo systemctl start mongod"
echo "   sudo systemctl enable mongod"
