FROM  php:5.6-fpm

#    更改为阿里云镜像
RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt-get update && apt-get install -y \
    openssl \
    libfreetype6-dev \
    libpng-dev \
    libjpeg-dev \
    libzip-dev \
    zip \
    libmcrypt-dev \
#    需要openssl扩展取消以下注释-begin
    wget \
    # && apt-get install php5-redis \
    # && rm -rf /var/lib/apt/lists/* \
    # && wget https://www.openssl.org/source/openssl-1.1.1f.tar.gz \
    # && tar -xzvf ./openssl-1.1.1f.tar.gz \
    # && cd openssl-1.1.1f \
    # && ./config --prefix=/usr/local/ssl --openssldir=/usr/local/ssl \
    # && make \
    # && make install \
    # && rm -rf /var/www/openssl-1.1.1f.tar.gz \
    # && rm -rf /var/www/openssl-1.1.1f \
#    需要openssl扩展取消以下注释-end
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-png-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install mysql \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mbstring \
    && pecl install redis-4.3.0 \
    && docker-php-ext-enable redis \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-install opcache

# 解决时区问题
ENV TZ "Asia/Shanghai"
