FROM debian:stretch-slim

# Add libzim src to container
ADD ./libzim /libzim
WORKDIR /libzim

# Install dependencies for libzim
RUN apt update && apt install -y \
    liblzma-dev \
    libicu-dev \
    libzstd-dev \
    libxapian-dev \
    meson

# Build libzim
RUN meson . build && \
    ninja -C build && \
    ninja -C build install