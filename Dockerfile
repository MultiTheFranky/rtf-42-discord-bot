# Docker file with Node 16 and Yarn 1.22.10
FROM node:18-alpine3.11

# Set the working directory
WORKDIR /app

# Copy the source code
COPY . /app

# Copy package.json and yarn.lock
COPY package.json /app 
COPY yarn.lock /app

# Install dependencies
RUN yarn \
    && \
    yarn build \
    && \
    yarn cache clean

# Expose the port
EXPOSE 3000

# Start the app
CMD ["yarn", "server"]