FROM golang:1.6
RUN go get github.com/negbie/horaclifix
RUN go get github.com/negbie/siprocket
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
EXPOSE 4739
ENTRYPOINT ["/entrypoint.sh"]
