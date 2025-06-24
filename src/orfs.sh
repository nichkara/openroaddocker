DIRECTORY_OF_ORIGIN=$(pwd)

cd /home/openroad
git clone https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts
cd OpenROAD-flow-scripts

FILES=$(find .)

echo "[INFO] Setting permissions for OpenROAD"
sudo ./setup.sh

# Remove the unused tools
rm -rf tools/yosys
rm -rf tools/OpenROAD

echo "export OPENROAD_EXE=$(command -v openroad)" > /tmp/bashrc
echo "export YOSYS_EXE=$(command -v yosys)" >> /tmp/bashrc
#echo "export PDK_ROOT=/usr/local/share/IHP-Open-PDK/ihp-sg13g2" >> /tmp/bashrc

cat /tmp/bashrc >> ~/.bashrc

cd $DIRECTORY_OF_ORIGIN
