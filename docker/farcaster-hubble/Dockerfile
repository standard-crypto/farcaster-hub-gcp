FROM python:alpine

# https://github.com/farcasterxyz/hubble/tags
ARG HUBBLE_VERSION="@farcaster/hubble@1.4.3"

# Install required dependencies
RUN apk update && \
    apk add --no-cache git && \
    apk add --no-cache yarn && \
    apk add --no-cache libc6-compat && \
    apk add --no-cache flatbuffers

# Clone the Hubble repository and install dependencies
RUN git clone https://github.com/farcasterxyz/hubble.git && \
    cd hubble && \
    git checkout ${HUBBLE_VERSION} && \
    yarn install

# Build the Hubble app
WORKDIR /hubble
RUN yarn run build

# Change to the Hubble app directory and create the network identity
WORKDIR /hubble/apps/hubble

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
