FROM zeplo/java-mvn:3.6.0-jdk-8-alpine AS build

# Use default workspace
WORKDIR /app


# Directory for running build
ARG DIR=./

COPY ./bundle .

# Move to service dir (if provided)
WORKDIR ${DIR}

# Package
RUN mvn package -q

# Move it to fixed location
RUN mkdir /target && cp ./target/app.jar /target/app.jar

FROM saturnism/graal:1.0.0-rc2 AS graal

RUN apt-get update && apt-get -y install gcc zlib1g-dev

COPY --from=build /target/app.jar /app/app.jar

WORKDIR /app

RUN native-image \
    --no-server \
    -H:+ReportUnsupportedElementsAtRuntime \
    --static \
    -jar app.jar


FROM scratch

COPY --from=graal /app/app /app

CMD ["/app"]
