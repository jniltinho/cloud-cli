FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:slim

ENV TZ America/Sao_Paulo
ENV SHELL=/bin/bash
ENV PY_COLORS 1
ENV FORCE_COLOR 1
ENV LANG en_US.UTF-8
WORKDIR /tmp 

RUN mv /bin/sh /bin/sh.old && cp /bin/bash /bin/sh
COPY ./bashrc /root/.bashrc
COPY requirements.txt /requirements.txt

RUN mkdir -p /etc/apt/keyrings \
    && curl -sLS https://packages.microsoft.com/keys/microsoft.asc|gpg --dearmor|tee /etc/apt/keyrings/microsoft.gpg > /dev/null \
    && chmod go+r /etc/apt/keyrings/microsoft.gpg \
    && echo 'deb [arch=amd64 signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ bullseye main'>/etc/apt/sources.list.d/azure-cli.list

RUN apt update && apt install -yq jq tzdata vim unzip azure-cli bssl-dev libffi-dev python3-dev build-essential curl wget python3-pip \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archive/*.deb


RUN curl -LO --progress-bar https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip \
    && unzip awscli-exe-linux-x86_64.zip \
    && ./aws/install

RUN curl -LO --progress-bar https://github.com/digitalocean/doctl/releases/download/v1.100.0/doctl-1.100.0-linux-amd64.tar.gz \
    && tar xf doctl-1.100.0-linux-amd64.tar.gz \
    && mv doctl /usr/local/bin

RUN python3 -m pip install --no-cache-dir -r /requirements.txt

WORKDIR /root

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archive/*.deb
