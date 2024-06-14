FROM golang:1.22-alpine

# Install git
RUN apk update && apk add --no-cache git

WORKDIR /app

COPY ../../go.mod ../../go.sum ./

RUN go mod download

COPY ../../ .

ENV CGO_ENABLED=0 GOOS=linux GOARCH=amd64

# Build the application
RUN go build -o generic-autobumper ./cmd/generic-autobumper

RUN ls -alh

# Set the entry point to the built binary
ENTRYPOINT ["/app/generic-autobumper"]
