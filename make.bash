#!/usr/bin/env bash

mkdir -p build

CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go build -o build/cbconvert
strip build/cbconvert

CGO_LDFLAGS="-L/usr/i686-pc-mingw32/usr/lib" \
CGO_CFLAGS="-I/usr/i686-pc-mingw32/usr/include -I/usr/i686-pc-mingw32/usr/include/poppler/glib -I/usr/i686-pc-mingw32/usr/include/glib-2.0 -I/usr/i686-pc-mingw32/usr/include/cairo" \
CGO_CXXFLAGS="-I/usr/i686-pc-mingw32/usr/include -I/usr/i686-pc-mingw32/usr/include/poppler/glib -I/usr/i686-pc-mingw32/usr/include/glib-2.0 -I/usr/i686-pc-mingw32/usr/include/cairo" \
CGO_CPPFLAGS="-I/usr/i686-pc-mingw32/usr/include -I/usr/i686-pc-mingw32/usr/include/poppler/glib -I/usr/i686-pc-mingw32/usr/include/glib-2.0 -I/usr/i686-pc-mingw32/usr/include/cairo" \
PKG_CONFIG=/usr/bin/i686-pc-mingw32-pkg-config \
PKG_CONFIG_PATH=/usr/i686-pc-mingw32/usr/lib/pkgconfig \
PKG_CONFIG_LIBDIR=/usr/i686-pc-mingw32/usr/lib/pkgconfig \
CC="i686-pc-mingw32-gcc" CXX="i686-pc-mingw32-g++" \
CC_FOR_TARGET=i686-pc-mingw32-gcc CXX_FOR_TARGET=i686-pc-mingw32-g++ \
CGO_ENABLED=1 GOOS=windows GOARCH=386 go build -x -work -o build/cbconvert.exe -ldflags "-linkmode external -extldflags -static"
i686-pc-mingw32-strip build/cbconvert.exe
