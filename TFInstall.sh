# Check if gnupg is installed
if (command -v gpg > /dev/null)
then
  echo "gnupg is already installed."
else
  echo "Installing gnupg..."
  sudo apt-get install -y gnupg
fi

# Check if software-properties-common is installed
if (dpkg -s software-properties-common > /dev/null 2>&1)
then
  echo "software-properties-common is already installed."
else
  echo "Installing software-properties-common..."
  sudo apt-get install -y software-properties-common
fi

# Check if the HashiCorp GPG key and repository are added
if (apt-cache policy terraform | grep -q 'hashicorp')
then
  echo "HashiCorp repository is already present. Skipping addition of GPG key and repository."
else
  echo "Adding the HashiCorp GPG key and repository."
fi

# Ensure /etc/apt/keyrings directory exists
if [ -f /etc/apt/sources.list.d/hashicorp.list ]
then
  echo "HashiCorp repository is already in the sources list."
else
  echo "Adding HashiCorp repository to sources list."
  echo "deb [signed-by=/etc/apt/keyrings/hashicorp.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
  sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null
  sudo apt-get update
fi

# Check if the HashiCorp keyring file exists
if [ -f /etc/apt/keyrings/hashicorp.gpg ]
then
  echo "Hashicorp keyring file already exists."
else
  echo "Downloading and dearmoring the HashiCorp key..."
  wget -O- https://apt.releases.hashicorp.com/gpg | \
  gpg --dearmor | \
  sudo tee /etc/apt/keyrings/hashicorp.gpg > /dev/null
fi

# Add the HashiCorp repository
if [ ! -f /etc/apt/sources.list.d/hashicorp.list ]
then
  echo "Adding HashiCorp repository to sources list."
  echo "deb [signed-by=/etc/apt/keyrings/hashicorp.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
  sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null
  sudo apt-get update
fi

# Install Terraform if not already installed
if (command -v terraform > /dev/null)
then
  echo "Terraform is already installed."
else
  echo "Installing Terraform..."
  sudo apt-get install -y terraform
  echo "Terraform is now installed on your computer 👏👏👏"
fi
