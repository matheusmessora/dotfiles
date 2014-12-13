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
sudo apt-get -y install git gitk tmux zsh unzip unrar flashplugin-installer htop wget virtualbox httpie curl meld nginx dconf-cli

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
fase="Cloning Essencial Repos"
echo -e "${green}[START] ${fase}${NC}"
cd $HOME/development/git
git clone https://github.com/matheusmessora/dotfiles
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized
git clone https://github.com/matheusmessora/xXx-web
git clone https://github.com/matheusmessora/xXx
git clone https://github.com/matheusmessora/nfdonate
git clone https://github.com/matheusmessora/muonline
git clone https://github.com/matheusmessora/muonline-api2

echo -e  "${green}[ END ] ${fase}\n\n${NC}"
###########################################################################
fase="Configuring GIT"
echo -e "${green}[START] ${fase}${NC}"
info "Removing ${HOME}/.gitconfig file"
rm $HOME/.gitconfig -f
info "Provide your GIT user.name"

git config --global user.name "Matheus Messora"
git config --global user.email matheus.messora.vpn@gmail.com
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
cd $HOME/tmp
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
cd $HOME/tmp
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
cd $HOME/tmp
wget --no-check-certificate http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3065_amd64.deb
sudo dpkg -i sublime-text_build-3065_amd64.deb
sudo ln -sf /opt/sublime_text/sublime_text /usr/local/bin/sublime
fi
echo -e  "${green}[ END ] ${fase}\n\n${NC}"


###########################################################################
fase="Installing GNOME"
echo -e "${green}[START] ${fase}${NC}"
warn "[ATTENTION] This script will add some ppa repositories from gnome3-team.\nIt can cause some graphical problems"
info "Should GNOME be installed? Y/n"
read -n1 answer
if [[ $answer = "Y" || $answer = "y" ]]; then
info "If you insists...\nMAESTRO is now installing GNOME3"
warn "This step can take several minutes... Be patient! :)"
sleep 1
sudo add-apt-repository ppa:gnome3-team/gnome3-staging
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install gnome-weather gnome-maps gnome-photos gnome-music 
sudo apt-get update
sudo apt-get install gdm gnome-control-center gnome-session gnome-settings-daemon-schemas gnome-settings-daemon gnome-shell gnome-shell-extensions ubuntu-gnome-desktop gnome-tweak-tool
fi
echo -e  "${green}[ END ] ${fase}\n\n${NC}"


###########################################################################
fase="Installing WebStorm and IntelliJ"
echo -e "${green}[START] ${fase}${NC}"
info "Should I download and install? Y/n"
read -n1 answer
if [[ $answer = "Y" || $answer = "y" ]]; then
info "Downloading IntelliJ 14.0.2"
cd $HOME/tmp
wget --no-check-certificate http://download-cf.jetbrains.com/idea/ideaIU-14.0.2.tar.gz
info "Unzipping IntelliJ folder"
tar -zxvf ideaIU-14.0.2.tar.gz
mv $HOME/tmp/idea-IU-139.659.2 $HOME/apps -fv
sudo ln -sf $HOME/apps/idea-IU-139.659.2/bin/idea.sh /usr/local/bin/idea

info "Downloading WebStorm 9"
cd $HOME/tmp
wget --no-check-certificate http://download-cf.jetbrains.com/webstorm/WebStorm-9.0.1.tar.gz
info "Unzipping WebStorm folder"
tar -zxvf WebStorm-9.0.1.tar.gz
mv $HOME/tmp/WebStorm-139.252 $HOME/apps -fv
sudo ln -sf $HOME/apps/WebStorm-139.252/bin/webstorm.sh /usr/local/bin/webstorm
fi
echo -e  "${green}[ END ] ${fase}\n\n${NC}"


###########################################################################
fase="Installing JDK 1.7"
echo -e "${green}[START] ${fase}${NC}"
info "Should I download and install? Y/n"
read -n1 answer
if [[ $answer = "Y" || $answer = "y" ]]; then
info "Downloading Java JDK 1.7 64bits"
cd $HOME/tmp
wget --no-check-certificate http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.tar.gz
info "Unzipping Java JDK"
tar -zxvf jdk-7u71-linux-x64.tar.gz
mv $HOME/tmp/jdk1.7.0_71 $HOME/apps -fv
fi
echo -e  "${green}[ END ] ${fase}\n\n${NC}"


###########################################################################
fase="Installing Solarized... Time for colors"
echo -e "${green}[START] ${fase}${NC}"
info "Should I download and install? Y/n"
read -n1 answer
if [[ $answer = "Y" || $answer = "y" ]]; then
cd $HOME/tmp
wget --no-check-certificate https://raw.github.com/seebi/dircolors-solarized/master/dircolors.ansi-dark
mv dircolors.ansi-dark $HOME/.dircolors -fv
eval `dircolors ~/.dircolors`

cd $HOME/development/git/gnome-terminal-colors-solarized
info "\nNow I will execute install.sh from Solarized Theme. It will ask some questions, are you ready? (Press any key to continue)"
read -n1 mamama
./install.sh
info "\nYou must disable from your Terminal the color pallet. Make sure on Colors Tab the checkbox is NOT checked!"
info "(Press any key to continue)"
read -n1 mamama
fi
echo -e  "${green}[ END ] ${fase}\n\n${NC}"



###########################################################################
fase="Increasing Security!"
echo -e "${green}[START] ${fase}${NC}"
info "I will change yours /etc/hosts now."
sudo mv $HOME/development/git/dotfiles/hosts/hosts /etc/hosts
echo -e  "${green}[ END ] ${fase}\n\n${NC}"



###########################################################################
fase="Configuring Nginx"
echo -e "${green}[START] ${fase}${NC}"
mkdir --parents $HOME/development/nginx/sites-enabled
ln -sf $HOME/development/git/xXx-web/nginx.conf $HOME/development/nginx/sites-enabled/xxx
#ln -sf $HOME/development/git/nfdonate/nginx.conf $HOME/development/nginx/sites-enabled/nfdonate
sudo ln -sf $HOME/development/nginx/sites-enabled/* /etc/nginx/sites-enabled
echo -e  "${green}[ END ] ${fase}\n\n${NC}"




echo -e  "Finished provisioning..."


echo -e  "Finished provisioning..."
echo -e  "Thanks for watching!"
echo -e  "==== MAESTRO ===" 



