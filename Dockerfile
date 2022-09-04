# syntax=docker/dockerfile:1.4

FROM pihole/pihole:2022.09.1

RUN apt-get update && apt-get install -y --no-install-recommends \
		dns-root-data \
		unbound && \
	rm -rf /var/cache/apt/archives /var/lib/apt/lists/* && \
	mkdir -p /etc/services.d/unbound && \
	echo 'edns-packet-max=1232' >! /etc/dnsmasq.d/99-edns.conf

COPY unbound-run /etc/services.d/unbound/run
COPY unbound-pihole.conf /etc/unbound/unbound.conf.d/pi-hole.conf

ENTRYPOINT ["./s6-init"]
