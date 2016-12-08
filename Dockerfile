FROM nekoneko/terraform
MAINTAINER neko-neko

RUN go get github.com/mitchellh/packer
WORKDIR $GOPATH/src/github.com/mitchellh/packer
RUN /bin/bash scripts/build.sh

CMD ["/bin/bash"]
