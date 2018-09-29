FROM golang:1.9-alpine as base

# Use default workspace
WORKDIR /app

# Directory for running build
ARG DIR=./

COPY ./bundle .

# Move to the step directory (as requested by the user)
WORKDIR ${DIR}

RUN CGO_ENABLED=0 go build -ldflags "-s -w" -o main

FROM scratch

COPY --from=base /app/main /go-script

CMD ["/go-script"]
