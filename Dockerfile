FROM php:8.2-apache

# Install required PHP extensions for MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable mysqli

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Configure Apache to listen on Render's dynamic PORT environment variable (default: 10000)
ENV PORT=10000
RUN sed -i "s/80/\${PORT}/g" /etc/apache2/ports.conf /etc/apache2/sites-available/*.conf

# Set working directory to Apache web root
WORKDIR /var/www/html

# Copy application files from college_website into Apache document root
COPY college_website/ /var/www/html/

# Set appropriate permissions for Apache
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

EXPOSE ${PORT}

CMD ["apache2-foreground"]

