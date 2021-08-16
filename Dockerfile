FROM golang:1.16.7-alpine AS build

RUN apk add --update --no-cache gcc git build-base

WORKDIR /src/
COPY main*.go go.* /src/
RUN CGO_ENABLED=0 go build -o /bin/demo

FROM scratch
COPY --from=build /bin/demo /bin/demo
ENTRYPOINT ["/bin/demo"]