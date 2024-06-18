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

# Kopiowanie skryptu entrypoint
COPY cmd/generic-autobumper/entrypoint.sh /entrypoint.sh

# Nadanie uprawnień do wykonania skryptu
RUN chmod +x /entrypoint.sh

# Ustawienie skryptu jako entrypoint
ENTRYPOINT ["/entrypoint.sh", "/app/generic-autobumper"]
