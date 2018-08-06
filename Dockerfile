# docker build --rm --tag nox .
# docker run -v nox/:/config -p 6689:6689 --rm nox

FROM debian:stretch
RUN apt-get update && \
        apt-get install curl tar -y
RUN mkdir -p /opt/noxbit
RUN curl -o \
 /tmp/noxbit.tar.gz -L \
	"http://download.noxbit.com/ARMhf/noxbit-pa-ARMhf-32.tar.gz" && \
 tar xf /tmp/noxbit.tar.gz -C /opt/noxbit && \
	rm -rf /tmp/*

EXPOSE 6689
VOLUME /config

CMD ["/opt/noxbit/STM-Hypervisor","-config=/config/noxbit.cfg"]
