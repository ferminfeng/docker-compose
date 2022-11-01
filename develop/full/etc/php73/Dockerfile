FROM php:7.3-fpm

# replace sources.list
RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && sed -i 's/security.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

# 设置时区
# RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN \
	apt-get update \
	&& apt-get install -y \
	gcc \
	make \
	autoconf \
	libc-dev \
	pkg-config \
	libzip-dev \
	&& apt-get install -y --no-install-recommends \
	git \
	libmemcached-dev \
	libz-dev \
	libpq-dev \
	libssl-dev libssl-doc libsasl2-dev \
	libmcrypt-dev \
	libxml2-dev \
	zlib1g-dev libicu-dev g++ \
	libldap2-dev libbz2-dev \
	curl libcurl4-openssl-dev \
	# libenchant-dev \
	libgmp-dev firebird-dev libib-util \
	re2c libpng++-dev \
	libwebp-dev libjpeg-dev libjpeg62-turbo-dev libpng-dev libvpx-dev libfreetype6-dev \
	libmagick++-dev \
	libmagickwand-dev \
	zlib1g-dev libgd-dev \
	libtidy-dev libxslt1-dev libmagic-dev libexif-dev file \
	sqlite3 libsqlite3-dev libxslt-dev \
	libmhash2 libmhash-dev libc-client-dev libkrb5-dev libssh2-1-dev \
	unzip libpcre3 libpcre3-dev \
	poppler-utils ghostscript libmagickwand-6.q16-dev libsnmp-dev libedit-dev libsodium-dev \
	# libreadline6-dev libreadline-dev librecode-dev \
	freetds-bin freetds-dev freetds-common libct4 libsybdb5 tdsodbc libpspell-dev \
	# for librabbitmq-dev (amqp)
	librabbitmq-dev \
	# for vim
	vim 

RUN ln -s /usr/lib/x86_64-linux-gnu/libsybdb.so /usr/lib/

RUN export CFLAGS="-I/usr/src/php" \
 	&& docker-php-ext-configure gd --with-png-dir --with-jpeg-dir --with-xpm-dir --with-webp-dir --with-freetype-dir && docker-php-ext-install gd \
	&& docker-php-ext-configure hash --with-mhash && docker-php-ext-install hash \
	&& docker-php-ext-configure imap --with-kerberos --with-imap-ssl && docker-php-ext-install \
	imap \
	iconv \
	bcmath \
	bz2 \
	calendar \
	ctype \
	curl \
	dba \
	dom \
	fileinfo \
	exif \
	ftp \
	gettext \
	gmp \
	interbase \
	intl \
	json \
	ldap \
	mbstring \
	mysqli \
	opcache \
	pcntl \
	pspell \
	pdo \
	pdo_dblib \
	pdo_mysql \
	pdo_pgsql \
	pdo_sqlite \
	pgsql \
	phar \
	posix \
	session \
	shmop \
	simplexml \
	soap \
	sockets \
	sodium \
	sysvmsg \
	sysvsem \
	sysvshm \
	xmlreader \
	xmlwriter \
	xml \
	xmlrpc \
	xsl \
	zip \
    # for mcrypt
    && pecl install mcrypt-1.0.3 && docker-php-ext-enable mcrypt \
    # for redis
    && pecl install redis && docker-php-ext-enable redis \
    # for imagick require PHP
    && pecl install imagick && docker-php-ext-enable imagick \
    # for memcached require PHP
    && pecl install memcached && docker-php-ext-enable memcached \
    # for mongodb
    && pecl install mongodb && docker-php-ext-enable mongodb \
    # for swoole
    && pecl install swoole && docker-php-ext-enable swoole \
    # for msgpack
    && pecl install msgpack && docker-php-ext-enable msgpack \
    # for yar
    && pecl install yar && docker-php-ext-enable yar \
    # for yaf
    && pecl install yaf && docker-php-ext-enable yaf \
    # for amqp
    && pecl install amqp && docker-php-ext-enable amqp

# set locale to utf-8 and timezone to Asia/Shanghai
RUN apt-get install -y locales && \
    echo "zh_CN.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/bin
ENV PATH /root/.composer/vendor/bin:$PATH

# 切换目录
WORKDIR /var/www 
RUN chown -R www-data:www-data /var/www/

# Clean up
# RUN apt-get remove -y git && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
