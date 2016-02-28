#!/usr/bin/bash

## Send to daslab server 1
# Send the matlab files
scp ~/Rakshit/mage-dev/ros/{ch4.mat,compressGP.m,config.txt,Env_Init.m,ExpandNFuse.m,exploringPI.m,extract_ch4.m,GPGridWorld.m,Init.m,init_test.m,kernel.m,onlineGP.m,PolicyIteration.m,ros_env.sh,Rot.m,Sensor_info.m,testros.m} rakshit@daslab-server1:~/Rakshit/ros/
# copy the python libraries
scp -r ~/Rakshit/mage-dev/ros/src/mage/libraries rakshit@daslab-server1:~/Rakshit/ros/src/mage
# copy the messages
scp -r ~/Rakshit/mage-dev/ros/src/mage/msg rakshit@daslab-server1:~/Rakshit/ros/src/mage
# copy the services
scp -r ~/Rakshit/mage-dev/ros/src/mage/srv rakshit@daslab-server1:~/Rakshit/ros/src/mage

## Send to daslab server 2
# Send the matlab files
scp ~/Rakshit/mage-dev/ros/{ch4.mat,compressGP.m,config.txt,Env_Init.m,ExpandNFuse.m,exploringPI.m,extract_ch4.m,GPGridWorld.m,Init.m,init_test.m,kernel.m,onlineGP.m,PolicyIteration.m,ros_env.sh,Rot.m,Sensor_info.m,testros.m} dragonborn@daslab-server2:~/Rakshit/ros/
# copy the python libraries
scp -r ~/Rakshit/mage-dev/ros/src/mage/libraries rakshit@daslab-server1:~/Rakshit/ros/src/mage
# copy the messages
scp -r ~/Rakshit/mage-dev/ros/src/mage/msg dragonborn@daslab-server2:~/Rakshit/ros/src/mage
# copy the services
scp -r ~/Rakshit/mage-dev/ros/src/mage/srv dragonborn@daslab-server2:~/Rakshit/ros/src/mage

## Send to daslab server 3
# Send the matlab files
scp ~/Rakshit/mage-dev/ros/{ch4.mat,compressGP.m,config.txt,Env_Init.m,ExpandNFuse.m,exploringPI.m,extract_ch4.m,GPGridWorld.m,Init.m,init_test.m,kernel.m,onlineGP.m,PolicyIteration.m,ros_env.sh,Rot.m,Sensor_info.m,testros.m} thedoctor@daslab-server3:~/Rakshit/ros/
# copy the python libraries
scp -r ~/Rakshit/mage-dev/ros/src/mage/libraries thedoctor@daslab-server3:~/Rakshit/ros/src/mage
# copy the messages
scp -r ~/Rakshit/mage-dev/ros/src/mage/msg thedoctor@daslab-server3:~/Rakshit/ros/src/mage
# copy the services
scp -r ~/Rakshit/mage-dev/ros/src/mage/srv thedoctor@daslab-server3:~/Rakshit/ros/src/mage
