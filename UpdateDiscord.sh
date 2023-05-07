#!/usr/bin/zsh

tar -xvf ~/Downloads/discord*
mv ~/Downloads/Discord ~/Downloads/discord

rm -r ~/.local/share/discord
mv ~/Downloads/discord ~/.local/share/