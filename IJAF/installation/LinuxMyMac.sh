#/bin/zsh

#Run clear to refresh
clear

#Welcome prompt
echo """
┓ •      ┳┳┓  ┳┳┓   •      ┓ 
┃ ┓┏┓┓┏┓┏┃┃┃┓┏┃┃┃┏┓┏┓┏┓╋┏┓┏┣┓
┗┛┗┛┗┗┻┛┗┛ ┗┗┫┛ ┗┗┻┗┗┛┗┗┗┛┛┛┗
             ┛               

Copyright (©) Josiah Nelson 2025
All rights reserved.

LinuxMyMacintosh is open source code!
https://github.com/itzJPN/LinuxMyMacintosh

========================================

Welcome to LinuxMyMacintosh!

This installer script will get you started with 
lima linux containers for your server needs,
offering SSH and more.

This script will install lima in your home directory,
so if you do not trust lima or this script you may
exit by typing "n", to not install lima or run
this script.

You may view the code for this script at
https://github.com/itzJPN/LinuxMyMacintosh,

and you can view the code for lima at
https://github.com/lima-vm/lima

========================================
"""
echo "Would you like to install? (y/n) "
read install

# Convert to lowercase to handle Y or y, N or n.
install=${install:l}

if [[ "$install" == "y" ]]; then

clear

#Installing Prompt
echo """
┓ •      ┳┳┓  ┳┳┓   •      ┓ 
┃ ┓┏┓┓┏┓┏┃┃┃┓┏┃┃┃┏┓┏┓┏┓╋┏┓┏┣┓
┗┛┗┛┗┗┻┛┗┛ ┗┗┫┛ ┗┗┻┗┗┛┗┗┗┛┛┛┗
             ┛               

Copyright (©) Josiah Nelson 2025
All rights reserved.

LinuxMyMacintosh is open source code!
https://github.com/itzJPN/LinuxMyMacintosh

========================================

Please hang tight while we configure
and install Linux to run on your Mac.

This process usually takes around a min.

The dir that we will install Linux & lima to 
is ~/LinuxMyMacintosh

========================================


"""

mkdir ~/LinuxMyMacintosh
cd ~/LinuxMyMacintosh
echo Made folder ~/LinuxMyMacintosh

echo
curl -L -o lima.tar.gz https://github.com/lima-vm/lima/releases/download/v2.0.1/lima-2.0.1-Darwin-arm64.tar.gz
echo Downloaded lima.tar.gz

echo
tar -xzf lima.tar.gz
echo Decompressed lima.tar.gz
echo This file will still be in ~/LinuxMyMacintosh

echo
cd bin

chmod +x lima limactl
xattr -d com.apple.quarantine lima xattr -d com.apple.quarantine limactl

clear

#Config Prompt
echo """
┓ •      ┳┳┓  ┳┳┓   •      ┓ 
┃ ┓┏┓┓┏┓┏┃┃┃┓┏┃┃┃┏┓┏┓┏┓╋┏┓┏┣┓
┗┛┗┛┗┗┻┛┗┛ ┗┗┫┛ ┗┗┻┗┗┛┗┗┗┛┛┛┗
             ┛               

Copyright (©) Josiah Nelson 2025
All rights reserved.

LinuxMyMacintosh is open source code!
https://github.com/itzJPN/LinuxMyMacintosh

========================================

Lima is now installed to ~/LinuxMyMacintosh

We need to ask you a few things before we start
your Linux VM.

To reconfigure your VM at a later time, pass
-reconfigure to LinuxMyMacintosh when running
the script.

========================================
"""
echo "How much storage do you want your VM to have? (eg, 10GiB)"
read storageCONFIG

echo "Thanks, now what version of Linux do you want installed?"
echo "Please paste the link to the .img or leave blank to skip:"
read linuxInstall

if [[ "$linuxInstall" == "" ]]; then
    echo "Skipping installation."
else
    echo "Installing from $linuxInstall..."
    cat > linuxinstall.yaml <<EOF
arch: "aarch64"
cpus: 2
memory: "2GiB"
disk: "8GiB"

images:
  - location: "$linuxInstall"
    arch: "aarch64"

mounts:
  - location: "~"
    writable: true
EOF

    ./limactl create -f linuxinstall.yaml default
fi

clear

echo """
┓ •      ┳┳┓  ┳┳┓   •      ┓ 
┃ ┓┏┓┓┏┓┏┃┃┃┓┏┃┃┃┏┓┏┓┏┓╋┏┓┏┣┓
┗┛┗┛┗┗┻┛┗┛ ┗┗┫┛ ┗┗┻┗┗┛┗┗┗┛┛┛┗
             ┛               

Copyright (©) Josiah Nelson 2025
All rights reserved.

LinuxMyMacintosh is open source code!
https://github.com/itzJPN/LinuxMyMacintosh

========================================

Lima and LinuxMyMacintosh is now installed
in ~/LinuxMyMacintosh.

To run Lima, please run
cd ~/LinuxMyMacintosh/bin; ./limactl start default

Thanks for using the LinuxMyMacintosh installer!

========================================
"""


elif [[ "$install" == "n" ]]; then
clear

#Goodbye prompt
echo """
┓ •      ┳┳┓  ┳┳┓   •      ┓ 
┃ ┓┏┓┓┏┓┏┃┃┃┓┏┃┃┃┏┓┏┓┏┓╋┏┓┏┣┓
┗┛┗┛┗┗┻┛┗┛ ┗┗┫┛ ┗┗┻┗┗┛┗┗┗┛┛┛┗
             ┛               

Copyright (©) Josiah Nelson 2025
All rights reserved.

LinuxMyMacintosh is open source code!
https://github.com/itzJPN/LinuxMyMacintosh

========================================

Goodbye! Please remember that you can easily
run this script again to install lima and
get Linux running on your Macintosh.

========================================
"""
else
    echo "Sorry, this script does not reconize that. Please enter y or n."
fi