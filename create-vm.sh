if (multipass info awesome-vm)
 then
  echo "The VM already exists"
 else
  echo "✨ Creating an awesome vm for you. One moment... ✨"
  multipass launch --name awesome-vm
fi


if (multipass info awesome-vm)
then
  echo "Launching awesome-vm"
  multipass shell awesome-vm
fi
