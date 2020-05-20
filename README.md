# Shell_ftp
file transfer protocol via WWW

     
     $ ftpget ftp:// < server_name >/ < path >/ <file_name>.tar.gz
     
    
* Application

  * 1. Request Target URL with Page to be downloaded
 
  * 2. Text Message with Image
 
  * 3. Mail Send/ Received with Mail_Body
    
* Script

          #!/bin/bash
          # ftpget-- to get file in anoynymous way.

          anonpass = "$logname@$(hostname)"

          if [ $# -ne 1 ]; then
              echo"execution way is : $0 ftp://..." >&2
              exit 1
          fi

          if [ "$( echo $1 | cut -c1-6)" != "ftp://"]; then
              echo"$0: plz to start url string with ftp://." >&2
              exit 1
          fi

          server = '$( echo $1 | cut -d / -f3)'
          filename = '$( echo $1 | cut -d/ -f4-)'
          basefile = '$( basename $filename )'

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

* Syntax


  * (a) $0, $#, $n, $?
  
  https://github.com/QueenieCplusplus/Shell_echo#common-variable

(to be continued...)

