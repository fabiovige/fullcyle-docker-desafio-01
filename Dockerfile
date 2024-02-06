FROM golang:alpine as builder

WORKDIR /app
COPY . .

RUN CGO_ENABLED=0 go build -ldflags '-extldflags "-static"' -o helloworld main.go

# Etapa final
FROM scratch
COPY --from=builder /app/helloworld /helloworld

CMD ["/helloworld"]

