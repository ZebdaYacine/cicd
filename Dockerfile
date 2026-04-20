# Build stage
FROM golang:1.22 AS builder

WORKDIR /app

COPY go.mod ./
COPY . .

RUN go build -o hello main.go

# Runtime stage
FROM debian:stable-slim

WORKDIR /app

COPY --from=builder /app/hello .

EXPOSE 8080

CMD ["./hello"]
