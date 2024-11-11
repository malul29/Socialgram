# Menggunakan image PHP sebagai base
FROM php:8.0-fpm

# Set working directory
WORKDIR /var/www

# Menyalin semua file dari direktori lokal ke dalam kontainer
COPY . /var/www

# Install dependensi sistem yang dibutuhkan
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    curl \
    gnupg \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Node.js dan npm
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs

# Install dependensi proyek Laravel
RUN composer install
RUN npm install

# Jalankan `npm run dev` sebagai bagian dari proses build
CMD ["npm", "run", "dev"]

# Expose port
EXPOSE 9000
