FROM pihole/pihole:2022.04.3

COPY unbound-pihole.conf /etc/unbound/unbound.conf.d/pi-hole.conf
COPY start_unbound_and_s6_init.sh start_unbound_and_s6_init.sh

RUN chmod +x start_unbound_and_s6_init.sh \
  && apt update && apt install -y unbound \
  && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

ENTRYPOINT ./start_unbound_and_s6_init.sh
