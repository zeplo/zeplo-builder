FROM zeplo/python:2.7.15-alpine3.7

# Use default workspace
WORKDIR /app

# Allow env overwrite for image
ARG ENV=production

# Directory for running build
ARG DIR=./

COPY . .

# Move to service dir (if provided)
WORKDIR ${DIR}

# Install pipenv
RUN pipenv install --system --deploy

# Serve, for a pure execution
CMD python ./src/main.py
