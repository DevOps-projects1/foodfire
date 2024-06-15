FROM ubuntu
RUN apt-get update
RUN  apt-get install wget -y
RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
    export NVM_DIR="/root/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#RUN export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" [ -s "$NVM_DIR/nvm.sh" ] && \.>
#RUN  nvm install v16.10.0
RUN apt-get install -y nodejs npm
RUN npm install --global yarn

WORKDIR /foodfire

COPY . .

RUN yarn install

CMD ["yarn", "dev"]
