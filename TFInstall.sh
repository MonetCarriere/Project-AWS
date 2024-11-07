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

 # Create a directory for keyrings if it doesn't exist
  sudo mkdir -p /etc/apt/keyrings

  # Download and add the HashiCorp GPG key to /etc/apt/keyrings
  curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/hashicorp.gpg

  # Add the official HashiCorp Linux repository to the sources list, referencing the GPG key
  echo "deb [signed-by=/etc/apt/keyrings/hashicorp.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null

  # Update the package list to recognize the HashiCorp repository
  sudo apt-get update

fi

  # Install Terraform
if command -v terraform
then
  echo "Terraform is already installed"
else
  echo "Installing Terraform..."
  sudo apt-get install -y terraform
  echo "Terraform is now installed on your computer 👏👏👏"
fi
