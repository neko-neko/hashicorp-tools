FROM ansible/ansible:ubuntu1604
MAINTAINER neko-neko

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y golang

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

WORKDIR $GOPATH/src/github.com/hashicorp/terraform
RUN git clone https://github.com/hashicorp/terraform.git ./ && \
    git checkout v0.7.13 && \
    /bin/bash scripts/build.sh

RUN go get github.com/mitchellh/gox
RUN go get github.com/mitchellh/packer
WORKDIR $GOPATH/src/github.com/mitchellh/packer
RUN /bin/bash scripts/build.sh

CMD ["/bin/bash"]
