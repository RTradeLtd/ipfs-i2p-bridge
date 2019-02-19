FROM geti2p/i2p
USER root
COPY i2p/clients.config /usr/share/i2p/i2p-config/clients.config
RUN cat /usr/share/i2p/i2p-config/clients.config > /var/lib/i2p/clients.config
CMD cat /usr/share/i2p/i2p-config/clients.config
VOLUME /var/lib/i2p
USER i2psvc
ENTRYPOINT ["/usr/bin/i2prouter"]
CMD ["console"]
