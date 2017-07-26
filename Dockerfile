FROM golang:1.6
LABEL version="20170727001"
RUN go get github.com/negbie/horaclifix
RUN go get github.com/negbie/siprocket
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
EXPOSE 4739
ENTRYPOINT ["/entrypoint.sh"]
