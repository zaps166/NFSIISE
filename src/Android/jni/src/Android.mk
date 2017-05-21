LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := main

LOCAL_ARM_MODE := arm

SDL_PATH := ../SDL
NFS2SE_PATH := ../../../

LOCAL_C_INCLUDES := $(LOCAL_PATH)/$(SDL_PATH)/include

LOCAL_SRC_FILES := $(SDL_PATH)/src/main/android/SDL_android_main.c \
        $(NFS2SE_PATH)/DInput.c \
        $(NFS2SE_PATH)EAcsnd.c \
        $(NFS2SE_PATH)FetchTrackRecords.c \
        $(NFS2SE_PATH)Glide2x.c \
        $(NFS2SE_PATH)Kernel32.c \
        $(NFS2SE_PATH)Timer.c \
        $(NFS2SE_PATH)User32.c \
        $(NFS2SE_PATH)WinMM.c \
        $(NFS2SE_PATH)Wrapper.c \
        $(NFS2SE_PATH)Wsock32.c \
        $(NFS2SE_PATH)Cpp/NFS2SE.cpp

LOCAL_SHARED_LIBRARIES := SDL2

LOCAL_LDLIBS := -lGLESv2 -llog

include $(BUILD_SHARED_LIBRARY)
