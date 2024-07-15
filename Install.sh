#!/bin/bash
echo 
echo -e "\033[31m == Confirmation... == \033[0m"
confirm()
{
    read -r -p "${1} [Y/n] " answer
    case "$answer" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}
if confirm "Are you sure to install the program ?"; then
    sudo apt-get update & sudo apt-get full-upgrade -y
    echo "The software will install..."
    sudo apt-get install xserver-xorg-input-evdev xinput-calibrator xorg unclutter chromium-browser -y
    sudo cp -rf /usr/share/X11/xorg.conf.d/10-evdev.conf /usr/share/X11/xorg.conf.d/45-evdev.conf
    sudo rm /home/kiosk/.profile
    sudo rm /home/kiosk/.xinitrc
    cd /home/kiosk/
    sudo wget https://raw.githubusercontent.com/MopigamesYT/WP_Kiosk_Raspi/main/.profile
    sudo wget https://raw.githubusercontent.com/MopigamesYT/WP_Kiosk_Raspi/main/.xinitrc
    cd /
    sudo wget https://raw.githubusercontent.com/MopigamesYT/WP_Kiosk_Raspi/main/st.sh
    echo -e "\033[31m Setting your config file \033[0m"
    sleep 3
    sudo nano /boot/config.txt
    echo -e "\033[31m Setting Xorg (X11) \033[0m"
    sleep 3
    sudo nano /etc/X11/xorg.conf.d/98-dietpi-disable_dpms.conf
    echo -e "\033[31m Setting your screen resolution and chromium argument \033[0m"
    sleep 3
    sudo nano /home/kiosk/.xinitrc
    echo -e "\033[31m The operation was done ! \033[0m"
    cd /home/kiosk/
else
    echo "The operation was canceled by the user."
fi

confirm()
{
    read -r -p "${1} [Y/n] " answer
    case "$answer" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}
if confirm "Do you want to restart ?"; then
    echo "Reboot."
    sudo reboot
else
    echo "The operation was canceled."
fi
