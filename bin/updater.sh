#!/bin/sh

RESET="\033[0m"
BOLD_YELLOW="\033[1;33m"
BOLD_RED="\033[1;31m"
REGULAR_YELLOW="\033[33m"

DF="/home/adrian/dotfiles"
BT="/home/adrian/Documents/BT"
ISA="/home/adrian/Documents/ISA"
MIQ="/home/adrian/ManageIQ/manageiq"
MIQUC="/home/adrian/ManageIQ/manageiq-ui-classic"
MIQBOT="/home/adrian/ManageIQ/miq_bot"

Ask() {
    while true; do
        read -r -p "$1 [Y/N]: " ans
        case $ans in
            [Y,y]) return 0 ;;
            [N,n]) return 1 ;;
            *) ;;
        esac
    done
}

retval_bundler=$(Ask "`echo "${BOLD_RED}Run \\\"gem install bundler --pre\\\" in \\\"${MIQ}\\\"?${RESET}"`"; echo $?)
retval_binupdate=$(Ask "`echo "${BOLD_RED}Run \\\"bin/update\\\" in \\\"${MIQ}\\\"?${RESET}"`"; echo $?)

echo "${BOLD_YELLOW}Running \"git pull\" in \"${DF}\"${RESET}"
git -C "$DF" master && git -C "$DF" pull

echo "${BOLD_YELLOW}Running \"git pull\" in \"${BT}\"${RESET}"
git -C "$BT" master && git -C "$BT" pull

echo "${BOLD_YELLOW}Running \"git pull\" in \"${ISA}\"${RESET}"
git -C "$ISA" master && git -C "$ISA" pull

echo "${BOLD_YELLOW}Running \"git f\" in \"${MIQ}\"${RESET}"
git -C "$MIQ" f

echo "${BOLD_YELLOW}Running \"git f\" in \"${MIQUC}\"${RESET}"
git -C "$MIQUC" f

echo "${BOLD_YELLOW}Running \"git f\" in \"${MIQBOT}\"${RESET}"
git -C "$MIQBOT" f

if [ $retval_bundler -eq 0 ]; then
    echo "${BOLD_YELLOW}Running \"gem install bundler --pre\" in \"${MIQ}\"${RESET}"
    echo "${REGULAR_YELLOW}Current `cd "$MIQ" && bundler -v | awk '{print tolower($0)}'`${RESET}"
    cd "$MIQ" && gem install bundler --pre
    echo "${REGULAR_YELLOW}New `cd "$MIQ" && bundler -v | awk '{print tolower($0)}'`${RESET}"
fi

if [ $retval_binupdate -eq 0 ]; then
    echo "${BOLD_YELLOW}Running \"bin/update\" in \"${MIQ}\"${RESET}"
    cd "$MIQ" && bin/update
fi
