#!/bin/sh
GOAGENT_DATA=/usr/share/goagent-client
GOAGENT_ETC=/etc/goagent-client
GOAGENT_CA="$GOAGENT_ETC"/CA.crt
GOAGENT_USER_INI="$GOAGENT_ETC"/goagent.user.ini
RUN_DIR=$(mktemp -u -t goagent-client.XXXXXX)
cp -r "$GOAGENT_DATA" "$RUN_DIR" || exit 1
if [ -f "$GOAGENT_CA" ]; then
    ln -s "$GOAGENT_CA" "$RUN_DIR"/CA.crt
else
    echo "!! No CA.crt in $GOAGENT_ETC!"
fi
if [ -f "$GOAGENT_USER_INI" ]; then
    ln -s "$GOAGENT_USER_INI" "$RUN_DIR"/goagent.user.ini
else
    echo "!! No goagent.user.ini in $GOAGENT_ETC!"
fi
exec $RUN_DIR/goagent >$RUN_DIR/$(date +%Y%m%d-%H%M%S).log 2>&1
