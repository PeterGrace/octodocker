FROM container4armhf/armhf-alpine
ENV OCTOPORT 8080

RUN mkdir -p /opt
WORKDIR /opt
RUN apk update && \
    apk add --no-cache python2 git py2-pip sudo && \
    git clone https://github.com/foosel/OctoPrint.git 
WORKDIR /opt/OctoPrint
RUN apk add --no-cache build-base python2-dev linux-headers && \
    pip install . && \
    apk del build-base python2-dev linux-headers
RUN adduser octoprint -D -s /bin/sh
RUN echo "octoprint        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
ADD octostart.sh /opt/OctoPrint
USER octoprint

CMD /opt/OctoPrint/octostart.sh $OCTOPORT
