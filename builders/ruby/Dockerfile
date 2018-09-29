FROM ruby:2.5

# Use default workspace
WORKDIR /app

# Allow env overwrite for image
ARG ENV=production

# Set to production, we can always overwrite this
ENV RACK_ENV ${ENV} 

# Directory for running build
ARG DIR=./

COPY ./bundle .

# Move to the step directory (as requested by the user)
WORKDIR ${DIR}

# Install (with linked local modules)
RUN bundle install -j 8

# Default Command
CMD ruby ./lib/main.rb