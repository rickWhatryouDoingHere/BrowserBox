#!/usr/bin/env bash

echo "Install requires sudo."
apt install -y apt-utils 
cd ./src/zombie-lord
./audio.deps
./deb.deps
./font.deps
./dlchrome.sh
cd ../../
echo "Installing pulse audio scripts..."
cp -r ./src/parec-server/pulse/* /etc/pulse/
echo "Adding browsers group..."
groupadd browsers
echo "(if you're not on a linux system don't worry about this step)"
echo "You need to edit sudoers file with visudo to add"
echo "ALL ALL=(:browsers) NOPASSWD:ALL"
echo "Adding automatically"
grep "ALL ALL=(:browsers) NOPASSWD:ALL" /etc/sudoers || sudo tee -a /etc/sudoers > /dev/null <<EOT
ALL ALL=(:browsers) NOPASSWD:ALL
EOT
echo "Done"
