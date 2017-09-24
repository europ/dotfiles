#!/bin/sh

RESET="\033[0m"
BOLD_YELLOW="\033[1;33m"
REGULAR_YELLOW="\033[33m"

DF="/home/adrian/dotfiles"
MIQ="/home/adrian/ManageIQ/manageiq"
MIQUC="/home/adrian/ManageIQ/manageiq-ui-classic"
MIQBOT="/home/adrian/ManageIQ/miq_bot"

echo "${BOLD_YELLOW}Running \"git pull\" in \"${DF}\"${RESET}"
git -C "$DF" master && git -C "$DF" pull

echo "${BOLD_YELLOW}Running \"git f\" in \"${MIQ}\"${RESET}"
git -C "$MIQ" f

echo "${BOLD_YELLOW}Running \"git f\" in \"${MIQUC}\"${RESET}"
git -C "$MIQUC" f

echo "${BOLD_YELLOW}Running \"git f\" in \"${MIQBOT}\"${RESET}"
git -C "$MIQBOT" f

echo "${BOLD_YELLOW}Running \"gem install bundler --pre\" in \"${MIQ}\"${RESET}"
echo "${REGULAR_YELLOW}Current `cd "$MIQ" && bundler -v | awk '{print tolower($0)}'`${RESET}"
cd "$MIQ" && gem install bundler --pre
echo "${REGULAR_YELLOW}New `cd "$MIQ" && bundler -v | awk '{print tolower($0)}'`${RESET}"

echo "${BOLD_YELLOW}Running \"bin/update\" in \"${MIQ}\"${RESET}"
cd "$MIQ" && bin/update
