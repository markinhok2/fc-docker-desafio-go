FROM golang:1.18 AS build

WORKDIR /app

RUN go mod init fc-desafio/hellofc

COPY . .

RUN go build -o hellofc

FROM scratch AS runtime

WORKDIR /app

COPY --from=build /app/hellofc .

CMD ["./hellofc"]