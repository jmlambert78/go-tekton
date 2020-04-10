FROM golang AS build
COPY . /src/
RUN cd /src && go mod init jmllabsuse.com/gotek&& GO111MODULE=on go build -o gotek .
EXPOSE 8080
FROM debian
WORKDIR /app
COPY --from=build /src/gotek /app/
ENTRYPOINT ./gotek
