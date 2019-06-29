# System V init.d for Android
This is a set of scripts to provide init.d on Android.
Tested on Android 7.1.2 with SELinux enabled.

## Features
- init.d is on the shared storage (/sdcard) for convenience
- extensive logging
- SELinux support

## Installation
- place files to /sdcard/
- run [install.sh](install.sh) as root

**NB**: /sdcard/init.d/ files should have *.sh* extension.
