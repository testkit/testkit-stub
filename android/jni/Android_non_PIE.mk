LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_CFLAGS += -fexceptions -frtti
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../include
LOCAL_LDLIBS := -llog
LOCAL_MODULE := testkit-stub
LOCAL_STATIC_LIBRARIES += $(NDK_PATH)/sources/cxx-stl/gnu-libstdc++/4.8/libs/$(TARGET_ARCH_ABI)/libsupc++.a
LOCAL_STATIC_LIBRARIES += $(NDK_PATH)/sources/cxx-stl/gnu-libstdc++/4.8/libs/$(TARGET_ARCH_ABI)/libgnustl_static.a
LOCAL_SRC_FILES := ../../source/comfun.cpp ../../source/httpserver.cpp ../../source/testcase.cpp ../../source/main/main.cpp ../../source/json/json_reader.cpp ../../source/json/json_value.cpp ../../source/json/json_writer.cpp
include $(BUILD_EXECUTABLE)
