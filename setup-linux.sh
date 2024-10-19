#!/bin/bash

# Check if nano is installed
if (which nano)
then
  echo 'nano already installed'
else
  echo 'installing nano'
  sudo apt update && sudo apt install -y nano
fi

# Check if git is installed
if (git --version)
then
  echo 'git already installed'
else
  echo 'installing git'
  sudo apt update && sudo apt install -y git
fi

# Check if multipass is installed
if (multipass --version)
then
  echo 'multipass already installed'
else
  echo 'installing multipass'
  sudo snap install multipass --classic
  echo 'please wait for ten seconds'
  sleep 10
fi
# Check if specific vm exists, if not, create it.
if (multipass info aws-vm)
then 
  echo 'the Vm already exists'
else
  echo 'creating aws-vm'
  mulitpass launch --name aws-vm
  multipass list
fi

# Check if all applications are installed
if (which nano && git --version && multipass --version)
then
  echo 'Setup is complete! 💻 🎉'
else
  echo 'Setup failed. Please check for errors.'
fi
