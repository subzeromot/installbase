### Installing Docker
sudo apt -y  install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt -y install docker-ce
sudo systemctl status docker
#Executing the Docker Command Without Sudo (Optional)
sudo usermod -aG docker ${USER}
su - ${USER}

### Installing Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version


### Installing ZSH & autosuggestions
sudo apt-get install zsh -y
sudo curl -L http://install.ohmyz.sh | sh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
vi ~/.zshrc
# add this line to file .zshrc
# source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


### Open ssh
sudo apt -y install openssh-client openssh-server

### Htop
sudo apt -y install htop

### CUDA
# https://linuxhint.com/install-cuda-ubuntu-2004/
#Installing GCC and Other Build Tools
sudo apt install build-essential -y
#Installing CUDA from the Official Ubuntu Package Repository
sudo apt install nvidia-cuda-toolkit -y
#Installing the Latest Version of CUDA from the Official NVIDIA Package Repository
sudo apt install linux-headers-$(uname -r) -y
sudo wget -O /etc/apt/preferences.d/cuda-repository-pin-600 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
sudo apt update
sudo apt full-upgrade
sudo apt install cuda -y
# create cuda.sh 
#sudo nano /etc/profile.d/cuda.sh
# add 2 lines
#export CUDA_HOME="/usr/local/cuda"
#export PATH="$PATH:$CUDA_HOME/bin"

### Install QBitTorrent
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
sudo apt update
sudo apt install qbittorrent -y