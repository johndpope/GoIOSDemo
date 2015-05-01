#!/bin/sh

set -e

# ARM64 build
CGO_ENABLED=1 GOARCH=arm64 go tool cgo main.go
CGO_ENABLED=1 GOARCH=arm64 go build -ldflags '-tmpdir _obj -linkmode external' main.go
ar rcs _obj/arm64.a _obj/*.o
cp _obj/_cgo_export.h _obj/go_includes_arm64.h

# ARMv7 build
CGO_ENABLED=1 GOARCH=arm GOARM=7 go tool cgo main.go
CGO_ENABLED=1 GOARCH=arm GOARM=7 go build -ldflags '-tmpdir _obj -linkmode external' main.go
ar rcs _obj/armv7.a _obj/*.o
cp _obj/_cgo_export.h _obj/go_includes_armv7.h

# Make universal library
lipo _obj/arm64.a _obj/armv7.a -create -output libgo.a

# Massage the header file
echo "#ifdef __LP64__" > go_includes.h
cat _obj/go_includes_arm64.h >> go_includes.h
echo "#else" >> go_includes.h
cat _obj/go_includes_armv7.h >> go_includes.h
echo "#endif" >> go_includes.h

