#https://medium.com/@exesse/cuda-10-1-installation-on-ubuntu-18-04-lts-d04f89287130
#https://www.pugetsystems.com/labs/hpc/How-To-Install-CUDA-10-1-on-Ubuntu-19-04-1405/

#Start terminal and remove any NVIDIA traces you may have on your machine
sudo rm /etc/apt/sources.list.d/cuda* -y
sudo apt remove --autoremove nvidia-cuda-toolkit -y
sudo apt remove --autoremove nvidia-* -y

#Setup the correct CUDA PPA on your system
sudo apt update
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-key adv --fetch-keys  http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub -y
sudo bash -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list'
sudo bash -c 'echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda_learn.list'

#Install CUDA 10.2 packages
sudo apt update
sudo apt install cuda-10-2 -y 
sudo apt install libcudnn7 -y

#As the last step one need to specify PATH to CUDA in ‘.profile’ file. Open the file by running
#And add the following lines at the end of the file:
sudo vi ~/.profile
if [ -d "/usr/local/cuda-10.2/bin/" ]; then
    export PATH=/usr/local/cuda-10.2/bin${PATH:+:${PATH}}
    export LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
fi

