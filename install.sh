#!/usr/bin/env bash

if [ "$1" == "home" ]
then
	home-manager switch --flake .#rhys@the-brick
else
	sudo nixos-rebuild switch --flake .#the-brick
fi