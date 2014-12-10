#!/bin/bash
green="\033[0;32m"
red="\033[0;31m"
blue="\033[0;34m"
orange="\033[0;33m"
NC='\033[0m' # No Color

function info { 
   echo -e "${blue}$1${NC}"
}
function warn {
   echo -e "${orange}$1${NC}"
}



echo -e  "==== MAESTRO ===" 
echo -e  "Starting provisioning..."
#if [ "$(whoami)" != "root" ]; then
	#echo -e "${red}[ERROR] Sorry, you are not root. Make sure you run script as sudo.${NC}"
#	exit 1
#fi



###########################################################################
fase="Creating Folders"
echo -e "${green}[START] ${fase}${NC}"
echo -e  "Creating Folders under HOME directory ($HOME)"

mkdir --parents $HOME/development/git
mkdir $HOME/apps
mkdir $HOME/tmp

echo -e  "${green}[ END ] ${fase}\n\n${NC}"
###########################################################################
fase="Installing Mandatory Packages"
echo -e "${green}[START] ${fase}${NC}"
sudo apt-get -y install git tmux zsh unzip unrar flashplugin-installer htop wget virtualbox httpie curl meld nginx

echo -e  "${green}[ END ] ${fase}\n\n${NC}"
###########################################################################
fase="Cloning Essencial Repos"
echo -e "${green}[START] ${fase}${NC}"
cd $HOME/development/git
git clone https://github.com/matheusmessora/dotfiles

echo -e  "${green}[ END ] ${fase}\n\n${NC}"
###########################################################################
fase="Configuring Terminal"
echo -e "${green}[START] ${fase}${NC}"
info "Configuring ZSH... You must provide your root password!"
chsh -s /bin/zsh
info "Installing Oh-My-Zsh"
curl -L http://install.ohmyz.sh | sh
rm $HOME/.zshrc -f
ln -sf $HOME/development/git/dotfiles/ohmy-zsh/templates/zshrc.zsh-template $HOME/.zshrc
info "Creating symbolink for MMM theme"
ln -sf $HOME/development/git/dotfiles/ohmy-zsh/themes/mmm.zsh-theme $HOME/.oh-my-zsh/themes/mmm.zsh-theme
info "Creating symbolink for TMUX confs"
ln -sf $HOME/development/git/dotfiles/tmux/tmux.conf $HOME/.conf.tmux
echo -e  "${green}[ END ] ${fase}\n\n${NC}"


###########################################################################
fase="Configuring GIT"
echo -e "${green}[START] ${fase}${NC}"
info "Removing ${HOME}/.gitconfig file"
rm $HOME/.gitconfig -f
info "Provide your GIT user.name"

read username
git config --global user.name $username
info "Provide your GIT user.email"
read email
git config --global user.email $email
git config --global push.default simple
info "This is your actual GIT config file"
cat $HOME/.gitconfig

echo -e  "${green}[ END ] ${fase}\n\n${NC}"


###########################################################################
fase="Installing CHROME"
echo -e "${green}[START] ${fase}${NC}"
info "Should I download and install? Y/n"
read -n1 answer
if [[ $answer = "Y" || $answer = "y" ]]; then
info "This download will download the Google Chrome Stable 64bits for  Ubuntu"
cd $home/tmp
wget --no-check-certificate https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
fi
echo -e  "${green}[ END ] ${fase}\n\n${NC}"


###########################################################################
fase="Installing Brackets"
echo -e "${green}[START] ${fase}${NC}"
info "Should I download and install? Y/n"
read -n1 answer
if [[ $answer = "Y" || $answer = "y" ]]; then
info "Downloading Brackets version 1.0.64-bits without Extract"
cd $home/tmp
wget --no-check-certificate https://github.com/adobe/brackets/releases/download/release-1.0/Brackets.Release.1.0.64-bit.deb
sudo dpkg -i Brackets.Release.1.0.64-bit.deb
fi
echo -e  "${green}[ END ] ${fase}\n\n${NC}"


###########################################################################
fase="Installing Sublime"
echo -e "${green}[START] ${fase}${NC}"
info "Should I download and install? Y/n"
read -n1 answer
if [[ $answer = "Y" || $answer = "y" ]]; then
info "Downloading Sublime Text 3 version 3065 64-bits"
cd $home/tmp
wget --no-check-certificate http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3065_amd64.deb
sudo dpkg -i sublime-text_build-3065_amd64.deb
fi
echo -e  "${green}[ END ] ${fase}\n\n${NC}"


###########################################################################
fase="Installing GNOME"
echo -e "${green}[START] ${fase}${NC}"
warn "[ATTENTION] This script will add some ppa repositories from gnome3-team. It can cause some graphical problems"
info "Should GNOME be installed? Y/n"
read -n1 answer
if [[ $answer = "Y" || $answer = "y" ]]; then
info "If you insists... MAESTRO is now installing GNOME3"
sudo add-apt-repository ppa:gnome3-team/gnome3-staging
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install gnome-weather gnome-maps gnome-photos gnome-music
sudo apt-get update
sudo apt-get install bijiben polari gnome-clocks gnome-weather gnome-maps gnome-music gnome-photos gnome-documents gnome-contacts epiphany-browser gnome-sushi gnome-boxes gnome-shell-extensions
fi
echo -e  "${green}[ END ] ${fase}\n\n${NC}"












echo -e  "Finished provisioning..."
echo -e  "Thanks for watching!"
echo -e  "==== MAESTRO ===" 

