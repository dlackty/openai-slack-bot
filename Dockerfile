FROM node:16.15.0-alpine

COPY ./*.js /opt/openai-slack-bot/
COPY ./package.json /opt/openai-slack-bot/
COPY ./yarn.lock /opt/openai-slack-bot/

ENV OPENAI_API_KEY=""
ENV SLACK_BOT_TOKEN=""
ENV SLACK_SIGNING_SECRET=""
ENV SLACK_APP_TOKEN=""

WORKDIR /opt/openai-slack-bot

RUN yarn install --production && yarn cache clean

CMD ["yarn", "start"]
