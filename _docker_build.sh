#! /bin/sh

set -e
set -x

CONFIG="/app/config"

west build -s zmk/app -d build/left -b glove80_lh -- -DZMK_CONFIG=${CONFIG}
mv ./build/left/zephyr/zmk.uf2 /output/left.uf2

west build -s zmk/app -d build/right -b glove80_rh -- -DZMK_CONFIG=${CONFIG}
mv ./build/right/zephyr/zmk.uf2 /output/right.uf2

chown ${PUID}:${PGID} /output/*
