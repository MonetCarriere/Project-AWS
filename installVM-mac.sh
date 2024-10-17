# Checks if multipass is installed

if which multipass >/dev/null 2>&1; then
  echo "Multipass is already installed 🤘😎"
else
  echo "Hold on... installing multipass⏳"  
  brew install multipass
  echo "Multipass is almost ready... just give it 10 more seconds ⏰"
  sleep 10
fi


if (multipass info mos-vm)
then
  echo "The VM already exists"
else
  echo "Creating mos-vm"
  multipass launch --name mos-vm
  multipass list
fi
