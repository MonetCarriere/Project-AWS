# first make sure all terraform dependencies are installed
# Check if gnupg is installed
if which gpg > /dev/null 2>&1; then
  echo 'gnupg and software-properties-common are already installed'
else
  echo 'Installing gnupg and software-properties-common...'
  sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
fi

# Check if the HashiCorp GPG key is present
if gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint | grep -q 'HashiCorp'; then
  echo 'HashiCorp GPG key is already present.'
else
  echo 'HashiCorp GPG key not found. Adding the key now.'
  wget -O- https://apt.releases.hashicorp.com/gpg | \
  gpg --dearmor | \
  sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
fi

# Verify the key's fingerprint
if gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint | grep -q 'HashiCorp'; then
  echo 'HashiCorp GPG key fingerprint verified.'
else
  echo 'Error: HashiCorp GPG key fingerprint verification failed.'
  exit 1
fi

# Check if the HashiCorp repository is already present
if grep -q 'hashicorp.list' /etc/apt/sources.list.d/hashicorp.list; then
  echo 'HashiCorp repository is already present.'
else
  echo 'Adding HashiCorp repository.'
  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
  sudo tee /etc/apt/sources.list.d/hashicorp.list
fi

# Update package information from HashiCorp
echo 'Updating package information from HashiCorp repository.'
sudo apt update

# Check if Terraform is already installed
if command -v terraform > /dev/null; then
  echo 'Terraform is already installed.'
else
  echo 'Installing Terraform.'
  sudo apt-get install -y terraform
fi

echo 'Terraform installation script completed successfully!'



