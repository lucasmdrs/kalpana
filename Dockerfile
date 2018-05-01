FROM golang:1.10.1-alpine as builder

WORKDIR /go/src/github.com/WWGSouthBay/kalpana

COPY main.go .

RUN apk add git --no-cache

RUN go get .

RUN GOOS=linux go build -o kalpanad

FROM alpine:3.7

RUN addgroup -S kalpanad && adduser -S -g kalpanad kalpanad

EXPOSE 3333

USER kalpanad

COPY --from=builder /go/src/github.com/WWGSouthBay/kalpana/kalpanad /usr/bin/kalpanad

CMD ["kalpanad"]
