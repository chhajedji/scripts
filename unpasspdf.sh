#!/bin/bash

command -v pdftk >/dev/null
PRECHECK=$?

if [ $PRECHECK -ne 0 ]; then
    echo "Pdftk not present, please insall it."
    exit 1
fi

if [ $# -gt 0 ]; then
    for INPUTS in "$@"; do
        INP="$(realpath $INPUTS)"

        echo -n "Enter password for $INPUTS: "
        read -s PASS

        OP="$(echo -n $INP | sed 's:\(.*\)\.pdf:\1-nopass.pdf:g')"

        pdftk "$INP" input_pw "$PASS" output "$OP" 2>/dev/null

        [ $? -eq 0 ] && printf "\nOutput saved at $OP\n"

    done
else

    echo -n "Location of PDF with password: "
    read INP

    echo -n "Password of the PDF: "
    read -s PASS

    OP="$(echo -n $INP | sed 's:\(.*\)\.pdf:\1-nopass.pdf:g')"

    pdftk "$INP" input_pw "$PASS" output "$OP" 2>/dev/null
    [ $? -eq 0 ] && printf "\nOutput saved at $OP\n"

fi
exit $?
