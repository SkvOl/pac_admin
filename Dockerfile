FROM php:8.2-fpm

ENV TZ="Europe/Moscow"
RUN date

WORKDIR /var/www/pac_admin

RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    libzip-dev \
    unzip \
    git \
    libonig-dev \
    curl \
    procps \
    systemd

RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


COPY . /var/www/pac_admin

# RUN cd /var/www/ && composer create-project laravel/laravel:^11.0 pac_admin
# RUN cd /var/www/pac_admin && composer require orchid/platform && \
#     php artisan orchid:install && \
#     php artisan orchid:admin admin admin@admin.com password && \
#     composer require laravel/breeze --dev && \
#     php artisan breeze:install blade && \
#     composer update orchid/platform --with-dependencies && \
#     php artisan orchid:publish && \
#     php artisan view:clear && \
#     composer require yajra/laravel-datatables-oracle:"^11"

RUN apt-get install -y nodejs npm 
RUN npm install vite@latest --save-dev && npm run build
#&& npm run build && npm i pusher-js && npm i laravel-echo


RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN chmod 777 storage/logs
# RUN chmod 777 storage/logs/laravel.log

EXPOSE 9000
# ENTRYPOINT /entrypoint.sh
CMD ["php-fpm"]