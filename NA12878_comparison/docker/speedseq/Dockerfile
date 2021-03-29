FROM continuumio/miniconda2:latest

RUN apt-get update && apt-get install -y --no-install-recommends build-essential wget unzip bzip2 apt-utils autoconf git cmake python curl libz-dev libtbb-dev libncurses5-dev bsdmainutils gawk libbz2-dev liblzma-dev libcurl4-openssl-dev libssl-dev   libnss-sss && rm -rf /var/lib/apt/lists* \

  && conda install -c bioconda numpy=1.15.0 pysam scipy=1.0.0


#RUN source /gsc/pkg/root/root/bin/thisroot.sh

ENV PATH="/miniconda3/bin:${PATH}"
ARG PATH="/miniconda3/bin:${PATH}"
RUN apt-get update

RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && bash Miniconda3-latest-Linux-x86_64.sh -b -p "/miniconda3/" \
    && rm -f Miniconda3-latest-Linux-x86_64.sh \
    && conda install python=3.6 \
    && conda install -c bioconda snakemake \
    && conda install -c bioconda samtools=1.9
#RUN conda --version
RUN git clone --recursive https://github.com/hall-lab/speedseq \
  &&  cd speedseq \
  && wget https://root.cern/download/root_v6.22.06.Linux-ubuntu18-x86_64-gcc7.5.tar.gz && tar -xzf root_v6.22.06.Linux-ubuntu18-x86_64-gcc7.5.tar.gz \
  && make realign
ENV ROOTSYS /speedseq/root
ENV PATH /speedseq/root/bin:$PATH
ENV LD_LIBRARY_PATH /speedseq/root/lib
ENV DYLD_LIBRARY_PATH /speedseq/root/lib
ENV SHLIB_PATH /speedseq/root/lib
ENV LIBPATH /speedseq/root/lib
ENV MANPATH /speedseq/root/man
ENV PYTHONPATH /speedseq/root/lib
ENV CMAKE_PREFIX_PATH /speedseq/root/lib
ENV JUPYTER_PATH /speedseq/root/etc/notebook

CMD ["/bin/bash"]
