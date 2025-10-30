Docker Compose
- Nginx
- PHP
- MariaDB
- phpMyAdmin
- Open SSH Server

โปรแกรมที่ต้องใช้
- ดาวน์โหลด VS Code https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user
- ดาวน์โหลด Putty https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe
- ดาวน์โหลด Win SCP https://winscp.net/download/WinSCP-6.5.4-Setup.exe/download

การ Build Docker และสั่งรัน docker
- docker compose down
- docker compose up -d --build
  
สำหรับ PHP ใช้คำสั่ง 
- docker compose up -d --build

สำหรับ Laravel Framework
- แก้ไข /nginx/conf.d/default.conf เปลี่ยน root /var/www; เป็น root /var/www/public;
- จากนั้นทำการ Build Docker
- chmod -R 755 storage/
- chmod -R 755 bootstrap/cache/
- chown -R www-data:www-data storage/
- chown -R www-data:www-data bootstrap/cache/

การเปลี่ยน PHP Version
- แก้ไข Dockerfile บรรทัดบนสุด เปลี่ยน FROM php:8.4-fpm เป็นเวอร์ชันที่ต้องการ
* จากนั้นทำการ Build Docker

การเปลี่ยน Username และ Password ของ SFTP (SSH)
- แก้ไข Dockerfile ค้นหาบรรทัดนี้

# สร้าง user เป็น root สำหรับ SFTP/SSH
RUN useradd -m -u 0 -o -s /bin/bash john \       <----- เปลี่ยนจาก john เป็น User ที่ต้องการ
    && mkdir -p /var/www/.ssh \
    && chown -R john:john /var/www/.ssh          <----- เปลี่ยนจาก john:john เป็น User ที่ต้องการ

# ตั้งรหัสผ่าน user 
RUN echo 'john:test1234' | chpasswd              <----- เปลี่ยนจาก john เป็น User ที่ต้องการ : รหัสผ่านที่ต้องการ

* จากนั้นทำการ Build Docker

การเปลี่ยนชื่อ Container
- แก้ไขไฟล์ docker-compose.yml
- เปลี่ยนเป็นชื่อที่ต้องการ container_name: database
* จากนั้นทำการ Build Docker

การเปลี่ยนพอร์ท Web Server
-   # Nginx Service
    ports:
      - "80:80"                                <----- เปลี่ยน 81:80 หากต้องการให้รัน Port 81 ให้เปลี่ยนเลขข้างหน้าเป็น 81

การเปลี่ยนพอร์ท Database
-   # MariaDB Service
    ports:
      - "3306:3306"                            <----- เปลี่ยน 3307:3306 หากต้องการให้รัน Port 3307 ให้เปลี่ยนเลขข้างหน้าเป็น 3307
 
การเปลี่ยนพอร์ท phpMyAdmin
-   # MariaDB Service
    ports:
      - "8080:8080"                            <----- เปลี่ยน 8081:8080 หากต้องการให้รัน Port 8081 ให้เปลี่ยนเลขข้างหน้าเป็น 8081

การเปลี่ยนพอร์ท SFTP/SSH
-   # SFTP/SSH Service
    ports:
      - "2222:2222"                            <----- เปลี่ยน 2223:2222 หากต้องการให้รัน Port 2223 ให้เปลี่ยนเลขข้างหน้าเป็น 2223

* จากนั้นทำการ Build Docker
  
