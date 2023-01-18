#!/bin/bash
clear ; cd "$(dirname "${0}")"

PROJECT=test-3

create() {
    pwd ; echo ; npx create-react-app ${PROJECT} --template typescript --skip-git ; echo ; echo
}

log() {
	pwd ; echo ; git log -n 9 --oneline ; echo ; echo
}

pull() {
    pwd ; echo ; pull ; echo ; echo
}

status() {
    pwd ; echo ; git status -sb ; echo ; echo
}

versions() {
	echo "node: $(node --version)"
	echo "npm: $(npm --version)"
	echo "nvm: $(nvm --version)"
	echo "npx: $(npx --version)"
}

if [ ${#} -eq 0 ] ; then
	echo -e "Usage: ${0} [COMMANDS]\nAvailable commands:"
	cat `basename ${0}` | grep '()\s{' | while read COMMAND ; do echo " - ${COMMAND::-4}" ; done
else
	for COMMAND in "${@}" ; do "${COMMAND}" ; done
fi
