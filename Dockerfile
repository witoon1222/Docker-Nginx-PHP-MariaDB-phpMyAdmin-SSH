FROM php:8.4-fpm

ENV TZ=Asia/Bangkok

WORKDIR /var/www

# เพิ่ม max execution time
RUN echo 'max_execution_time = 180' >> /usr/local/etc/php/conf.d/docker-php-maxexectime.ini

# ติดตั้ง dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    mariadb-client \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    nginx \
    libwebp-dev \
    libxpm-dev \
    openssh-server \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# PHP Extensions
RUN docker-php-ext-install opcache \
  && echo "opcache.enable=1" >> /usr/local/etc/php/conf.d/opcache.ini \
  && echo "opcache.memory_consumption=128" >> /usr/local/etc/php/conf.d/opcache.ini \
  && echo "opcache.interned_strings_buffer=8" >> /usr/local/etc/php/conf.d/opcache.ini \
  && echo "opcache.max_accelerated_files=10000" >> /usr/local/etc/php/conf.d/opcache.ini \
  && echo "opcache.validate_timestamps=1" >> /usr/local/etc/php/conf.d/opcache.ini

RUN docker-php-ext-configure gd \
    --with-freetype \
    --with-jpeg \
    --with-webp \
    --with-xpm \
    && docker-php-ext-install gd

RUN docker-php-ext-install mysqli pdo pdo_mysql \
    && docker-php-ext-enable mysqli

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Nginx symlink
RUN ln -s /etc/nginx/sites-available /etc/nginx/sites-enabled

# สร้าง user เป็น root สำหรับ SFTP/SSH
RUN useradd -m -u 0 -o -s /bin/bash john \
    && mkdir -p /var/www/.ssh \
    && chown -R john:john /var/www/.ssh

# สร้าง folder สำหรับ sshd
RUN mkdir -p /var/run/sshd

# ตั้งรหัสผ่าน user 
RUN echo 'john:test1234' | chpasswd

# # # อนุญาต root login ผ่าน SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# เปิด port PHP-FPM และ SSH
EXPOSE 9000 22

# รัน SSHD พร้อม PHP-FPM
CMD ["sh", "-c", "/usr/sbin/sshd && php-fpm"]
