# Check if Terraform is installed
if (which terraform)
then
  echo "Terraform is already installed."
  exit 0
else
  echo "Terraform is not installed. Proceeding with installation."
fi

# Check if gnupg is installed
if (which gpg)
then
  echo "gnupg is already installed."
else
  echo "Installing gnupg"
  sudo apt-get install -y gnupg
fi

# Check if software-properties-common is installed
if dpkg -s software-properties-common > /dev/null 2>&1; then
  echo 'software-properties-common is already installed'
else
  echo 'Installing software-properties-common...'
  sudo apt-get update && sudo apt-get install -y software-properties-common
fi

