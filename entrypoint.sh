#!/bin/sh
while :
do
    echo "Checking for inactive hosts every $INTERVAL seconds..."

    rancher hosts --all --format json | jq '{ID,State} | select(.State!="active") | .ID' | xargs -I{} rancher rm --type host {}

    sleep $INTERVAL
done
