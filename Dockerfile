FROM node:18.20.4-slim

RUN mkdir -p /app

WORKDIR /app

COPY . ./

ARG OPENAI_API_KEY
ARG ANTHROPIC_API_KEY
RUN echo "OPENAI_API_KEY=${OPENAI_API_KEY}" > .env.prod && \
    echo "ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}" >> .env.prod

RUN rm -rf /app/node_modules && rm -rf /app/dist && npm install && npm run build

CMD npm run start:prod

EXPOSE 8080
