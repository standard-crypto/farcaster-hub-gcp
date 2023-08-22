import os
import time
import subprocess
import json
from prometheus_client import start_http_server, Gauge


class AppMetrics:
    """
    Representation of Prometheus metrics and loop to fetch and transform
    application metrics into Prometheus metrics.
    """

    def __init__(self, polling_interval_seconds=60):
        self.polling_interval_seconds = polling_interval_seconds

        # Prometheus metrics to collect
        self.ourMessages = Gauge("our_message_height", "Our Messages", ['peerId'])
        self.theirMessages = Gauge("their_message_height", "Their Messages", ['peerId'])
        self.divergenceSecondsAgo = Gauge("divergence_seconds_ago", "Divergence Seconds Ago", ['peerId'])
        self.lastBadSync = Gauge("last_bad_sync", "Last Bad Sync", ['peerId'])


    def run_metrics_loop(self):
        """Metrics fetching loop"""

        while True:
            self.fetch_all()
            time.sleep(self.polling_interval_seconds)

    def fetch_all(self):
        """
        Get metrics from application and refresh Prometheus metrics with
        new values.
        """
        self.fetch_sync_state()

    def fetch_sync_state(self):
        print("Fetching sync state...")

        # Fetch raw status data from the application
        result = subprocess.run(["./scripts/sync_state.sh"], stdout=subprocess.PIPE)
        result.check_returncode()
        resp = json.loads(result.stdout)
        for state in resp["syncStatus"]:
            self.ourMessages.labels(peerId=state["peerId"]).set(int(state["ourMessages"]))
            self.theirMessages.labels(peerId=state["peerId"]).set(int(state["theirMessages"]))
            self.divergenceSecondsAgo.labels(peerId=state["peerId"]).set(int(state["divergenceSecondsAgo"]))
            self.lastBadSync.labels(peerId=state["peerId"]).set(int(state["lastBadSync"]))

        print("Exported sync state...")



def main():
    """Main entry point"""

    polling_interval_seconds = int(os.getenv("POLLING_INTERVAL_SECONDS", "60"))
    exporter_port = int(os.getenv("EXPORTER_PORT", "9090"))

    app_metrics = AppMetrics(
        polling_interval_seconds=polling_interval_seconds
    )
    start_http_server(exporter_port)
    app_metrics.run_metrics_loop()


if __name__ == "__main__":
    main()
