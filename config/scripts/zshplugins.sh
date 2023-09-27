#!/usr/bin/env bash


# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Download zsh-history-substring-search
mkdir -p "/usr/share/zsh-history-substring-search"
wget -P "/usr/share/zsh-history-substring-search" "https://raw.githubusercontent.com/zsh-users/zsh-history-substring-search/master/zsh-history-substring-search.zsh"

# Download zsh-sudo
mkdir -p "/usr/share/zsh-sudo"
wget -P "/usr/share/zsh-sudo" "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh"

# Clone enhancd
git clone https://github.com/b4b4r07/enhancd.git /usr/share/enhancd

# Clone powerlevel10k with shallow copy
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /usr/share/zsh-theme-powerlevel10k