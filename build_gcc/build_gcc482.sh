#!/usr/bin/env bash
tarball="gcc-4.8.2.tar.bz2"

if ! [ -f "$tarball" ]; then
   echo "Error: tarball \"$tarball\" doesn't exist, or isn't a file" >&2
   exit 1
fi

builddir="${tarball%%.tar.bz2}"
exportdir="exportdir"
outfile="results.tar.gz"
mkdir -p "$exportdir"

tar xjvf "$tarball" -C ./
pushd $builddir
./configure --prefix="${DIRSTACK[1]}/$exportdir" && \
   make && \
   make install
rc=$?

if ! [ "$rc" -eq 0 ]; then
   echo "Build failed; Exiting" >&2
   exit 1
fi

popd
pushd $exportdir
tar czvf "${DIRSTACK[1]}/$outfile" *
popd
exit 0
