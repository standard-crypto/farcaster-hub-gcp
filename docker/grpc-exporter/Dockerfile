FROM --platform=linux/amd64 python

RUN apt-get update && \
    apt-get install -y jq && \
    cd /tmp && \
    wget https://github.com/fullstorydev/grpcurl/releases/download/v1.8.5/grpcurl_1.8.5_linux_x86_64.tar.gz && \
    tar -xvf grpcurl_1.8.5_linux_x86_64.tar.gz && \
    mv grpcurl /usr/bin

WORKDIR /app

COPY app/requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY app /app

EXPOSE 9090

CMD [ "python", "-u", "server.py" ]
