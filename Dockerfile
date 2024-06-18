FROM golang:1.22

ENV PATH="${PATH}:/go"
RUN go install github.com/hashicorp/hc-install/cmd/hc-install@latest

# RUN git clone https://github.com/open-policy-agent/opa && cd opa && go install .
RUN wget https://github.com/open-policy-agent/opa/releases/download/v0.65.0/opa_linux_arm64_static && chmod +x opa_linux_arm64_static && mv opa_linux_arm64_static /go/opa
