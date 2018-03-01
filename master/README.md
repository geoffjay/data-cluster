# Setup

## iSCSI

## NFS Container

### Build

```sh
docker build -t nfs .
# TODO: use docker-compose eventually
# docker-compose build nfs
```

### Run

```sh
docker-compose up --no-deps -d nfs
```

### Run Using SystemD

This section assumes that the steps in the common setup have been done to enable the `docker-compose` service.

```sh
mkdir -p /etc/docker/compose/nfs
cp docker-compose.yml /etc/docker/compose/nfs/
systemctl enable docker-compose@nfs
```
