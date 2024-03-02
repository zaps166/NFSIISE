LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := main

LOCAL_CFLAGS   := -DNDEBUG -O3 -std=gnu89 -DGLES2 -DNFS_CPP -Wno-int-conversion -Wno-incompatible-function-pointer-types -flto
LOCAL_CPPFLAGS := -DNDEBUG -O3 -std=c++14 -fno-rtti -fno-exceptions -Wno-c++11-narrowing -flto
LOCAL_LDFLAGS  := -flto

LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := \
    ../../../../Cpp/NFS2SE.cpp \
    ../../../../DInput.c \
    ../../../../EAcsnd.c \
    ../../../../FetchTrackRecords.c \
    ../../../../Glide2x.c \
    ../../../../Kernel32.c \
    ../../../../Timer.c \
    ../../../../User32.c \
    ../../../../WinMM.c \
    ../../../../Wrapper.c \
    ../../../../Wsock32.c

LOCAL_SHARED_LIBRARIES := SDL2

LOCAL_LDLIBS := -lGLESv2 -lOpenSLES -llog -landroid

include $(BUILD_SHARED_LIBRARY)
