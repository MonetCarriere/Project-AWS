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
  sudo apt-get install -y software-properties-common
fi

# Check if the HashiCorp GPG key and repository are added
if apt-cache policy terraform | grep -q 'hashicorp'
then
  echo "HashiCorp repository is already present. Skipping addition of GPG key and repository."
else
  echo "Adding the HashiCorp GPG key and repository."
fi

# Check if /etc/apt/keyrings directory exists
if [ -d "/etc/apt/keyrings" ]
then
  echo "/etc/apt/keyrings directory already exists."
else
  echo "Creating /etc/apt/keyrings directory."
  sudo mkdir -p /etc/apt/keyrings
fi

# check if the keyring file is present, if it is do nothing, if it isnt grab it from hashicorp and dearmor it

if [ -f /etc/apt/keyrings/hashicorp.gpg ]
then
  echo "Hashicorp keyring file already exists."
else
  echo "Hashicorp keyring file not found. Downloading and dearmoring it..."
  
  # Download the Hashicorp GPG key
  curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/hashicorp.gpg
fi  

  # Install Terraform
if command -v terraform
  echo "Terraform is already installed"
else
  echo "Installing Terraform..."
  sudo apt-get install -y terraform
  echo "Terraform is now installed on your computer 👏👏👏"
fi
