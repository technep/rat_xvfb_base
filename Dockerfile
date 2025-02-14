FROM ubuntu:jammy AS xvfb_base

ENV TZ=Europe/Berlin
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install --no-install-recommends -y \
    git \
    curl \
    wget \
    python3 \
    python3-pip \
    sudo \
    locales \
    xvfb \
    psmisc \
    libxcb-xkb1 \
    python-is-python3 \
    python3-dotenv \
    libevent-2.1-7 \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
