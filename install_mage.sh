#! /bin/bash

clear

export mage_path=$HOME/Rakshit/mage		# Change the installation path here
mkdir $mage_path

export fg_path=$mage_path/FlightGear
mkdir $fg_path

export install_root=$(pwd)

# COMMANDS TO INSTALL FLIGHTGEAR
#fg dependencies
sudo apt-get install git subversion build-essential cmake cmake-curses-gui libpng12-dev libfreetype6-dev libjpeg-dev libgif-dev libtiff5-dev libxmu-dev libxi-dev freeglut3-dev libalut-dev libxft-dev libxinerama-dev libboost-dev libplib-dev libopenscenegraph-dev libsvn-dev libudev-dev libfontconfig1-dev

cd fgsrc
mkdir build-sg
cd build-sg
cmake -D CMAKE_INSTALL_PREFIX:PATH="$fg_path" $install_root/fgsrc/simgear
make -j2 install

cd $install_root

cd fgsrc
mkdir build-fg
cd build-fg
cmake -D CMAKE_INSTALL_PREFIX:PATH="$fg_path" $install_root/fgsrc/flightgear
make -j2 install

cd $fg_path
ln -s $install_root/fgsrc/fgdata data

# COMMANDS TO INSTALL QGROUNDCONTROL
#extract the qgroundcontrol
cd $install_root
tar xjf QGroundControl-Stable-V2.5.0.tar.bz2 -C $mage_path
#qgc dependencies
sudo add-apt-repository ppa:beineri/opt-qt541-trusty
sudo add-apt-repository ppa:qgroundcontrol/ppa
sudo apt-get update && sudo apt-get install qgroundcontrol
sudo apt-get install libqt5location5 libqt5location5-plugins


# END INSTALLATIONS

#copy created protocol files inside FGdata folder
basic_aircrafts=(c172p B-52F eurofighter f16 Mig-29)

# overwrite the current nasal files for each aircrafts with the updated ones
for i in "${basic_aircrafts[@]}";do
	cp -a $install_root/libraries/nasalfiles/. $fg_path/data/Aircraft/$i/Nasal/ 
	cp -f $install_root/libraries/nasalfiles/$i/. $fg_path/data/Aircraft/$i/
done
         
cp -a $install_root/libraries/fgprotocol/. $fg_path/data/Protocol/

# copy all the files and folders in modules to the main folder
cp -a $install_root/libraries/modules/. $mage_path/

cd $mage_path/mavbridge
make -f linkmake # creates the fgqgclink executeable



