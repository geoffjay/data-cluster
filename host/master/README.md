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
