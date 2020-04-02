#!/bin/bash

# clean the current work folder
echo -ne "--> Cleaning the local folders for temporary files ..."
clean-folder.sh > /dev/null ;
echo -e " done!"

############### DigitalOcean VM target
TARGETSERVER="andrei@rizoiu.eu"
TARGETFOLDER="/home/andrei/public_html/personal-website/"		#the install version

# Uploading to server
echo -ne "--> Uploading new version to NeCTAR VM server ... "
rsync -avz --delete --exclude=".git" ./ $TARGETSERVER:$TARGETFOLDER #> /dev/null ; #WARNING: this will delete all other files in the remote folder and sync it with the current
echo -e " done!"
