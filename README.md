Docker Compose
- Nginx
- PHP
- MariaDB
- phpMyAdmin
- Open SSH Server

สำหรับ PHP ใช้คำสั่ง 
- docker compose up -d --build

สำหรับ Laravel Framework

- แก้ไข /nginx/conf.d/default.conf เปลี่ยน root /var/www; เป็น root /var/www/public;
- stop docker ด้วยคำสั่ง docker compose down
- start docker ด้วยคำสั่ง docker compose up -d --build
- chmod -R 755 storage/
- chmod -R 755 bootstrap/cache/
- chown -R www-data:www-data storage/
- chown -R www-data:www-data bootstrap/cache/


  
