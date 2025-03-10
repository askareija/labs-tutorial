# Traefik Setup for Docker Swarm
Folder ini berisi file-file yang diperlukan untuk mengatur traefik untuk menggunakan dengan docker swarm.

## Instalasi
1. Buat folder baru dengan nama traefik
2. Buat network dengan nama `traefiknet` dan mode `overlay`
3. Buat folder dengan nama `log` di folder `traefik`
4. Salin file `traefik.yml` ke folder `traefik`
5. Salin file `stack.yml` ke folder `traefik`
6. Jalankan `docker stack deploy -c stack.yml traefik`
7. 