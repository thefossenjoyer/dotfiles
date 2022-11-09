#!/bin/sh

pushd ~/dotfiles/nixos_conf/
home-manager switch -f ./users/thefossenjoyer/home.nix
popd
