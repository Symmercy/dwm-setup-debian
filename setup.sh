#!/bin/bash
#Introducing
echo """                                                                                
                                                                                
                                                        ,(((                    
             .                                         (####(      .            
          .**                    ,             ,        .((/        **          
        ..,*.        .         ,,.             .,,         .        ,*,..       
      ......,.      ..           ,,           ,.           ..      .,......     
     ,....,.,**     ....       ....*,  ...  ,*....        ...     /**,.....,    
    ............,*,               . ..,   *.  .               ,*,............   
             .,..... ...,........**.   ...   .*,...,....,... ,....,.            
                .. .            ....,,,* *,,,...             . ..               
                 ..         . (### . ......  . ###(           ..                
       ,          ..        .. (##  .,     ..  ((( .         ..          .      
      *..          ..     .  .......... / ..........  .     ..          ..*     
        ,          ..  ....   ... ............. ....  ....  ..          ,       
                   ,.    ... ..    .         .    .. ...    .,                  
                  ....   ,,,.  ....           ....  ..,,   .  .                 
                              ,,,...         ....,,                             
                    ....,,,../.     .  ...  .     .(..,,,,....                  
                      ....(,....                 ....*(....                     
                      ...               .               ...                     
                         ...  . ...    ....    .. .  ...                        
             ,.          ,,.       ,, .,,,. ,.       ..,                        
            ,. ,.       ,,,..  .,   (##   ##(   ,.  ..,,,                       
               ,.          ,.    *(   (# #(   (*    ..                          
                ...            ., /(##*   *##(/ ..                              
                  . ....        /##,  (( ((  ,##*                               
                                  /(((.   .(((/                                 
                            .....  (#, * * ,((  .....                           
                            ......   /(/ /(/   .... ..                          
                                                                               
                    Ascii representation of logo                                          
"""
sleep 1
echo "
  _____                                    _               
 |  __ \\                                  | |              
 | |  | |_      ___ __ ___ ______ ___  ___| |_ _   _ _ __  
 | |  | \\ \\ / /| '_ \` _ \______/ __|/ _ \\ __| | | | '_ \ 
 | |__| |\\ V / | | | | | |     \\__ \\  __/ |_| |_| | |_) |
 |_____/  \\_/  |_| |_| |_|     |___/\\___|\\__|\\__,_| .__/ 
                                                    | |    
                                                    |_|    
"

#Upgrading
sudo apt update && sudo apt upgrade
sleep 3
#Installing dependencies

#Installing needed
sudo apt install build-essential libx11-dev libxft-dev libxinerama-dev libfreetype6-dev libfontconfig1-dev

#Installing extra

sleep 5
# Making a directory for suckless software
cd ~
mkdir .local
mkdir .local/.src

#Making a config for other software like yay
mkdir .local/.utils

#Going to the directory for suckless software
cd .local/.src

#Compiling my builds of suckless software
git clone https://github.com/Symmercy/dwm
git clone https://github.com/Symmercy/dmenu
git clone https://github.com/Symmercy/st
git clone https://github.com/Symmercy/slstatus
cd dwm
sudo make clean install
cd ..
cd dmenu
sudo make clean install
cd ..
cd st
sudo make clean install
cd ..
cd slstatus
sudo make clean install

#Putting a dwm.desktop file into the correct folder so i can log in
sudo mkdir /usr/share/xsessions
cd ~/dwm-setup
sudo mv dwm.desktop /usr/share/xsessions

#Installing nala (better apt)
sudo apt install nala

#Installing themes
#Place holder

#Installing software that isn't in apt
# brave
sudo apt install curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

#Installing wallpapers
cd ~
git clone https://github.com/zhichaoh/catppuccin-wallpapers
mv catppuccin-wallpapers .wall

#Going to home
cd ~

# starship install
curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init bash)"' >>.bashrc
starship preset nerd-font-symbols -o ~/.config/starship.toml

# adding nerd fonts
mkdir Download-temp
cd Download-temp
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/CascadiaCode.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Meslo.zip
unzip JetBrainsMono.zip
unzip CascadiaCode.zip
unzip Meslo.zip
sudo mv *.ttf /usr/share/fonts/TTF
rm -rf CascadiaCode.zip
cd ~
rm -rf Download-temp
sudo fc-cache -fv

#Autostart
cd ~
touch .xprofile
echo "feh --no-fehbg --bg-fill ~/.wall/minimalistic/gradient-synth-cat.png &" >>.xprofile
echo "picom &" >>.xprofile
echo "slstatus &" >>.xprofile
echo "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &" >>.xprofile
echo "flameshot &" >>.xprofile
echo "copyq &" >>.xprofile

#Adding aliases to .bashrc
echo "alias vim=\"nvim\"" >>~/.bashrc
echo "alias paru=\"yay\"" >>~/.bashrc
echo "alias ls=\"eza -al --color=always --group-directories-first\"" >>~/.bashrc
echo "alias cat=\"bat\"" >>~/.bashrc

#Adding an xresources file (catppuccin)
cd ~
git clone https://github.com/catppuccin/xresources
mv xresources xresources-temp
cd xresources-temp
mv macchiato.Xresources .Xresources
mv .Xresources ~
cd ~
rm -rf xresources-temp

#Enableing services with systemctl
systemctl enable #placeholder
#insert more services

#Installing lazyvim
cd ~/.config
rm -rf nvim
git clone https://github.com/LazyVim/starter
mv starter nvim

# Asking user about bluetooth, and setting up if the user types y
echo "Do you want to set up bluetooth?"
echo "(y/n)"
read -r bluetooth_choice

if [[ $bluetooth_choice == "y" ]]; then
	#Placeholder

	# Installing software
	echo "1 -- pipewire"
	echo "2 -- pulseaudio"
	read -r audio_choice

	# asking user for input
	if [[ $audio_choice == "1" ]]; then
		:
	elif [[ $audio_choice == "2" ]]; then
		#Placeholder
	else
		echo "Invalid choice."
	fi

	# if statement for installing pulseaudio-bluetooth
else
	:
fi

# Telling the user that it is finished and asking if the user wants to reboot
echo "Installing DWM is finished do you want to restart your PC"
echo "(y/n)"
read reboot_choice

#if statement for rebooting
if [[ $reboot-choice == "y" ]]; then
	reboot
else
	exit 0
fi
