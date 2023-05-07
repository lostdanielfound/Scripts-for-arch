#!/bin/bash

# Constants
cyan_const="\e[36m"
red_const="\e[31m"
end_const="\e[0m"

echo -e "$cyan_const=== Updating Arch ===$end_const"

# Perform full update, root prompt
sudo pacman -Syu
if [ $? != 0 ]; then
  echo "$red_const An error has occured when updating the OS $end_const"
  exit -1 
fi

# Deletes old cached updates 
sudo pacman -Scc

# Optional: Remove orphaned packages
echo -e "$cyan_const* Would you want to remove orphaned packages left on this system? (y/n)$end_const"
read choice1
case "$choice1" in
  y|Y ) sudo pacman -Rs $(pacman -Qdtq);;
  n|N ) continue;;
esac

# Optional: Remove old versions of installed packages
echo -e "$cyan_const* Would you want to remove old version of installed packages on this system? (y/n)$end_const"
read choice2
case "$choice2" in 
  y|Y ) sudo paccache -rk 1;;
  n|N ) continue;;
esac

if [ $? != 0 ]; then
  echo "$red_const* error occured with paccache$end_const"
  exit -1
if

# Optional: Reboot the system if needed
if [ -f /var/run/reboot-required ]; then
  echo "Reboot is required to complete the update."
  read -p "Do you want to reboot now? (y/n) " choice
  case "$choice" in
    y|Y ) sudo reboot;;
    n|N ) exit;;
    * ) echo "Invalid choice." && exit;;
  esac
fi 

echo "=== Update Complete! ==="
