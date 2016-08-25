include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    NV_VectorImpl.cpp

LOCAL_C_INCLUDES := \
    external/safe-iop/include
    system/core/libutils

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libutils

LOCAL_MODULE := libshim_vectorimpl

LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

include $(BUILD_SHARED_LIBRARY)
