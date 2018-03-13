FROM circleci/node:8-stretch

USER root
RUN npm install --global gatsby@latest
USER circleci

ENV HOME="/home/circleci"

RUN mkdir -p ${HOME}/site
WORKDIR ${HOME}/site

COPY ["site/package.json", "site/package-lock.json", "./"]
RUN npm install
COPY ["./site", "./"]

CMD ["npm", "run", "dev"]
EXPOSE 8000
