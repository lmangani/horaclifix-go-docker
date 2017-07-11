FROM golang:1.6
RUN go get github.com/negbie/horaclifix
COPY ./entrypoint.sh /
EXPOSE 4739
ENTRYPOINT ["/entrypoint.sh"]
