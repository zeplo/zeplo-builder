FROM node:10.6.0

# Use default workspace
WORKDIR /app

# Allow env overwrite for image
ARG ENV=production

# Directory for running build
ARG DIR=./

COPY ./bundle .

# Set to production, we can always overwrite this
ENV NODE_ENV ${ENV}

# Move to the step directory (as requested by the user)
WORKDIR ${DIR}

# Install (with linked local modules)
RUN npm install


# Add dependency source files
RUN npm build

# Safe user
USER node

# Serve, for a pure execution
CMD npm start
