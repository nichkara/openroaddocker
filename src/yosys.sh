# yosys 0.38 + 113
apt install -y build-essential clang lld bison flex \
	libreadline-dev gawk tcl-dev libffi-dev git \
	graphviz xdot pkg-config python3 libboost-system-dev \
	libboost-python-dev libboost-filesystem-dev zlib1g-dev make cmake

git clone https://github.com/YosysHQ/yosys.git
cd yosys
git submodule update --init --recursive

make config-gcc
make
make install

# Adding the system verilog plugin
git clone --recursive https://github.com/povik/yosys-slang
cd yosys-slang
make -j$(nproc) install
cd ..


cd ..
rm -rf yosys

yosys --version
