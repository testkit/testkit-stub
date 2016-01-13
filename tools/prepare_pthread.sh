#!/bin/bash

cd ../tools

rm -rf ptw32

sudo rm /usr/i686-w64-mingw32/include/pthread.h
sudo rm /usr/i686-w64-mingw32/include/sched.h
sudo rm /usr/i686-w64-mingw32/include/semaphore.h
sudo rm /usr/i686-w64-mingw32/lib/libpthread.a
sudo rm /usr/i686-w64-mingw32/lib/libpthreadGC2.a
 
wget ftp://sourceware.org/pub/pthreads-win32/pthreads-w32-2-9-1-release.zip
unzip pthreads-w32-2-9-1-release.zip >/dev/null 2>&1
mkdir -p $PWD/ptw32/include $PWD/ptw32/lib
cp Pre-built.2/include/*.h $PWD/ptw32/include/
cp Pre-built.2/lib/x86/libpthreadGC2.a $PWD/ptw32/lib/
cp Pre-built.2/dll/x86/pthreadGC2.dll $PWD/ptw32/lib/

cd ptw32
ln -s $PWD/lib/libpthreadGC2.a $PWD/lib/libpthread.a


sudo ln -s $PWD/include/pthread.h /usr/i686-w64-mingw32/include/pthread.h
sudo ln -s $PWD/include/sched.h /usr/i686-w64-mingw32/include/sched.h
sudo ln -s $PWD/include/semaphore.h /usr/i686-w64-mingw32/include/semaphore.h
sudo ln -s $PWD/lib/libpthreadGC2.a /usr/i686-w64-mingw32/lib/libpthread.a
sudo ln -s /usr/i686-w64-mingw32/lib/libpthread.a /usr/i686-w64-mingw32/lib/libpthreadGC2.a


mkdir -p $PWD/lib/pkgconfig
cat << _EOF > $PWD/lib/pkgconfig/pthreadGC2.pc
prefix=$PWD
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: pthreadGC2
Description: Library to interface with win32 threads model
Requires: 
Version: 2.9.0
Libs: -L${libdir} -lpthreadGC2
Cflags: -I${includedir}
_EOF


ln -s $PWD/lib/pkgconfig/pthreadGC2.pc $PWD/lib/pkgconfig/pthread.pc

cd ../../build
