#!/bin/sh

RESET="\033[0m"
BOLD_YELLOW="\033[1;33m"
NONBOLD_YELLOW="\033[33m"

DF="/home/adrian/dotfiles"
MIQ="/home/adrian/ManageIQ/manageiq"
MIQUC="/home/adrian/ManageIQ/manageiq-ui-classic"

echo "${BOLD_YELLOW}Running \"git pull\" in \"${DF}\"${RESET}"
git -C "$DF" master && git -C "$DF" pull

echo "${BOLD_YELLOW}Running \"git f\" in \"${MIQ}\"${RESET}"
git -C "$MIQ" master && git -C "$MIQ" f

echo "${BOLD_YELLOW}Running \"git f\" in \"${MIQUC}\"${RESET}"
git -C "$MIQUC" master && git -C "$MIQUC" f

echo "${BOLD_YELLOW}Running \"bin/update\" in \"${MIQ}\"${RESET}"
cd "$MIQ" && bin/update
