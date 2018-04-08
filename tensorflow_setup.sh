# Copy the files tensorflow_setup.sh and requirements.txt to ~ and then run the script

# Essential Packages
sudo apt-get update
sudo apt-get install git
sudo apt install unzip
sudo apt install python-pip
sudo apt install python3-pip 
sudo pip3 install -r requirements.txt
sudo apt-get install htop
sudo apt-get install python3-tk

# For GCloud
sudo apt-get install libffi-dev

# Download MuJoCo Files
wget https://www.roboti.us/download/mjpro150_linux.zip
sudo mkdir ~/.mujoco
sudo unzip mjpro150_linux.zip -d ~/.mujoco/

# Enter the key
echo "now put your `mjkey.txt` file into ~/.mujoco/mjkey.txt"
sudo vim ~/.mujoco/mjkey.txt

# # Assuming mjkey.txt is on ~ folder
# sudo mv mjkey.txt ~/.mujoco/

# Library Path
LD_LIBRARY_PATH=$HOME/.mujoco/mjpro150/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/.mujoco/mjpro150/bin

# # Installing MESA
# sudo add-apt-repository ppa:ubuntu-x-swat/updates
# sudo apt update && sudo apt dist-upgrade
# sudo apt-get install mesa-utils

# Installing MESA
# https://github.com/openai/mujoco-py/issues/90
sudo apt-get install libgl1-mesa-dev # https://stackoverflow.com/questions/18406369/qt-cant-find-lgl-error
sudo apt-get install apt-file
apt-file update
apt-file search "GL/osmesa.h"
sudo apt install libosmesa6-dev

# Install patch
# https://github.com/openai/mujoco-py/issues/47
sudo curl -o /usr/local/bin/patchelf https://s3-us-west-2.amazonaws.com/openai-sci-artifacts/manual-builds/patchelf_0.9_amd64.elf
sudo chmod +x /usr/local/bin/patchelf

# Next Issue - ImportError: Failed to load GLFW3 shared library.
# https://github.com/openai/mujoco-py/issues/110
sudo apt-get install libglfw3-dev

# # Install mujoco
# sudo pip3 install mujoco_py
rm -rf mujoco-py
git clone https://github.com/openai/mujoco-py.git
bash -c "cd mujoco-py && python setup.py install"

# Required for HER_Improvements
sudo apt-get install cmake
sudo apt-get install zlib1g-dev
# https://stackoverflow.com/questions/28440834/error-when-installing-mpi4py
sudo apt install libopenmpi-dev

# # Reboot the system
# sudo reboot