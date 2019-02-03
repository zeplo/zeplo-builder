FROM zeplo/php:7.3.1-zts-alpine3.8

# Use default workspace
WORKDIR /app

# Directory for running build
ARG DIR=./

COPY . .

# Move to service dir (if provided)
WORKDIR ${DIR}

# Install composer
RUN composer install

# Serve, for a pure execution
CMD php main.php
