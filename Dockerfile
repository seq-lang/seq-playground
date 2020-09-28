FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y curl
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/seq-lang/seq/master/install.sh)"
ENV PATH="/root/.seq/bin:${PATH}"
ENV OMP_NUM_THREADS=1
