#!/bin/sh
#
# ufetch-arch - tiny system info for Arch Linux

## INFO
host="$(cat /etc/hostname)"
os='Arch Linux'
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
packages="$(pacman -Q | wc -l)"
shell="$(basename "${SHELL}")"

## DEFINE COLORS
pink="\033[38;2;235;111;146m"  # #eb6f92
bold="\033[1m"
reset="\033[0m"

lc="${bold}${pink}"  # labels
nc="${bold}${pink}"  # user/host
ic="${reset}"        # info
c0="${pink}"         # ASCII art

center() {
    local s="$1"
    local w="$2"
    local len=${#s}
    local pad=$(( (w - len) / 2 ))
    printf "%*s%s%*s\n" "$pad" "" "$s" "$((w - len - pad))" ""
}

## ASCII ART
ascii="${c0}
                     MMMMMM
                   MM      MM
                 MM          MM
                 MM      MM  MM
                 MM        ====MM
                   MM      MMMM
     MM              MM  MM
   MM  MM        MMMM    MM
   MM    MMMMMMMM          MM
   MM                        MM
     MM              MM      MM
     MM    MM      MM        MM
       MM    MMMMMMMM      MM
       MM                  MM
         MMMM          MMMM
             MMMMMMMMMM
"

## OUTPUT
echo -e "$ascii"
echo -e "        ${lc}host  ${ic}${host}${reset}"
echo -e "        ${lc}  os  ${ic}${os}${reset}"
echo -e "        ${lc}user  ${ic}${USER}${reset}"
# echo -e "        ${lc}kernel${ic}${kernel}${reset}"
# echo -e "        ${lc}uptime${ic}${uptime}${reset}"
# echo -e "        ${lc}shell ${ic}${shell}${reset}"
# echo -e "        ${lc}pkgs  ${ic}${packages}${reset}"
