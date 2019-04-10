FROM zeplo/ruby:2.6.1-alpine3.8-dev as base

# Use default workspace
WORKDIR /app

# Allow env overwrite for image
ARG ENV=production

# Set to production, we can always overwrite this
ENV RACK_ENV ${ENV}

# Directory for running build
ARG DIR=./

COPY . .

# Move to service dir (if provided)
WORKDIR ${DIR}

# Install (with linked local modules)
RUN sh -c "([ -f ./Gemfile ] && bundle install -j 8) || echo No Gemfile found"

FROM zeplo/ruby:2.6.1-alpine3.8

COPY --from=base /usr/local/bundle /usr/local/bundle
COPY --from=base /app /app

# Use default workspace
WORKDIR /app

# Allow env overwrite for image
ARG ENV=production

# Set to production, we can always overwrite this
ENV RACK_ENV ${ENV}

# Directory for running script
ARG DIR=./

# Directory for running script
WORKDIR ${DIR}

# Default Command
CMD [ -f ./main.rb ] && ruby ./main.rb || ruby ./lib/main.rb
