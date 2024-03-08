# Env vars
set -gx EDITOR nvim
set -gx VISUAL neovide

set -gx CHROME_EXECUTABLE 'brave'
set -gx CPATH "$(clang -v 2>&1 | grep "Selected GCC installation" | rev | cut -d' ' -f1 | rev)/include"

set -gx JAVA_HOME /usr/lib/jvm/java-17-openjdk
fish_add_path -gaP $JAVA_HOME/bin

# Android sdk/ndk paths
set -gx ANDROID_HOME /opt/android-sdk
set -gx ANDROID_SDK_ROOT $ANDROID_HOME
set -gx ANDROID_NDK /opt/android-ndk
set -gx ANDROID_NDK_HOME $ANDROID_NDK
fish_add_path -gaP $ANDROID_HOME/tools
fish_add_path -gaP $ANDROID_HOME/cmdline-tools/latest/bin
fish_add_path -gaP $ANDROID_NDK

# opam configuration
source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
