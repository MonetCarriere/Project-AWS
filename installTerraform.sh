# Check if gnupg is installed
if which gpg > /dev/null 2>&1; then
  echo 'gnupg and software-properties-common are already installed'
else
  echo 'Installing gnupg and software-properties-common...'
  sudo apt-get update && sudo apt-get install -y gnupg
software-properties-common
fi
