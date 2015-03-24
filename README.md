Testkit-stub
============================

Intel Tizen Web Test Utility: testkit-stub

###Build and install x86 binary for local target###
1. Run "make" in root folder of stub to build x86/x86_64 binary of stub, the built out depends on OS arch of localhost

        make



###Build binary for TIZEN target with cross-compiler Tool###

1. Install tizen2.2.1 SDK with all component selected, refer to
   https://developer.tizen.org/downloads/sdk/installing-tizen-sdk

2. Run tizen tool "/path/to/tizen-sdk/tools/native-make" to build arm binary of stub

        cd CommandLineBuild
        /path/to/tizen-sdk/tools/native-make clean
        /path/to/tizen-sdk/tools/native-make -a armel -t GCC4.5

3. Run tizen tool "/path/to/tizen-sdk/tools/native-make" to build x86 binary of stub

        cd CommandLineBuild
        /path/to/tizen-sdk/tools/native-make clean
        /path/to/tizen-sdk/tools/native-make -a i386 -t GCC4.5


###Build APK file of stub for Android Target###

1. Install Android NDK  and Android Developer Tool at first

2. Run /path/to/android-ndk-<version>/ndk-build in "android/jni" folder, it will build out x86/arm/mips binary files

        cd android/jni
        /path/to/android-ndk-<version>/ndk-build

3. Open Android Developer Tool import android project from  "android" folder, build apk of stub wrapper application
