#!/usr/bin/env bash

curl -L -O https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init
chmod +x rustup-init
./rustup-init --default-toolchain stable --no-modify-path -y
~/.cargo/bin/rustup target add armv7-linux-androideabi
~/.cargo/bin/rustup target add x86_64-linux-android

echo "export OPENSSL_LIB_DIR=/usr/lib/x86_64-linux-gnu" >> ~/.bashrc
echo "export OPENSSL_INCLUDE_DIR=/usr/include/openssl" >> ~/.bashrc
echo "export PATH=$PATH:/usr/local/bin/android-toolchains/bin" >> ~/.bashrc
# x86_64-linux-android settings
echo "export CARGO_TARGET_X86_64_LINUX_ANDROID_LINKER=/usr/local/bin/android-toolchains/bin/x86_64-linux-android-gcc" >> ~/.bashrc
echo "export CFLAGS='-I /usr/include -idirafter /usr/include/x86_64-linux-gnu'" >> ~/.bashrc
echo "export CC=x86_64-linux-android-gcc" >> ~/.bashrc
# armv7-linux-androideabi settings
#echo "export CARGO_TARGET_ARMV7_LINUX_ANDROIDEABI_LINKER=/usr/local/bin/android-toolchains/bin/arm-linux-androideabi-gcc" >> ~/.bashrc
#echo "export CC_armv7_linux_androideabi=arm-linux-androideabi-clang" >> ~/.bashrc
echo "source ~/.cargo/env" >> ~/.bashrc
git clone https://github.com/jacderida/safe_client_libs
