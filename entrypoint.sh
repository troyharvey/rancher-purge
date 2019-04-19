#!/bin/sh
while :
do
    echo "Checking for inactive hosts every $INTERVAL seconds..."

    # Stop any disconnected hosts
    rancher hosts --all --format json | jq '{ID,State} | select(.State=="disconnected") | .ID' --raw-output | xargs -I{} rancher stop {}

    # Remove any inactive hosts
    rancher hosts --all --format json | jq '{ID,State} | select(.State!="active") | .ID' --raw-output | xargs -I{} rancher rm --type host {} |

    sleep $INTERVAL
done
