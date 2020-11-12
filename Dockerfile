#################
#  Build image  #
#################

FROM ubuntu:focal AS build

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ca-certificates \
    curl \
    build-essential \
    pkg-config \
    libsass-dev \
    libssl-dev

# Install the currently pinned toolchain with rustup
COPY rust-toolchain /tmp/
RUN curl https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init >/tmp/rustup-init && \
    chmod +x /tmp/rustup-init && \
    /tmp/rustup-init -y --no-modify-path --default-toolchain $(cat /tmp/rust-toolchain)
ENV PATH=/root/.cargo/bin:$PATH

WORKDIR /build
COPY src /build/src/
COPY locales /build/locales/
COPY static /build/static/
COPY templates /build/templates/
COPY Cargo.toml Cargo.lock /build/
RUN cargo build --release

######################
#  Production image  #
######################

FROM ubuntu:focal

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ca-certificates \
    tini \
    libsass1

COPY --from=build /build/target/release/www-rust-lang-org /usr/local/bin/www-rust-lang-org

WORKDIR /app
COPY templates /app/templates/
COPY locales /app/locales/
COPY static /app/static/
COPY src/styles /app/src/styles/

ENV ROCKET_PORT 80
ENV ROCKET_ENV prod

# Use `tini` (a small PID 1) to properly handle signals.
CMD ["tini", "--", "www-rust-lang-org"]
