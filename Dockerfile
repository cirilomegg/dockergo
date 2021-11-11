FROM golang:1.17-alpine3.14 as build

WORKDIR /app

COPY go.mod ./
COPY main.go ./

RUN CGO_ENABLED=0 go build --ldflags=”-s -w” -o /hello-go

FROM scratch
COPY --from=build /hello-go ./
ENTRYPOINT [ "/hello-go" ]