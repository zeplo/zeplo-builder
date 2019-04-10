FROM zeplo/golang:1.11.5-alpine3.7 as base

# Use default workspace
WORKDIR /app

# Directory for running build
ARG DIR=./

COPY . .

# Move to service dir (if provided)
WORKDIR ${DIR}

RUN CGO_ENABLED=0 go build -ldflags "-s -w" -o /main

FROM scratch

COPY --from=base /main /go-script
COPY --from=base /etc/ssl/certs/ /etc/ssl/certs

CMD ["/go-script"]
