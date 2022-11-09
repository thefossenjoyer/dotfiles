#!/bin/sh

pushd ~/dotfiles/nixos_conf/ # jump to the dir
sudo nixos-rebuild switch -I nixos-config=./system/configuration.nix
popd # go the the previous dir
