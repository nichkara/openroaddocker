apt install -y git bash tree

git clone --recursive https://github.com/The-OpenROAD-Project/OpenROAD.git
cd OpenROAD
./etc/DependencyInstaller.sh -all
./etc/Build.sh
cd build
make install
cd ../..
rm -rf OpenROAD

echo "Searching openroad"
openroad -version
echo "Leaving openroad"
