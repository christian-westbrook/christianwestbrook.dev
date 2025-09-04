# syntax=docker/dockerfile:1
FROM alpine:3.22 AS builder

RUN --mount=type=cache,target=/var/cache/apk \
    --mount=type=cache,target=/root/.npm \
    apk update && \
    apk add make nodejs npm && \
    npm install -g sass

WORKDIR /app/

COPY . .

RUN make site

FROM nginx:1.29.1-alpine3.22

ARG ENV=dev

COPY --from=builder app/public/ /usr/share/nginx/html/
COPY infra/nginx/nginx.${ENV}.conf /etc/nginx/conf.d/app.conf

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]