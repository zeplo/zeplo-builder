FROM zeplo/php:7.3.1-zts-alpine3.8

# Use default workspace
WORKDIR /app

# Directory for running build
ARG DIR=./

COPY . .

# Move to service dir (if provided)
WORKDIR ${DIR}

# Install composer
RUN sh -c "[ -f ./composer.json ] && composer install || echo No composer.json found"

# Serve, for a pure execution
CMD php main.php
