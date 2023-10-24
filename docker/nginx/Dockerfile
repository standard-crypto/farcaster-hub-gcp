FROM nginx:1.25.2

COPY nginx.conf.template /etc/nginx/nginx.conf

COPY run.sh /

ENTRYPOINT [ "/run.sh" ]