#!/bin/sh

RESET="\033[0m"
BOLD_YELLOW="\033[1;33m"
NONBOLD_YELLOW="\033[33m"

DF="/home/adrian/dotfiles"
MIQ="/home/adrian/ManageIQ/manageiq"
MIQUC="/home/adrian/ManageIQ/manageiq-ui-classic"

echo "${BOLD_YELLOW}Running \"git up\" in \"${DF}\"${RESET}"
git -C "$DF" master && git -C "$DF" up

echo "${BOLD_YELLOW}Running \"git up\" in \"${MIQ}\"${RESET}"
git -C "$MIQ" master && git -C "$MIQ" up

echo "${BOLD_YELLOW}Running \"git up\" in \"${MIQUC}\"${RESET}"
git -C "$MIQUC" master && git -C "$MIQUC" up

echo "${BOLD_YELLOW}Running \"bundler update\" in \"${MIQ}\"${RESET}"
cd "$MIQ" && bundler install

echo "${BOLD_YELLOW}Running \"bin/update\" in \"${MIQ}\"${RESET}"
cd "$MIQ" && bin/update
