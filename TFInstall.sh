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

