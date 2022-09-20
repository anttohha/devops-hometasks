FROM debian:latest
RUN apt  update && apt-get install -y ansible daemon iproute2 locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
WORKDIR /root/
COPY . /root/
RUN ansible-galaxy install -r /root/requirements.yaml
EXPOSE 80
RUN ansible-playbook /root/install.yaml
ENTRYPOINT service jenkins start && bash
