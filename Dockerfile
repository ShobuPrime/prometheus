FROM prom/prometheus:latest

ENV USER_ID=1000
ENV GROUP_ID=1000

RUN chown -R ${USER_ID}:${GROUP_ID} etc/prometheus /prometheus

USER       ${USER_ID}
EXPOSE     9090
VOLUME     [ "/prometheus" ]
WORKDIR    /prometheus
ENTRYPOINT [ "/bin/prometheus" ]
CMD        [ "--config.file=/etc/prometheus/prometheus.yml", \
             "--storage.tsdb.path=/prometheus", \
             "--web.console.libraries=/usr/share/prometheus/console_libraries", \
             "--web.console.templates=/usr/share/prometheus/consoles" ]
