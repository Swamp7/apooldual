FROM nvidia/cuda:12.2.2-devel-ubuntu20.04

RUN rm /etc/apt/sources.list.d/cuda.list

RUN apt update \ 
    && apt -y install wget \
    && wget https://github.com/apool-io/quaiminer/releases/download/v2.8.5/apoolminer_linux_quai_v2.8.5.tar.gz \
    && tar xvzf apoolminer_linux_quai_v2.8.5.tar.gz \
    && rm apoolminer_linux_quai_v2.8.5.tar.gz \
    && ln -s libnvidia-ml.so.1 /lib/x86_64-linux-gnu/libnvidia-ml.so

WORKDIR /apoolminer_linux_quai_v2.8.5.tar.gz

ENTRYPOINT ["./apoolminer"]
