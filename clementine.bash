#!/bin/bash

set -u
set -e
set -o pipefail
set -x

export LANG=C
#export CC=gcc-4.9
#export CXX=g++-4.9

cd "${0%/*}/../Clementine"
git clean -fdx .
cd bin

: cmake \
  -LH \
  .. \
;

cmake \
  -DENABLE_AUDIOCD=OFF \
  -DENABLE_BOX=OFF \
  -DENABLE_DEVICEKIT=OFF \
  -DENABLE_DROPBOX=OFF \
  -DENABLE_GIO=OFF \
  -DENABLE_GOOGLE_DRIVE=OFF \
  -DENABLE_LIBGPOD=OFF \
  -DENABLE_LIBLASTFM=OFF \
  -DENABLE_LIBMTP=OFF \
  -DENABLE_MOODBAR=OFF \
  -DENABLE_SEAFILE=OFF \
  -DENABLE_SKYDRIVE=OFF \
  -DENABLE_SOUNDMENU=OFF \
  -DENABLE_SPARKLE=OFF \
  -DENABLE_SPOTIFY_BLOB=OFF \
  -DENABLE_VISUALISATIONS=OFF \
  -DENABLE_VK=OFF \
  -DENABLE_WIIMOTEDEV=OFF \
  .. \
  2>&1 \
|tee cmake.log \
;

make \
  -j2 \
  2>&1 \
|tee make.log \

