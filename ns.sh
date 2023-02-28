#! /usr/bin/bash

main () {
    if [[ ("$1" = '--help') || (-z "$1") ]]; then
        help
    else
        ns $1;
    fi
}

function ns () {
    echo "Fetching name server(s) for $1..."
    whois $1 | grep -E '(nserver)|(^\s+Name Server)|(DNS):';
    return 0;
}

function help () {
    cat <<HELP
  ____   ______
 /    \ /  ___/
|   |  \\___ \ 
|___|  /____  >
     \/     \/ 

Name: ns
Author: Kim Jisena <kimjisena@gmail.com>
Description: Fetches the name server(s) of a domain name

Usage:

    ns --help to show this help information

    ns DOMAIN_NAME

        DOMAIN_NAME - The domain name whose name server(s) are to be fetched

    example: ns google.com

Dependencies: whois
HELP

    return 0;
}

main "$@"
