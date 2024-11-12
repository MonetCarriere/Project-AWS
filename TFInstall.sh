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

# Check if the HashiCorp repository is already present
if grep -q 'hashicorp.list' /etc/apt/sources.list.d/hashicorp.list; then
  echo 'HashiCorp repository is already present.'
else
  echo 'Adding HashiCorp repository...'
  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] 
\
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
  sudo tee /etc/apt/sources.list.d/hashicorp.list
fi


