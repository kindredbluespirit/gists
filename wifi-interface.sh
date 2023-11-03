#!/bin/env zsh

## list hardware devices
lspci 
lsusb

## pci device
## Intel 802.11 wireless adapter

## list loaded modules
lsmod

## list all available modules
cat /proc/modules

## Look for the modules
lsmod | rg iwlwifi
lsmod | rg iwlmvm

## check for load errors in the log
dmesg | rg iwlwifi

## unload the modules, then reboot
rmmod iwlmvm
rmmod iwlwifi
reboot

## or
rmmod -f iwlwifi
reboot
