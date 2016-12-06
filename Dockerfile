FROM ansible:ansible
MAINTAINER neko-neko

RUN apk install git golang

WORKDIR $GOPATH/src/github.com/hashicorp/terraform
RUN git clone https://github.com/hashicorp/terraform.git ./ && \
    git checkout v0.7.13 && \
    /bin/bash scripts/build.sh

RUN go get github.com/mitchellh/gox
RUN go get github.com/mitchellh/packer
WORKDIR $GOPATH/src/github.com/mitchellh/packer
RUN /bin/bash scripts/build.sh

CMD ["/bin/bash"]
