#!/bin/zsh

if setxkbmap -query | grep layout | grep -q "us";
then
  setxkbmap pt
else
  setxkbmap us
fi
