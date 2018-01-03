#!/bin/bash
# Script to save patches from lists

PATCH_FILE=`mktemp --tmpdir="/data/tmp"  mutt-patch.XXXXXX`
cat > $PATCH_FILE
MAILBOX=`cat $PATCH_FILE | formail -c -xSubject: | tr "'" "." | sed -e '{ s@\[@@g; s@\]@@g; s@[*()" \t]@_@g; s@[/:]@-@g; s@^ \+@@; s@\.\.@.@g; s@-_@_@g; s@__@_@g; s@\.$@@; }' | cut -c 1-70`.patch

mv "$PATCH_FILE" "/data/misc/patches/incoming/$MAILBOX"
