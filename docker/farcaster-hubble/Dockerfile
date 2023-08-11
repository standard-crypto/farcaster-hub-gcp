FROM node:20.2-alpine AS build

# https://github.com/farcasterxyz/hubble/tags
ARG HUBBLE_VERSION="@farcaster/hubble@1.4.5"

# Install required dependencies
RUN apk add --no-cache libc6-compat python3 make g++ linux-headers curl git

USER node
RUN mkdir /home/node/app
WORKDIR /home/node/app

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain 1.70.0
ENV PATH="/home/node/.cargo/bin:${PATH}"

# Rust flags to allow building with musl, which is needed for alpine
ENV RUSTFLAGS="-C target-feature=-crt-static"

# Clone the Hubble repository and install dependencies
RUN git clone https://github.com/farcasterxyz/hubble.git && \
    cd hubble && \
    git checkout ${HUBBLE_VERSION} && \
    yarn install

# Build the Hubble app
WORKDIR /home/node/app/hubble/
RUN yarn run build

# Change to the Hubble app directory and create the network identity
WORKDIR /home/node/app/hubble/apps/hubble

CMD yarn start \
    --eth-rpc-url="$ETH_GOERLI_RPC_URL" \
    --eth-mainnet-rpc-url="$ETH_MAINNET_RPC_URL" \
    --announce-server-name="$HUB_HOSTNAME" \
    --announce-ip="$HUB_IP" \
    --network="$HUB_NETWORK" \
    --gossip-port=2282 \
    --rpc-port=2283 \
    --ip="0.0.0.0" \
    --db-name="farcaster"
