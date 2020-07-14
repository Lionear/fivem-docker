[hub]: https://hub.docker.com/r/lionear/fivem
[git]: https://github.com/lionear/fivem-docker

# [lionear/fivem][hub]

[![Docker Pulls](https://raster.shields.io/docker/pulls/lionear/fivem.svg)][hub]

With this Docker-image you can run your own FiveM (GTA multiplayer mod) server.
You can convert your existing configuration/resources-folder to an Docker-container using this image. If you run it as a new environment the needed configuration will be generated in the mounted `/config` directory.

You should stop the container to configure if its a new installation.

This version is inspired on the [spritsail/fivem](https://github.com/spritsail/fivem)-image.

## License key

To use this image you need to obtain license key from FiveM. More information can be found [here](https://forum.fivem.net/t/explained-how-to-make-add-a-server-key/56120)

## Uage

You can use the following information to run this image as your own container

```sh
docker run -d \
  --name FiveM \
  --restart=unless-stopped \
  -e LICENSE_KEY=<license_key_here> \
  -d 30120:30120 \
  -d 30120:30120/udp \
  -v /opt/fivem-data:/config \
  lionear/fivem:latest
```

## Environment Variables
- `LICENSE_KEY` - This is the required license key you can obtain from FiveM.
 
