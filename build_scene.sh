set -eux

cd scene/$1

PYTHONPATH=~/d3d10 \
    python -m collada.main \
    $1.DAE \
    $1.lua \
    $1.vtx \
    $1.vjw \
    $1.idx \
    $1.rc \
    $1.mk
