#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Directory to download the fonts
DIR="/usr/share/fonts/meslo"

# URLs of the fonts
URLS=(
"https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
"https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
"https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
"https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"
)

# Create directory if it doesn't exist
if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
fi

# Download each font
for url in "${URLS[@]}"; do
    wget -q -P "$DIR" "$url"
done

echo "Fonts downloaded to $DIR."

# Fira Code Nerd fonts

DIR="/usr/share/fonts/firacode"

# Fetch the download URL for FiraCode.zip from the latest release
DOWNLOAD_URL=$(curl -s "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest" | jq -r '.assets[] | select(.name == "FiraCode.zip") | .browser_download_url')

# Create the target directory if it doesn't exist
sudo mkdir -p "$DIR"

# Download FiraCode.zip and extract it to the target directory
curl -L "$DOWNLOAD_URL" -o "/tmp/FiraCode.zip"
sudo unzip "/tmp/FiraCode.zip" -d "$DIR"

# Clean up the downloaded zip file
rm "/tmp/FiraCode.zip"

echo "Fonts downloaded to $DIR."

# Update the font cache
fc-cache -fv