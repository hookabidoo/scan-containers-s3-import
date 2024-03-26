#!/bin/sh
# set LAMBDA_URL="https://123abcde52.execute-api.ap-southeast-2.amazonaws.com/dev"
# set APP_ID=1234-0abcdefce49131f457393
TMPFILE=$(mktemp)
SCANFILE="$1"
FILE_EXTENSION="${SCANFILE##*.}" 
curl -k -o "$TMPFILE" -X POST -H 'content-type: application/json'  -d '{"app_id":"'$APP_ID'","ext":"'$FILE_EXTENSION'"}' $LAMBDA_URL
cat $TMPFILE
URL=`jq -r ".url" "$TMPFILE"`
KEY=`jq -r ".fields.key" "$TMPFILE"`
DATA=""
for FIELD in `jq ".fields | keys[]" "$TMPFILE"`
do
if [ "$FIELD" = "\"key\"" ] ; then continue; fi
PARAM=$(echo $FIELD|tr -d '"')"="$(jq -r ".fields.$FIELD" $TMPFILE)
DATA=$DATA" -F $PARAM"
done
echo $DATA x
rm $TMPFILE
TMPUPLOAD="/tmp/$KEY"
cp "$SCANFILE"  $TMPUPLOAD
curl -k -v -L -F "key=$KEY" $DATA -F "file=@$TMPUPLOAD" $URL
rm $TMPUPLOAD
