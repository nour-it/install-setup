# !bin/bash
home=$HOME

# dns resolver
# sudo cp ./tools/dns.resolv /root/dns.resolv
# sudo chmod +x /root/dns.resolv
# echo "$(date)---------------" >> log
# echo "dns resolver configured" >> log

# # tools
# sudo apt update
# sudo apt install -y curl vim fish git htop tree gcc make i3 i3-wm 

# # fish
# echo "
#     alias statuswatch \"watch -c SYSTEMD_COLORS=1 systemctl --user status\"\n
#     alias upgrade \"sudo apt update -y; and sudo apt upgrade -y; and sudo apt dist-upgrade -y\"\n
# " > "${home}/.config/fish/config.sh"

# curl -sL https://git.io/fisher > fisher
# fish -c "source fisher 
# fisher install jorgebucaran/fisher
# fisher install rafaelrinaldi/pure"
# rm -f fisher 
# if ! grep -Fxq "/usr/bin/fish" /etc/shells; then
#     sudo echo /usr/bin/fish | sudo tee -a /etc/shells
# fi
# sudo chsh -s /usr/bin/fish
# echo "fish installed" >> log

# i3
cp ./tools/i3/config "${home}/.config/i3/config"
cp ./tools/i3/.i3status.conf "${home}/.i3status.conf"
echo "i3 installed" >> log

# git
# git config --global user.name 'nourit'
# git config --global user.email 'reply.nourit@gmail.com'
# echo "git installed" >> log

# done
echo "done ----------" >> log  
