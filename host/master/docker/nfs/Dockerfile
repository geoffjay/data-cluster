FROM arm32v6/alpine:latest
LABEL maintainer "Geoff Johnson <geoff.jay@gmail.com>"
LABEL source "https://github.com/geoffjay/data-cluster"
LABEL branch "master"

RUN apk add --update --verbose --no-cache nfs-utils bash iproute2
RUN rm -rf /var/cache/apk/* /tmp/* && \
    rm -f /sbin/halt /sbin/poweroff /sbin/reboot
RUN mkdir -p /var/lib/nfs/rpc_pipefs && \
    mkdir -p /var/lib/nfs/v4recovery
RUN echo "rpc_pipefs /var/lib/nfs/rpc_pipefs rpc_pipefs defaults 0 0" >> /etc/fstab && \
    echo "nfsd /proc/fs/nfsd nfsd defaults 0 0" >> /etc/fstab

COPY confd/confd /usr/bin/confd
COPY confd/confd.toml /etc/confd/confd.toml
COPY confd/toml/* /etc/confd/conf.d/
COPY confd/tmpl/* /etc/confd/templates/

COPY nfsd.sh /usr/bin/nfsd.sh
COPY .bashrc /root/.bashrc

RUN chmod +x /usr/bin/nfsd.sh /usr/bin/confd

EXPOSE 111/tcp 111/udp 2049/tcp 2049/udp

ENTRYPOINT ["/usr/bin/nfsd.sh"]
