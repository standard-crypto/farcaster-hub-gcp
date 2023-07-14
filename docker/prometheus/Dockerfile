FROM prom/prometheus as prometheus

FROM alpine

COPY --from=prometheus /bin/prometheus /bin/prometheus

RUN apk add curl bash python3

RUN curl -sSL https://sdk.cloud.google.com | bash

ENV PATH $PATH:/root/google-cloud-sdk/bin

COPY prometheus.yaml run.sh /

ENTRYPOINT [ "/run.sh" ]
