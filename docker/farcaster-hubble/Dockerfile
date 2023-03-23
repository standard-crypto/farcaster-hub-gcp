FROM python:alpine

# https://github.com/farcasterxyz/hubble/tags
ARG HUBBLE_VERSION=ed35c2d16b70205eadccc466d0a9a6a0b61aa4c5

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

COPY hub_config.ts peer_id.protobuf /

# Change to the Hubble app directory and create the network identity
WORKDIR /hubble/apps/hubble

CMD yarn start \
    --config=/hub_config.ts \
    --eth-rpc-url="$ETH_RPC_URL" \
    --announce-server-name="$HUB_HOSTNAME" \
    --announce-ip="$HUB_IP"
