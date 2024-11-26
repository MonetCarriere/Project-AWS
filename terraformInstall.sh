#!/bin/bash

## CONDITIONAL 1
echo "Installing prerequisites..."
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

## CONDITIONAL 2
echo "Adding HashiCorp GPG key..."
wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

## CONDITIONAL 3 it actually is two if thens. 

if gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint
then 
  echo 'The keys fingerprint is verified'
else 
  echo 'the fingerprint is not verified, lets try again to get it right my dude!'
  wget -O- https://apt.releases.hashicorp.com/gpg | \
  gpg --dearmor | \
  sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
fi
# if verification fails, retrieve keys from hashicorp archive again.  
echo "Re-verifying the GPG key..."
if gpg --no-default-keyring \
       --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
       --fingerprint
then
  echo "The GPG key was successfully re-added and verified."
else
  echo "Failed to verify the GPG key after re-adding it. Please check manually."
 
fi

## CONDITIONAL 4
echo "Adding HashiCorp repository..."
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list

## CONDITIONAL 5
echo "Updating package lists..."
sudo apt update

## CONDITIONAL 6
echo "Installing Terraform..."
sudo apt-get install terraform

## CONDITIONAL 7
echo "Installation complete. Run 'terraform --version' to verify."
