# Check if Terraform is installed
if (which terraform)
then
  echo "Terraform is already installed."
  exit 0
else
  echo "Terraform is not installed. Proceeding with installation."
fi

# Check if gnupg is installed and if software-properties-common is 
available in the package cache.
if which gpg && apt-cache show software-properties-common; then
  echo 'gnupg and software-properties-common are already installed or 
available'
else
  echo 'Installing gnupg and software-properties-common...'
  sudo apt-get update && sudo apt-get install -y gnupg 
software-properties-common
fi
