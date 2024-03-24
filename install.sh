#!/usr/bin/env bash

if [ "$1" == "home" ]
then
	home-manager switch -b backup --flake .#rhys@the-brick
elif [ "$1" == "upgrade" ]
then
    nix flake update
    sudo nix-channel --update
elif [ "$1" == "system" ]
then
	sudo nixos-rebuild switch --upgrade --flake .#the-brick
elif [ "$1" == "garbage" ]
then
    sudo nix-collect-garbage
fi
