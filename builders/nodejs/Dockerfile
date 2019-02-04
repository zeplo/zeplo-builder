FROM node:11.9.0-alpine

# Use default workspace
WORKDIR /app

# Directory for running build
ARG DIR=./

ARG ENV=production

COPY . .

# Move to service dir (if provided)
WORKDIR ${DIR}

# Install (with linked local modules)
RUN sh -c "[ -f ./package.json ] && npm install || echo No package.json found"

# Add dependency source files
RUN sh -c "[ -f ./package.json ] &&  npm build || echo"

# Safe user
USER node

# Set to production, we can always overwrite this
ENV NODE_ENV ${ENV}

# Serve, for a pure execution
CMD [ -f ./package.json ] && npm start || node ./index.js
