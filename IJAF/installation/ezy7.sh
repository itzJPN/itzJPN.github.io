#!/bin/zsh

clear
echo Before we install, where do you want to install BasiliskII This is required.
echo It is recommended you use ~/ to install it in your home directory.
read "DIR?Enter a directory path: "

# Make the proper dirs for BasiliskII and the roms to install to
echo Making Dirs 

mkdir $DIR/BasiliskII
echo Made $DIR/BasiliskII

cd $DIR/BasiliskII 

mkdir ROMS
echo Made $DIR/BasiliskII/ROMS

mkdir Disks
echo Made $DIR/BasiliskII/Disks

mkdir Shared
echo Made $DIR/BasiliskII/Shared

ls -l; cd Disks
dd if=/dev/zero of=MacHD.dsk bs=1m count=800
echo Making blank drive for BasiliskII called MacHD.dsk

cd $DIR/BasiliskII

echo Making prefs file for BasiliskII to run

cat > ~/Library/Preferences/BasiliskII_prefs <<EOL
ROM file = $DIR/BasiliskII/ROMS/MacIIci.ROM
RAM size = 67108864
Screen width = 1024
Screen height = 768
Disk 0 = $DIR/BasiliskII/Disks/MacHD.dsk
Disk 1 = $DIR/BasiliskII/Disks/MacOS7.dsk
Shared Folder = /Users/jnelson/BasiliskII/Shared
EOL

echo Downloading required files for BasiliskII from itzJPN.github.io/IJAF/installation/Ezy7/

#install MacOS 7
curl -L https://itzJPN.github.io/IJAF/installation/Ezy7/MacOS7.dsk -o Disks/MacOS7.dsk
echo Downloaded MacOS 7.

#place the rom
curl -L https://itzJPN.github.io/IJAF/installation/Ezy7/MacIIci.ROM -o ROMS/MacIIci.ROM
echo Placed rom... if you need more roms please visit https://github.com/itzJPN/itzJPN.github.io/tree/main/IJAF/installation/ezy7 to download more.

#finally, install BasiliskII
curl -L https://itzJPN.github.io/IJAF/installation/Ezy7/BasiliskII.zip -o BasiliskII.zip
unzip BasiliskII.zip

echo BasiliskII, MacOS 7, the config file, and your rom is installed!
echo BasiliskII will now open.
echo 
echo If you want to open BasiliskII with MacOS 7 in the future, please use the command below to do so.
echo In order for the vm to start correctly, you must use this command to start Basilisk.
echo Enter in this command in the future to start BasiliskII, you might want to save this in a safe place:
echo
echo cd $DIR/BasiliskII
echo ./BasiliskII.app/Contents/MacOS/BasiliskII \
echo --rom $DIR/BasiliskII/ROMS/MacIIci.ROM \
echo --disk $DIR/BasiliskII/Disks/MacOS7.dsk \
echo --ramsize 67108864 \
echo --fpu true

sleep 3
echo Opening your new VM!

./BasiliskII.app/Contents/MacOS/BasiliskII \
  --rom /Users/jnelson/BasiliskII/ROMS/MacIIci.ROM \
  --disk /Users/jnelson/BasiliskII/Disks/MacOS7.dsk \
  --ramsize 67108864 \
  --fpu true