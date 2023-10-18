FROM php:8.0-apache

# Instalamos las dependencias necesarias
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip

# Habilitar extensiones específicas
RUN docker-php-ext-install mysqli

# Instalar Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Habilitar el módulo de reescritura
RUN a2enmod rewrite

# Exponer el puerto por defecto de Apache
EXPOSE 80

# Copiamos el composer.json del proyecto para guardarlo en una carpeta general
COPY lib/composer.json /var/www/lib/composer.json

# Cambiar al directorio /var/www/html/lib y ejecutar composer install
WORKDIR /var/www/lib
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN composer install

# Cambiar nuevamente al directorio de trabajo original
WORKDIR /var/www/html

CMD ["apache2-foreground"]
