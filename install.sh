#!/usr/bin/env bash

if [ "$1" == "home" ]
then
	home-manager switch --flake .#rhys@the-brick
elif [ "$1" == "upgrade" ]
then
    nix flake update
    sudo nix-channel --update
elif [ "$1" == "system" ]
then
	sudo nixos-rebuild switch --upgrade --flake .#the-brick
fi
