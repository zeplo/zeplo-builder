FROM python:3-alpine

# Use default workspace
WORKDIR /app

# Allow env overwrite for image
ARG ENV=production

# Directory for running build
ARG DIR=./

COPY ./bundle .

# Move to the step directory (as requested by the user)
WORKDIR ${DIR}

# Install pipenv
RUN pip install pipenv
RUN pipenv install --system --deploy

# Serve, for a pure execution
CMD python ./src/main.py
