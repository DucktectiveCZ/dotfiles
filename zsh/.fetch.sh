#!/bin/sh
#
# ufetch-arch - tiny system info for arch

## INFO

host="$(cat /etc/hostname)"
os='Arch Linux'
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
packages="$(pacman -Q | wc -l)"
shell="$(basename "${SHELL}")"

## DEFINE COLORS

# probably don't change these
if [ -x "$(command -v tput)" ]; then
	bold="$(tput bold 2> /dev/null)"
	black="$(tput setaf 0 2> /dev/null)"
	red="$(tput setaf 1 2> /dev/null)"
	green="$(tput setaf 2 2> /dev/null)"
	yellow="$(tput setaf 3 2> /dev/null)"
	blue="$(tput setaf 4 2> /dev/null)"
	magenta="$(tput setaf 5 2> /dev/null)"
	cyan="$(tput setaf 6 2> /dev/null)"
	white="$(tput setaf 7 2> /dev/null)"
	reset="$(tput sgr0 2> /dev/null)"
fi

# you can change these
lc="${reset}${bold}${blue}"         # labels
nc="${reset}${bold}${blue}"         # user and hostname
ic="${reset}"                       # info
c0="${reset}${blue}"                # first color

center() {
    local s="$1"
    local w="$2"
    local len=${#s}
    local pad=$(( (w - len) / 2 ))
    printf "%*s%s%*s\n" "$pad" "" "$s" "$((w - len - pad))" ""
}

## OUTPUT

cat <<EOF
${c0}
${c0}                     MMMMMM
${c0}                   MM      MM
${c0}                 MM          MM
${c0}                 MM      MM  MM
${c0}                 MM        ====MM
${c0}                   MM      MMMM
${c0}     MM              MM  MM
${c0}   MM  MM        MMMM    MM
${c0}   MM    MMMMMMMM          MM
${c0}   MM                        MM
${c0}     MM              MM      MM
${c0}     MM    MM      MM        MM
${c0}       MM    MMMMMMMM      MM
${c0}       MM                  MM
${c0}         MMMM          MMMM
${c0}             MMMMMMMMMM
 
        ${lc}host  ${ic}${host}${reset}
        ${lc}  os  ${ic}${os}${reset}
        ${lc}user  ${ic}${USER}${reset}

EOF

