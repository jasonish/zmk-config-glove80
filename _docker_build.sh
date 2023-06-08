#! /bin/sh

set -e
set -x

CONFIG="/app/config"

side=""
board=""

case "$1" in
    left)
        side="left"
        board="glove80_lh"
        ;;
    right)
        side="right"
        board="glove80_rh"
        ;;
    "")
        echo "error: no side provided"
        exit 1
        ;;
    *)
        echo "error: bad side: $1"
        exit 1
        ;;
esac

west build -s zmk/app -d build/${side} -b ${board} -- -DZMK_CONFIG=${CONFIG}
mv ./build/${side}/zephyr/zmk.uf2 /output/${side}.uf2

chown ${PUID}:${PGID} /output/*
