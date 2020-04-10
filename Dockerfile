FROM golang AS build
COPY . /src/
RUN cd /src && GO111MODULE=on go build -o gotek .

FROM debian
WORKDIR /app
COPY --from=build /src/gotek /app/
ENTRYPOINT ./gotek
