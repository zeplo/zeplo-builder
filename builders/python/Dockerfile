FROM zeplo/python:3.7.2-alpine3.7

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
RUN sh -c "[ -f ./Pipfile ] && pipenv install --system --deploy || echo No Pipfile found"

# Serve, for a pure execution
CMD python ./src/main.py
CMD [ -f ./main.py ] && python ./main.py || python ./src/main.py
