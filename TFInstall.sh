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

# Check if the HashiCorp GPG key and repository are added
if apt-cache policy terraform | grep -q 'hashicorp'
then
  echo "HashiCorp repository is already present. Skipping addition of GPG key and repository."
else
  echo "Adding the HashiCorp GPG key and repository."

  # Add the HashiCorp GPG key using apt-key
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AA16FCBCA621E701

  # Add the official HashiCorp Linux repository to the sources list
  sudo sh -c 'echo "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hashicorp.list'

  # Update the package list again to recognize the HashiCorp repository
  sudo apt-get update
fi

# Check if software-properties-common is installed
if dpkg -s software-properties-common > /dev/null 2>&1; then
  echo 'software-properties-common is already installed'
else
  echo 'Installing software-properties-common...'
  sudo apt-get install -y software-properties-common
fi

