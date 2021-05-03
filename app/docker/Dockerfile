FROM node:10-alpine

COPY . /home/node/webApp

RUN cd /home/node/webApp/docker; \
    mv docker-entrypoint.sh /usr/local/bin; \
    chmod +x /usr/local/bin/docker-entrypoint.sh; \
    cd /home/node/webApp/src; \
    yarn install;

EXPOSE 3000

WORKDIR /home/node/webApp/src

ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD [ "npm", "start" ]