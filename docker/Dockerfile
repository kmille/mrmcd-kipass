FROM debian:jessie
MAINTAINER Jean-Avit Promis "docker@katagena.com"
LABEL org.label-schema.vcs-url="https://github.com/nouchka/docker-keepass"
LABEL version="latest"

RUN export uid=1000 gid=1000 && \
	mkdir -p /home/user && \
	echo "user:x:${uid}:${gid}:User,,,:/home/user:/bin/bash" >> /etc/passwd && \
	echo "user:x:${uid}:" >> /etc/group && \
	chown ${uid}:${gid} -R /home/user

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -yq install xvfb curl keepass2 unzip wget libmono-system-xml-linq4.0-cil libmono-system-data-datasetextensions4.0-cil libmono-system-runtime-serialization4.0-cil mono-mcs && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget https://raw.github.com/pfn/keepasshttp/master/KeePassHttp.plgx -O  /usr/lib/keepass2/KeePassHttp.plgx && \
	chmod 644 /usr/lib/keepass2/KeePassHttp.plgx

COPY mrmcd.kdbx /
COPY start_xvfb.sh /
COPY KeePass.config.xml /home/user/.config/KeePass/KeePass.config.xml

USER user
ENV HOME /home/user

ENTRYPOINT ["/start_xvfb.sh"]
CMD ["/usr/bin/keepass2", "/mrmcd.kdbx", "-pw:mrmcd"]
