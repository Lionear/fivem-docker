FROM alpine:latest AS build

ENV FIVEM_VERSION=2683
ENV FIVEM_HASH=2683-c2cc69bef82431651d83fdd478a6abe5c7fc2771 

WORKDIR /output

RUN apk add --no-cache git
RUN wget -O- https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/${FIVEM_HASH}/fx.tar.xz \
	| tar xJ --strip-components=1 \
	    --exclude alpine/dev --exclude alpine/proc \
            --exclude alpine/run --exclude alpine/sys \
	&& mkdir -p /output/opt/fivem-server-data \
	&& git clone https://github.com/citizenfx/cfx-server-data.git opt/fivem-server-data

ADD server.cfg opt/fivem-server-data
ADD entrypoint usr/bin/entrypoint

RUN chmod +x /output/usr/bin/entrypoint

# Publish in a single container
FROM scratch

LABEL maintainer="Lionear <hello@lioneargaming.com>" \
	org.label-schema.vendor="Lionear" \
	org.label-schema.name="FiveM Server" \
	org.label-schema.url="https://fivem.net" \
	org.label-schema.description="FiveM is a modification for Grand Theft Auto V enabling you to play multiplayer on customized dedicated servers." \
	org.label-schema.version=${FIVEM_VERSION}

COPY --from=build /output/ /

WORKDIR /config
EXPOSE 30120

CMD [""]

ENTRYPOINT ["/bin/sh", "/usr/bin/entrypoint"]
