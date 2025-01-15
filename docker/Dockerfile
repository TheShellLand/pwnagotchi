FROM ubuntu:latest


# install bettercap
RUN apt update && \
    apt upgrade -y && \
    apt install -y golang && \
    apt install -y git  && \
    apt install -y build-essential  && \
    apt install -y libpcap-dev  && \
    apt install -y libusb-1.0-0-dev  && \
    apt install -y libnetfilter-queue-dev  && \
    go install github.com/bettercap/bettercap@latest && \
    mv -v /root/go/bin/bettercap /usr/local/bin/bettercap && \
    apt clean && \
    rm -rf /var/lib/apt/lists/\* /tmp/\* /var/tmp/*

# install pwngrid
RUN cd /opt && \
    git clone https://github.com/evilsocket/pwngrid.git && \
    cd pwngrid && \
    make all && \
    cp build/pwngrid /usr/local/bin/ && \
    mkdir -p /etc/systemd/system/ && \
    cp pwngrid.service /etc/systemd/system/ && \
    mkdir -p /etc/pwngrid/ && \
    cp env.example /etc/pwngrid/pwngrid.conf && \
    chmod 644 /etc/systemd/system/pwngrid.service

# install pwnagotchi
COPY . /opt/pwnagotchi
RUN apt update && \
    apt install -y python3 && \
    apt install -y curl vim wget unzip && \
    apt install -y python3-dev && \
    cd /opt && \
    wget "https://github.com/evilsocket/pwnagotchi/archive/v1.4.3.zip" && \
    unzip v1.4.3.zip && \
    cd pwnagotchi-1.4.3 && \
    curl "https://bootstrap.pypa.io/get-pip.py" -o get-pip.py && \
    python3 "get-pip.py" --break-system-packages && \
    python3 -m pip install --break-system-packages --root-user-action=ignore -U pip && \
    python3 -m pip install --break-system-packages --root-user-action=ignore -U setuptools && \
    python3 -m pip install --break-system-packages --root-user-action=ignore -r requirements.txt && \
    python3 -m pip install --break-system-packages --root-user-action=ignore .

#     python3 -m pip install --break-system-packages --root-user-action=ignore -r requirements.txt
#     python3 -m pip install . --root-user-action && \
#     apt clean && \
#     rm -rf /var/lib/apt/lists/\* /tmp/\* /var/tmp/*

COPY docker/entry.sh /entry.sh

ENTRYPOINT ["/bin/bash", "/entry.sh"]
