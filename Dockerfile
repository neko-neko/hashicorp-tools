FROM ansible/ansible:ubuntu1604
MAINTAINER neko-neko

RUN apt-get update && apt-get install -y wget

RUN wget https://releases.hashicorp.com/terraform/0.7.13/terraform_0.7.13_linux_amd64.zip && unzip terraform_0.7.13_linux_amd64.zip \
    mv terraform /usr/local/bin/

RUN wget https://releases.hashicorp.com/packer/0.12.0/packer_0.12.0_linux_amd64.zip && unzip packer_0.12.0_linux_amd64.zip \
    mv packer /usr/local/bin/

CMD ["/bin/bash"]
