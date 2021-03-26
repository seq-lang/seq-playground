FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y curl clang python3 llvm-6.0 libhts-dev
RUN /bin/bash -c "$(curl -fsSL https://seq-lang.org/install.sh)"
ENV PATH="/root/.seq/bin:${PATH}"
ENV OMP_NUM_THREADS=1
ENV SEQ_PYTHON=/usr/lib/x86_64-linux-gnu/libpython3.8.so.1
