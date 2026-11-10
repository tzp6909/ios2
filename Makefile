DEBUG = 0
FINALPACKAGE = 1

# Share the SDK, deployment target, and architecture with the PreferenceBundle.
include AxsSmoothStrideBuild.mk
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AxsSmoothStride
AxsSmoothStride_FILES = $(wildcard Hooks/*.xm Sources/*.m)
AxsSmoothStride_CFLAGS = -fobjc-arc -I./Headers -I./Sources
AxsSmoothStride_FRAMEWORKS = UIKit Foundation CoreFoundation
AxsSmoothStride_LIBRARIES = substrate c++

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += AxsSmoothStridePrefs
include $(THEOS_MAKE_PATH)/aggregate.mk
