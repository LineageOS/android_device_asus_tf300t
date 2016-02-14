# Copyright (C) 2015 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$(call inherit-product-if-exists, vendor/asus/tf300t/tf300t-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/asus/tf300t/overlay

# files needed for boot image
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/init.cardhu.rc:root/init.cardhu.rc \
    $(LOCAL_PATH)/ramdisk/init.tf.rc:root/init.tf.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.cardhu.rc:root/ueventd.cardhu.rc \
    $(LOCAL_PATH)/ramdisk/init.cardhu.usb.rc:root/init.cardhu.usb.rc \
    $(LOCAL_PATH)/ramdisk/init.cardhu.cpu.rc:root/init.cardhu.cpu.rc \
    $(LOCAL_PATH)/ramdisk/fstab.cardhu:root/fstab.cardhu

# input device config files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/atmel-maxtouch.idc:system/usr/idc/atmel-maxtouch.idc \
    $(LOCAL_PATH)/idc/elan-touchscreen.idc:system/usr/idc/elan-touchscreen.idc \
    $(LOCAL_PATH)/idc/elantech_touchscreen.idc:system/usr/idc/elantech_touchscreen.idc \
    $(LOCAL_PATH)/idc/raydium_ts.idc:system/usr/idc/raydium_ts.idc \
    $(LOCAL_PATH)/idc/panjit_touch.idc:system/usr/idc/panjit_touch.idc

# permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    $(LOCAL_PATH)/asusdec/com.cyanogenmod.asusdec.xml:system/etc/permissions/com.cyanogenmod.asusdec.xml

# build characteristics setting 
PRODUCT_CHARACTERISTICS := tablet

# extra packages to build for this device
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default \
    blobpack_tfp \
    com.android.future.usb.accessory \
    fsck.f2fs \
    libaudioutils \
    libcardhuu \
    librs_jni \
    mischelp \
    mkfs.f2fs \
    setup_fs \
    tinymix \
    wifimacwriter

#    AutoParts_tfp \
#    libasusdec_jni \
#    com.cyanogenmod.asusdec \

# properties specific for this device
PRODUCT_PROPERTY_OVERRIDES := \
    persist.sys.isUsbOtgEnabled=true \
    persist.sys.usb.config=mtp \
    ro.carrier=wifi-only \
    ro.opengles.version=131072 \
    ro.sf.lcd_density=160 \
    sys.io.scheduler=bfq \
    tf.enable=y \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# Tegra 3 specific overrides
PRODUCT_PROPERTY_OVERRIDES += \
    persist.tegra.nvmmlite=1 \
    ro.zygote.disable_gl_preload=true

# transformer specific overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.epad.model=TF300T \
    ro.product.model=TF300T

# media files
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    device/asus/tf300t/media_codecs.xml:system/etc/media_codecs.xml \
    device/asus/tf300t/media_profiles.xml:system/etc/media_profiles.xml \
    device/asus/tf300t/audio_policy.conf:system/etc/audio_policy.conf

# SELINUX Defines
BOARD_SEPOLICY_DIRS := \
    device/asus/tf300t/sepolicy

# wifi files
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# camera
PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

# gps config files
PRODUCT_COPY_FILES += \
    device/asus/tf300t/gps.conf:system/etc/gps.conf \
    device/asus/tf300t/gpsconfig.xml:system/etc/gps/gpsconfig.xml \

# bt config files
PRODUCT_COPY_FILES += \
    device/asus/tf300t/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \

# inherit tablet dalvik settings
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
