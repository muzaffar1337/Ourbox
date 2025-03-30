#!/bin/bash

#sudo apt update && sudo apt upgrade -y

sudo apt update
sudo apt-get install -y arandr flameshot arc-theme feh i3blocks i3status i3 i3-wm lxappearance python3-pip rofi unclutter cargo compton papirus-icon-theme imagemagick
sudo apt-get install -y libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev autoconf meson
sudo apt-get install -y libxcb-render-util0-dev libxcb-shape0-dev libxcb-xfixes0-dev terminator mpv wget zsh polybar net-tools kitty

mkdir -p /home/kali/.local/share/fonts/

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip

unzip Iosevka.zip -d /home/kali/.local/share/fonts/
unzip RobotoMono.zip -d /home/kali/.local/share/fonts/

fc-cache -fv


mkdir /home/kali/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip
unzip Hack.zip -d /home/kali/.fonts/



git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps && mkdir -p build && cd build && meson ..
ninja
sudo ninja install
cd ../..

pip3 install pywal

mkdir -p /home/kali/.config/i3
mkdir -p /home/kali/.config/compton
mkdir -p /home/kali/.config/rofi
mkdir -p /home/kali/.config/polybar
mkdir -p /home/kali/.config/terminator
cp config/kitty /home/kali/.config/kitty
cp config/terminator/config /home/kali/.config/terminator/
cp config/polybar/* /home/kali/.config/polybar/
cp -r config/bin /home/kali/.config/
cp config/i3/config /home/kali/.config/i3/config
cp config/i3/i3blocks.conf /home/kali/.config/i3/i3blocks.conf
cp config/compton/compton.conf /home/kali/.config/compton/compton.conf
cp config/rofi/config /home/kali/.config/rofi/config
cp fehbg /home/kali/.fehbg
cp config/i3/clipboard_fix.sh /home/kali/.config/i3/clipboard_fix.sh
cp -r wallpaper /home/kali/.wallpaper

chmod +x /home/kali/.config/bin/*
chmod +x /home/kali/.config/polybar/launch.sh

wget https://raw.githubusercontent.com/undiabler/nord-rofi-theme/master/nord.rasi
mv nord.rasi /usr/share/rofi/themes/
#echo "Done! Grab some wallpaper and run pywal -i filename to set your color scheme. To have the wallpaper set on every boot edit /home/kali.fehbg"
#echo "After reboot: Select i3 on login, run lxappearance and select arc-dark"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
