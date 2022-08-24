FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update &&  \
    apt-get install -y wget git net-tools &&  \
    echo 'deb http://repo.acestream.org/ubuntu/ trusty main' >> /etc/apt/sources.list.d/acestream.list &&  \
    wget -q -O - http://repo.acestream.org/keys/acestream.public.key | apt-key add - &&  \
    apt-get update &&  \
    apt-get install -y python-pip python-gevent python-psutil acestream-engine

WORKDIR /usr/src/app

COPY . .

EXPOSE 8000

ENTRYPOINT ["python", "acehttp.py"]
