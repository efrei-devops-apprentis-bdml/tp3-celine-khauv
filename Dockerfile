FROM alpine:3.4

WORKDIR /app

RUN apk update && apk add curl && apk --no-cache

COPY curl.sh .

CMD ["./curl.sh"]