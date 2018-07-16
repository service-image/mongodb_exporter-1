FROM golang:1.10 as builder
WORKDIR /go/src/github.com/percona/mongodb_exporter
COPY ./ ./
RUN make init build

FROM alpine:latest
COPY --from=builder /go/src/github.com/percona/mongodb_exporter/percona-mongodb_exporter /bin/mongodb_exporter
EXPOSE 9216
ENTRYPOINT [ "/bin/mongodb_exporter" ]
