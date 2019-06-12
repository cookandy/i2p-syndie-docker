FROM debian:stretch
ENV LANG en_US.UTF-8

ENV VNC_PASSWORD password

# pre-reqs
RUN apt-get update && apt-get install -y gnupg2 apt-transport-https curl

# syndie
RUN echo "deb https://deb.i2p2.de/ stretch main" > /etc/apt/sources.list.d/i2p.list
RUN echo "deb-src https://deb.i2p2.de/ stretch main" >> /etc/apt/sources.list.d/i2p.list
RUN curl -o i2p-debian-repo.key.asc https://geti2p.net/_static/i2p-debian-repo.key.asc
RUN apt-key add i2p-debian-repo.key.asc
RUN apt-get update && apt-get install -y i2p-keyring syndie libswt-cairo-gtk-3-jni

# vnc
RUN apt-get install -y x11vnc xvfb
RUN mkdir /.vnc
RUN x11vnc -storepasswd ${VNC_PASSWORD} /.vnc/passwd
RUN mkdir -p /root/.swt/lib/linux/x86_64/ && ln -s /usr/lib/jni/libswt-* /root/.swt/lib/linux/x86_64/
RUN echo "java -jar /usr/bin/syndie" >> /.bashrc
