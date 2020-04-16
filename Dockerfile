FROM golang AS build
COPY . /src/
RUN cd /src && go mod init jmllabsuse.com/gotek&& GO111MODULE=on go build -o gotek .
FROM golang AS build2
RUN go get -u github.com/itchyny/gojq/cmd/gojq
FROM registry.suse.com/suse/sle15:latest
WORKDIR /app
EXPOSE 8080
COPY --from=build /src/gotek /app/
COPY --from=build2 /src/gojq /app
ENTRYPOINT ./gotek
