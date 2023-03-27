const DEFAULT_GOSSIP_PORT = 2282;
const DEFAULT_RPC_PORT = 2283;
const NETWORK_DEVNET = 3;

export const Config = {
    ip: '0.0.0.0',
    /** The TCP port libp2p should listen on. */
    gossipPort: DEFAULT_GOSSIP_PORT,
    /** The RPC port to use. */
    rpcPort: DEFAULT_RPC_PORT,
    dbName: 'farcaster',
    network: NETWORK_DEVNET,
    bootstrap: [
        "/dns/testnet1.farcaster.xyz/tcp/2282"
    ],
    adminServerEnabled: false,
};
