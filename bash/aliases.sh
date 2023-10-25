#!/usr/bin/env bash

# Edit config files
alias edalias='nano .bash_aliases'
alias edbashrc='nano .bashrc'
alias edfuncs='nano .bash_functions'

# Commandline shortcuts
alias refresh='exec bash'
alias home='cd ~/'
alias cls='clear'
alias editrc='sudo nano .bashrc'
alias editalias='nano ~/.bash_aliases'
alias editfunc='nano ~/.bash_functions'
alias del='rm'
alias reboot='systemctl reboot -i'
alias sudel='sudo rm -i'
alias sudel='sudo rm -i'
alias rd='rmdir -rf'
alias surd='sudo rm -r'
alias md='mkdir'
alias mexec='chmod +x'
alias sumd='sudo mkdir'
alias sysinfo='inxi -Fxz'

# Application management
alias install='sudo nala install -y'
alias upgradable='nala list --upgradable'
alias purge='sudo nala purge'
alias search='nala search'
alias update='sudo nala update'
alias upgrade='sudo nala update && sudo nala upgrade -y'
alias snapi='sudo snap install'
