#!/bin/bash
for f in `pwd`/dots/*
do
    ln -sf "$f" "$HOME/.${f##*/}"
done
