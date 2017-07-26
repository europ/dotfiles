#!/bin/sh

RESET="\033[0m"
BOLD_YELLOW="\033[1;33m"

MIQ="/home/adrian/ManageIQ/manageiq"
MIQUC="/home/adrian/ManageIQ/manageiq-ui-classic"

echo "${BOLD_YELLOW}git up \"${MIQ}\"${RESET}"
git -C "$MIQ" up
echo "${BOLD_YELLOW}git up \"${MIQUC}\"${RESET}"
git -C "$MIQUC" up

echo "${BOLD_YELLOW}bin/update \"${MIQ}\"${RESET}"
cd "$MIQ" && bin/update
