import os
import sys
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
        self.ourMessagesMin = Gauge("our_message_height_min", "Our Messages Minimum")
        self.ourMessagesMax = Gauge("our_message_height_max", "Our Messages Maximum")
        self.theirMessagesMin = Gauge("their_message_height_min", "Their Messages Minimum")
        self.theirMessagesMax = Gauge("their_message_height_max", "Their Messages Maximum")

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
        ourMessagesMin = sys.maxsize
        theirMessagesMin = sys.maxsize
        ourMessagesMax = 0
        theirMessagesMax = 0

        for state in resp["syncStatus"]:
            ourMessagesMin = min(ourMessagesMin, int(state["ourMessages"]))
            ourMessagesMax = max(ourMessagesMax, int(state["ourMessages"]))
            theirMessagesMin = min(theirMessagesMin, int(state["theirMessages"]))
            theirMessagesMax = max(theirMessagesMax, int(state["theirMessages"]))

        self.ourMessagesMin.set(ourMessagesMin)
        self.theirMessagesMin.set(ourMessagesMax)
        self.ourMessagesMax.set(ourMessagesMax)
        self.theirMessagesMax.set(theirMessagesMax)
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
