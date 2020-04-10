FROM golang AS build
COPY . /src/
RUN cd /src && go mod init jmllabsuse.com/gotek&& GO111MODULE=on go build -o gotek .
FROM debian
WORKDIR /app
EXPOSE 8080
COPY --from=build /src/gotek /app/
ENTRYPOINT ./gotek
