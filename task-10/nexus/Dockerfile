FROM debian:latest
RUN apt  update && apt-get install -y ansible daemon iproute2
WORKDIR /root/
COPY . /root/
EXPOSE 81
RUN ansible-playbook /root/main_nexus.yaml
CMD ["/opt/nexus-3.41.1-01/bin/nexus", "run"]
