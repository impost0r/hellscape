#!/bin/bash
ARG1=`cat /dev/random | gtr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1`
sleep 45
((ARG1^=`hexdump -n 16 -e '4/4 "%08X" 1 "\n"' /dev/urandom | sed -e 's/^/0x/'`))
sleep 45
((ARG1^=`openssl rand -hex 32 | base64 | hexdump -n 16 -e '4/4 "%08X" 1 "\n"' |  sed -e 's/^/0x/'`))
sleep 45
((ARG1^=`hexdump -n 16 -e '4/4 "%08X" 1 "\n"' /dev/random | sed -e 's/^/0x/'`))
echo $ARG1
