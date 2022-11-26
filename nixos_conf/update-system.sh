#!/bin/sh

# sudo nix-channel --update
# nix flake update --recreate-lock-file # update all the inputs in flake.lock 
# nix build --recreate-lock-file
nix flake update
# nix build
