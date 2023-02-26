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
if [[ ${WEEKFROMNOW} -le ${CURRTIMESTAMP} ]]; then
    # alert for update/upgrade
    echo "A week has passed, Update your system.."
    read -p "Run pacman -Syu ? [y/N]" INPUT
    case ${INPUT} in
        [yY]) sudo pacman -Syu
              date +%s > ${FILE};; # update timestamp
        *) exit 1;;
    esac
fi
