# nano should be installed
if (which nano)
then
  echo 'nano already installed'
else
  echo 'installing nano'
  brew install nano
fi

#git should be installed
if (git --version)
then
  echo 'git already installed'
else
  echo 'installing git'
  brew install git
fi

#multipass should be installed
if (multipass version)
then
  echo 'multipass already installed'
else
  echo 'installing multipass'
  brew install multipass
fi

# Check if all applications are installed
if (which nano && git --version && multipass version); then
  echo 'Setup is complete! 💻 🎉'
fi
