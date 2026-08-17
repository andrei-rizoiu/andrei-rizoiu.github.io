#!/bin/bash

# clean the current work folder
echo -ne "--> Cleaning the local folders for temporary files ..."
clean-folder.sh > /dev/null ;
echo -e " done!"

############### NeCTAR VM target
TARGETSERVER="andrei@rizoiu.eu"
TARGETFOLDER="/home/andrei/public_html/personal-website/"		#the install version

# Uploading to server
# NOTE (2026-08-17): the live site is served by GitHub Pages from this repo (CNAME -> rizoiu.eu);
# the NeCTAR VM below no longer answers on 80/443. This rsync is legacy. If it is ever revived,
# the --exclude list is load-bearing: rsync does NOT honour .gitignore, so without it the whole of
# dev/ would be published -- pre-publication drafts, *.bak-* backups of earlier wordings, and
# internal review notes. Keep this list in sync with .gitignore.
echo -ne "--> Uploading new version to NeCTAR VM server ... "
rsync -avz --delete \
      --exclude=".git" \
      --exclude="dev" \
      --exclude="*.bak" --exclude="*.bak-*" --exclude="*.bak_*" \
      --exclude="~\$*" \
      ./ $TARGETSERVER:$TARGETFOLDER #> /dev/null ; #WARNING: this will delete all other files in the remote folder and sync it with the current
echo -e " done!"
