# Use Alpine Linux as the base image
FROM ubuntu:latest

# Install dependencies
RUN apt update && apt upgrade -y
RUN apt install -y git wget bash sudo

# Setup user
RUN useradd -m -p "" openroad
RUN usermod -aG sudo openroad

# Install scripts
COPY ./src /home/openroad
RUN chmod 777 /home/openroad/*

# Install tools
RUN /home/openroad/yosys.sh
RUN /home/openroad/openroad.sh

USER openroad
WORKDIR /home/openroad

# Setup orfs
RUN /home/openroad/orfs.sh

CMD ["bash"]
