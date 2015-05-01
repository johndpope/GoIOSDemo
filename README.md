# GoIOSDemo

A very bare-bones iOS app demonstrating the power of Go to add two numbers.

## Acknowledgements

Many thanks to minux for creating the Go iOS port and keithkml for the
excellent series of [posts](https://medium.com/using-go-in-mobile-apps) on
Mobile Go.

## Requirements

Requires Go compiled from the tip of master. For details, see the [gomobile
docs](https://godoc.org/golang.org/x/mobile/cmd/gomobile)

Build cross-compilers for both armv7 and arm64:

    cd $GOROOT/src
    CGO_ENABLED=1 GOARCH=arm64 CC_FOR_TARGET=`pwd`/../misc/ios/clangwrap.sh CXX_FOR_TARGET=`pwd`/../misc/ios/clangwrap.sh ./make.bash
    CGO_ENABLED=1 GOARCH=arm GOARM=7 CC_FOR_TARGET=`pwd`/../misc/ios/clangwrap.sh CXX_FOR_TARGET=`pwd`/../misc/ios/clangwrap.sh ./make.bash

## Building

Ensure the newly-built `go` executable is in your path.

To build the Go library:

    cd gocode
    ./build.sh

This will generate `go_includes.h` and `libgo.a`, which are required by the
XCode project.

Now, build the app in XCode.

