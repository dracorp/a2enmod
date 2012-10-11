#!/bin/bash - 
#===============================================================================
#
#          FILE: fix.path.sh
# 
#         USAGE: ./fix.path.sh 
# 
#   DESCRIPTION: fix patch in configuration files
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Piotr Rogoża (piecia), rogoza dot piotr at gmail dot com
#  ORGANIZATION: dracoRP
#       CREATED: 11.10.2012 11:38:16 CEST
#      REVISION:  ---
#===============================================================================


if [ -d mods-available ]; then
    cd mods-available
    for file in *.conf *.load; do
        #/usr/lib/apache2/modules => /usr/lib/httpd/modules
        sed -e 's#\s/usr/lib/apache2/modules# modules#g' -i $file
        
        #/var/lock => /run/lock
        sed -e 's#\s/var/lock# /run/lock#g' -i $file

        #/var/run => /run
        sed -e 's#\s/var/run# /run#g' -i $file
        
        #/var/www => /srv/http
        sed -e 's#\s/var/www# /srv/http#g' -i $file
    done
fi
