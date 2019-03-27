#!/bin/bash

export CFLAGS="$CFLAGS -I$PREFIX/include -L$PREFIX/lib"
export LDFLAGS="-L$PREFIX/lib"
export CFITS_INC="-I$PREFIX/include"
export CFITS_LIB="-L$PREFIX/lib -lcfitsio -lm"
export NETPBM_INC="-I$PREFIX/include"
export NETPBM_LIB="-L$PREFIX/lib -lnetpbm"
export ZLIB_INC="-I$PREFIX/include"
export ZLIB_LIB="-L$PREFIX/lib -lz"

make
make extra
make install INSTALL_DIR="$PREFIX"
