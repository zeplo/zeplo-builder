FROM zeplo/php:5-zts-alpine3.7

# Use default workspace
WORKDIR /app

# Directory for running build
ARG DIR=./

COPY ./bundle .

# Move to the step directory (as requested by the user)
WORKDIR ${DIR}

# Install composer
RUN composer install

# Serve, for a pure execution
CMD php main.php
