NDK_TOOLCHAIN_VERSION := 4.9

APP_CPPFLAGS += -DNDEBUG -Ofast -flto -std=c++14 -fpermissive -fno-rtti -fno-exceptions -w
APP_CFLAGS   += -DNDEBUG -Ofast -flto -std=gnu89 -DGLES2 -DNFS_CPP -DCWD_PATH=\"/sdcard/NFSIISE\"
LOCAL_LDFLAGS += -flto
APP_STL := gnustl_static
APP_ABI := armeabi-v7a

APP_PLATFORM=android-14
