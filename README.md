# MyConfig


## Introduction

This repo contains script files that handle post-installation tasks and install the apps that I would like to use on my PC.

For now I am using Fedora so the script files are only for Fedora Linux. But the dotfiles can be used for any other distros.

## Linux post-installation tasks

* Install apps
* Setup vim and vundle
* Get some fonts
* Copy dotfiles to home directory
* Install oh-my-zsh

## Install MyConfig

### Requirements

Please install `git` first if it is not installed already.

### Installation

Clone the repo to your downloads directory.
~~~
git clone https://github.com/sarmadna/.myconfig.git ~/.myconfig
~~~

Navigate to `.myconfig/fedora`

First run the `base.sh` script to install the basic apps

Then run the other scripts depending on the DE you use like `gnome.sh` or  `kde.sh`

