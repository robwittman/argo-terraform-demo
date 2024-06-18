FROM golang:1.22

ENV PATH="${PATH}:/go"
RUN go install github.com/hashicorp/hc-install/cmd/hc-install@latest


