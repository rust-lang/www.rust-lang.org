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

# Install the Rust toolchain with rustup
ENV RUSTUP_VERSION="1.24.3"
ENV RUSTUP_TRIPLE="x86_64-unknown-linux-gnu"
ENV RUSTUP_SHA="3dc5ef50861ee18657f9db2eeb7392f9c2a6c95c90ab41e45ab4ca71476b4338"
RUN curl "https://static.rust-lang.org/rustup/archive/${RUSTUP_VERSION}/${RUSTUP_TRIPLE}/rustup-init" >/tmp/rustup-init && \
    echo "${RUSTUP_SHA}  /tmp/rustup-init" | sha256sum --check && \
    chmod +x /tmp/rustup-init && \
    /tmp/rustup-init -y --no-modify-path
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
ENV ROCKET_PROFILE release

# Use `tini` (a small PID 1) to properly handle signals.
CMD ["tini", "--", "www-rust-lang-org"]
