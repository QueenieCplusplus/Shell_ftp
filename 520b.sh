#!/bin/bash
# ftpget-- to get file in anoynymous way.

anonpass="$logname@$(hostname)"

if [ $# -ne 1 ]; then
    echo"execution way is : $0 ftp://..." >&2
    exit 1
fi

if [ "$( echo $1 | cut -c1-6)" != "ftp://"]; then
    echo"$0: plz to start url string with ftp://." >&2
    exit 1
fi

server='$( echo $1 | cut -d / -f3)'
filename='$( echo $1 | cut -d/ -f4-)'
basefile='$( basename $filename )'

ftp -np << EOF
open $server
user ftp $anonpass
get "$filename" "$basefile"
quit
EOF

if [ $? -ne 0 ]; then
    ls -l $basefile 
fi

exit 0


