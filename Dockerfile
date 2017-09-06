FROM node:latest
MAINTAINER Joy Borsutzki
#------
# Umgebungsvariablen
#ENV HUBOT_NAME NTTBOT
#ENV HUBOT_SLACK_TOKEN false
#ENV HUBOT_AUTH_ADMIN myself
ENTRYPOINT ["/home/hubot/hubot/bin/hubot"]
#------
# Pre-Install
#ADD build/ /opt/
#WORKDIR /opt
RUN mkdir -p /home/hubot/hubot
WORKDIR /home/hubot/hubot

#-----
# Install
#RUN npm install --production
#RUN npm install coffee-script --production

#RUN npm install redis --production; npm cache clean
RUN npm install -g yo generator-hubot
RUN useradd -ms /bin/bash hubot
USER hubot

#RUN yo hubot --defaults

#-----
# Post-install
#EXPOSE 8080
#VOLUME /opt/scripts
CMD ["bin/hubot", "--name", "Doerte", "--adapter", "shell"]

#ENTRYPOINT ["/bin/hubot", "-c", "/bin/hubot --adapter shell"]
