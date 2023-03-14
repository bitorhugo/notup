#!/usr/bin/bash

# check if first timestamp exists
FILE=$(pwd)/timestamp
if [[ ! -f "${FILE}" ]]; then
    date +%s > ${FILE}
fi

TIMESTAMP=$(cat ${FILE})
WEEKFROMNOW=$((${TIMESTAMP} + 604800))
CURRTIMESTAMP=$(date +%s)

# check if one week has passed
if [[ ${CURRTIMESTAMP} -gt ${WEEKFROMNOW} ]]; then
    # alert for update/upgrade
    echo "A week has passed, Update your system.."
    echo "Run pacman -Syu ? [y/N]"
    read INPUT
    case ${INPUT} in
        [yY]) date +%s > ${FILE}
              sudo pacman -Syu;; # update timestamp
    esac
fi
