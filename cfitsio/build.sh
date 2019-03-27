#! /bin/bash

set -e

if [ $(uname) = Darwin ] ; then
    # Needed to get 'union semun' definition used in drvrsmem.c:
    export CFLAGS="$CFLAGS -D_DARWIN_C_SOURCE"
fi

./configure --prefix=$PREFIX --enable-reentrant || { cat config.log ; exit 1 ; }
make stand_alone utils

# test-ish programs:
./cookbook
./speed
./testprog

make shared
make install

rm -f $PREFIX/bin/cookbook $PREFIX/bin/speed $PREFIX/bin/testprog
