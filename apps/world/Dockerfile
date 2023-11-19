
FROM composer:1.6@sha256:65ecfdbab9e571a8977aa1490443a7007e3d2d3077e41b91eb91b9651cebd669 AS dependencies

# Copy only the necessary files for dependency installation
COPY composer.json composer.lock /app/

# Install dependencies using Composer, without dev dependencies
RUN composer install --no-dev --optimize-autoloader

FROM php:7.4-apache@sha256:d85f6e9fbbbaba46cf024a70075b871bee1bec59a898765f8c756bc017666e81 AS production

# Set a non-root user for Apache
RUN useradd -u 1000 -g www-data -m www

# Copy the contents of the local public directory to the container
COPY public/ /var/www/html/public/

# Copy Composer dependencies
COPY --from=dependencies /app/vendor/ /var/www/html/vendor/

# Copy custom Apache configuration
COPY httpd.conf /etc/apache2/sites-available/000-default.conf

# Set permissions to restrict access
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80

# Set the working directory to /var/www/html
WORKDIR /var/www/html/public

# Switch to the non-root user for running Apache
USER www-data
