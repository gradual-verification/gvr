FROM ubuntu:24.04 as base

WORKDIR /usr/src/gvr
COPY . .

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install curl build-essential python3-poetry -y

RUN curl https://sh.rustup.rs -sSf > /tmp/rustup-init.sh \
    && chmod +x /tmp/rustup-init.sh \
    && sh /tmp/rustup-init.sh -y \
    && rm -rf /tmp/rustup-init.sh
ENV PATH="/root/.cargo/bin:${PATH}"

RUN rustup install nightly
RUN rustup default nightly
RUN rustup component add miri
RUN rustup component add rust-src
RUN rustup default stable

RUN cargo install mdbook

RUN poetry install

FROM base as build