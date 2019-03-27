#!/bin/bash

# remove ncurses tic.h that conficts with astrometry tic.h
rm -f $CONDA_PREFIX/include/tic.h

export CFLAGS="$CFLAGS -I$PREFIX/include -L$PREFIX/lib -I$CONDA_PREFIX/include -L$CONDA_PREFIX/lib"
export LDFLAGS="$LDFLAGS -L$PREFIX/lib -L$CONDA_PREFIX/lib"
export CFITS_INC="-I$CONDA_PREFIX/include"
export CFITS_LIB="-L$CONDA_PREFIX/lib -lcfitsio -lm"
export NETPBM_INC="-I$CONDA_PREFIX/include"
export NETPBM_LIB="-L$CONDA_PREFIX/lib -lnetpbm"
export CAIRO_INC="-I$CONDA_PREFIX/include -I$CONDA_PREFIX/include/cairo"
export CAIRO_LIB="-L$CONDA_PREFIX/lib -lcairo -lXrender"
export PNG_INC="-I$CONDA_PREFIX/include"
export PNG_LIB="-L$CONDA_PREFIX/lib -lpng16"
export JPEG_INC="-I$CONDA_PREFIX/include"
export JPEG_LIB="-L$CONDA_PREFIX/lib -ljpeg"
export ZLIB_INC="-I$CONDA_PREFIX/include"
export ZLIB_LIB="-L$CONDA_PREFIX/lib -lz"
#export WCSLIB_INC="-I$CONDA_PREFIX/include/wcslib -I$CONDA_PREFIX/include"
#export WCSLIB_LIB="-L$CONDA_PREFIX/lib -lwcs"
#export SYSTEM_GSL=yes
#export GSL_INC="-I$CONDA_PREFIX/include -I$CONDA_PREFIX/include/gsl"
#export GSL_LIB="-L$CONDA_PREFIX/lib -lgsl -lblas"

make
make extra
make install INSTALL_DIR="$PREFIX"
