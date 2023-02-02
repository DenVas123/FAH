#!/bin/bash

#Used during development, deleted installed kernels and iumages to stop them from being commited to github.

sudo rm ./linux/Mips/*
sudo rm ./linux/Mipsel/*
sudo rm ./linux/Arm/*
sudo rm ./linux/Armel/*

sudo ./clean.sh
