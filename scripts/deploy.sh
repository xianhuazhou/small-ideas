#!/bin/bash
# A simple deployment script can deploy changes from local to live with Rsync
# Before you start, you may need to create a config directory with some files: rsync_exclude.txt, rsync_include.txt and rsync_files.txt.

# Local files need to be deployed to live
SOURCE_DIR="/var/www/local.dev/"

# Server side related settings 
TARGET_DIR="user@host:/var/www/yoursite.com/"

# rsync related options
SSH='ssh'
RSYNC=/usr/bin/rsync
OPTIONS="-azC --force --delete --progress"
EXCLUDE_FILE="${SOURCE_DIR}config/rsync_exclude.txt"
INCLUDE_FILE="${SOURCE_DIR}config/rsync_include.txt"
FILES_LIST="${SOURCE_DIR}config/rsync_files.txt"

if [[ -f $EXCLUDE_FILE ]]; then
    OPTIONS="${OPTIONS} --exclude-from=${EXCLUDE_FILE}"
fi

if [[ -f $INCLUDE_FILE ]]; then
    OPTIONS="${OPTIONS} --include-from=${INCLUDE_FILE}"
fi

if [[ -f $FILES_LIST ]]; then
    OPTIONS="${OPTIONS} --files-from=${FILES_LIST}"
fi

if [[ $1 == "go" ]]
then
    DRYRUN=""
else
    DRYRUN=" --dry-run"
fi

$RSYNC $DRYRUN $OPTIONS -e $SSH $SOURCE_DIR $TARGET_DIR

if [[ $DRYRUN == "" ]]
then
    echo "DONE!!!"
else
    echo
    echo "-------------------------"
    echo "Command: $RSYNC $DRYRUN $OPTIONS $SOURCE_DIR $TARGET_DIR"
    echo "Please run the script with 'go' to do the real deployment."
    echo "-------------------------"
fi
