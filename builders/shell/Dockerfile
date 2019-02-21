FROM zeplo/alpine:3.9

# Use default workspace
WORKDIR /app

# Directory for running build
ARG DIR=./

COPY . .

RUN chmod +x ./main.sh

CMD ./main.sh