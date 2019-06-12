This image includes Java and i2p's Syndie app (becuase I refuse to install Java on my machine).

In order to use it, you must VNC to the container on port `5900` with a password of `password` (configurable in the `Dockerfile`).

To start this container and make it persistent, map a volume to `/root/.syndie`. For example 

```
docker run -p 5900:5900 -v /data:/root/.syndie -e HOME=/ syndie x11vnc -forever -usepw -create
```
