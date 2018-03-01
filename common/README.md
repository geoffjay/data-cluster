# Common Setup and Configuration

## Docker

The provided SystemD service file `docker-compose@.service` should be added to load `docker-compose` configurations from
a system working directory of `/etc/docker/compose/`.

```sh
mkdir -p /etc/docker/compose
cp docker-compose@.service /etc/systemd/system/
```

After that a service named `my-service` could be added by:

```sh
mkdir /etc/docker/compose/my-service
cp my-service/docker-compose.yml /etc/docker/compose/my-service/
systemctl enable docker-compose@my-service
systemctl start docker-compose@my-service
systemctl daemon-reload
```

### Cleaning Up with a Timer

```sh
cp docker-cleanup.timer /etc/systemd/system/
cp docker-cleanup.service /etc/systemd/system/
systemctl enable docker-cleanup.timer
```
