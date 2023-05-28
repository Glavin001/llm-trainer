# Source: https://github.com/lambdal/lambda-stack-dockerfiles
FROM ubuntu:22.04

WORKDIR /root/

# Add libcuda dummy dependency
ADD control .
RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install --yes equivs && \
	equivs-build control && \
	dpkg -i libcuda1-dummy_11.8_all.deb && \
	rm control libcuda1-dummy_11.8* && \
	apt-get remove --yes --purge --autoremove equivs && \
	rm -rf /var/lib/apt/lists/*

# Setup Lambda repository
ADD lambda.gpg .
RUN apt-get update && \
	apt-get install --yes gnupg && \
	gpg --dearmor -o /etc/apt/trusted.gpg.d/lambda.gpg < lambda.gpg && \
	rm lambda.gpg && \
	echo "deb http://archive.lambdalabs.com/ubuntu jammy main" > /etc/apt/sources.list.d/lambda.list && \
	echo "Package: *" > /etc/apt/preferences.d/lambda && \
	echo "Pin: origin archive.lambdalabs.com" >> /etc/apt/preferences.d/lambda && \
	echo "Pin-Priority: 1001" >> /etc/apt/preferences.d/lambda && \
	echo "cudnn cudnn/license_preseed select ACCEPT" | debconf-set-selections && \
	apt-get update && \
	DEBIAN_FRONTEND=noninteractive \
		apt-get install \
		--yes \
		--no-install-recommends \
		--option "Acquire::http::No-Cache=true" \
		--option "Acquire::http::Pipeline-Depth=0" \
		lambda-stack-cuda \
		lambda-server && \
	rm -rf /var/lib/apt/lists/*

# Setup for nvidia-docker
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
ENV NVIDIA_REQUIRE_CUDA "cuda>=11.8"

COPY requirements.txt .
RUN pip install -r requirements.txt

# COPY scripts/fine-tune.py .
# RUN python3 ./scripts/fine-tune.py

ENV LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu
# RUN mkdir -p ~/
RUN mkdir -p /home/ubuntu/

RUN groupadd -g 1000 ubuntu && \
    useradd -u 1000 -g ubuntu -m -s /bin/bash ubuntu

USER ubuntu

