FROM nginx

COPY default.conf.template stream.template /etc/nginx/templates/

RUN echo 'include /etc/nginx/conf.d/stream;' >> /etc/nginx/nginx.conf