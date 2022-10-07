FROM debian:latest
RUN apt-get -y update && apt-get install -y sshpass git build-essential default-jre gcc python-dev python3-pip rsync ansible curl wget
WORKDIR /root/
COPY . /root/
EXPOSE 81
RUN ansible-playbook /root/main_nexus.yaml
CMD ["/opt/nexus-3.42.0-01/bin/nexus", "run"]
