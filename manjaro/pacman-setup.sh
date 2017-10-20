sudo rm -r /etc/pacman.d/gnupg
sudo pacman-key --init
sudo pacman-key --populate archlinux manjaro 
sudo pacman-key --refresh-keys
sudo pacman -Sy gnupg archlinux-keyring manjaro-keyring

# alternative, less successful suggestion
#sudo rm -r /etc/pacman.d/gnupg
#sudo pacman -Sy gnupg archlinux-keyring manjaro-keyring
#sudo pacman-key --init
#sudo pacman-key --populate archlinux manjaro 
#sudo pacman-key --refresh-keys

