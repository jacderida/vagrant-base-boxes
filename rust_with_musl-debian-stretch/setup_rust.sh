#!/usr/bin/env bash

curl -L -O https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init
chmod +x rustup-init
./rustup-init --default-toolchain stable --no-modify-path -y
~/.cargo/bin/rustup target add x86_64-unknown-linux-musl

echo "source ~/.cargo/env" >> ~/.bashrc
echo "export CC=musl-gcc" >> ~/.bashrc
echo "export CFLAGS='-I/usr/include/x86_64-linux-musl -idirafter /usr/include'" >> ~/.bashrc
echo "export LDFLAGS=-L/usr/lib/x86_64-linux-musl" >> ~/.bashrc
echo "export OPENSSL_LIB_DIR=/usr/lib/x86_64-linux-gnu" >> ~/.bashrc
echo "export OPENSSL_INCLUDE_DIR=/usr/include/openssl" >> ~/.bashrc
echo "export RUSTFLAGS='-C linker=musl-gcc'" >> ~/.bashrc
git clone https://github.com/jacderida/safe_vault
