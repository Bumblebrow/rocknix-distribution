#!/bin/bash
# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2022-present JELOS (https://github.com/JustEnoughLinuxOS)

. /etc/profile

SOURCE_DIR="/usr/config/eden"
CONF_DIR="/storage/.config/eden"
EDEN_INI="qt-config.ini"
LOG_DIR="/var/log"
LOG_FILE="eden_launch.txt"
GAME=$(echo "${1}"| sed "s#^/.*/##")
LIST_GUID=$(list-guid)
CONTROLLER_GUID="03000000${LIST_GUID:8}"
#030000004c050000e60c000011810000

#Check if eden exists in .config
if [ ! -d "${CONF_DIR}" ]; then
    mkdir -p "${CONF_DIR}"
        cp -r "/usr/config/eden" "/storage/.config/"
fi

if [ -f "${CONF_DIR}/ctl.id" ]; then
	CONTROLLER_GUID=$(cat "${CONF_DIR}/ctl.id")
fi

echo "LIST_GUID: $LIST_GUID" > "${LOG_DIR}/${LOG_FILE}"
echo "CONTROLLER_GUID: $CONTROLLER_GUID" >> "${LOG_DIR}/${LOG_FILE}"

#Copy Eden config at script launch
if [ -f "${CONF_DIR}/qt-config.override.ini" ] || [ -f "${CONF_DIR}/qt-config.${GAME}.override.ini" ]; then
    if [ -f "${CONF_DIR}/qt-config.${GAME}.override.ini" ]; then
	echo "base config is game specific override..." >> "${LOG_DIR}/${LOG_FILE}"
        cp -rf "${CONF_DIR}/qt-config.${GAME}.override.ini" "${CONF_DIR}/${EDEN_INI}"
    else
	echo "base config is system specific override..." >> "${LOG_DIR}/${LOG_FILE}"
        cp -rf "${CONF_DIR}/qt-config.override.ini" "${CONF_DIR}/${EDEN_INI}"
     fi
else
    echo "base config is default usr/config..." >> "${LOG_DIR}/${LOG_FILE}"
    cp -r "${SOURCE_DIR}/${EDEN_INI}" "${CONF_DIR}/${EDEN_INI}"
fi # finish config copy

if [ ! -f "${CONF_DIR}/qt-config.override.ini" ]; then
	#configure player_0 controls
		sed -i "/player_0_button_a=/c\player_0_button_a=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,button:1\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_button_b=/c\player_0_button_b=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,button:0\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_button_x=/c\player_0_button_x=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,button:3\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_button_y=/c\player_0_button_y=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,button:2\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_button_lstick=/c\player_0_button_lstick=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,button:9\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_button_rstick=/c\player_0_button_rstick=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,button:10\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_button_l=/c\player_0_button_l=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,button:4\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_button_r=/c\player_0_button_r=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,button:5\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_button_zl=/c\player_0_button_zl=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,axis:2,threshold:0.500000,invert:+\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_button_zr=/c\player_0_button_zr=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,axis:5,threshold:0.500000,invert:+\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_button_plus=/c\player_0_button_plus=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,button:7\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_button_minus=/c\player_0_button_minus=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,button:6\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_button_dleft=/c\player_0_button_dleft=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,hat:0,direction:left\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_button_dup=/c\player_0_button_dup=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,hat:0,direction:up\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_button_dright=/c\player_0_button_dright=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,hat:0,direction:right\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_button_ddown=/c\player_0_button_ddown=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,hat:0,direction:down\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_button_slleft=/c\player_0_button_slleft=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,button:4\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_button_srleft=/c\player_0_button_srleft=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,button:5\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_button_home=/c\player_0_button_home=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,button:8\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_button_screenshot=/c\player_0_button_screenshot=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,button:15\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_button_slright=/c\player_0_button_slright=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,button:4\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_button_srright=/c\player_0_button_srright=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,button:5\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_lstick=/c\player_0_lstick=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,axis_x:0,axis_y:1,offset_x:-0.000000,offset_y:0.000000,invert_x:+,invert_y:+,deadzone:0.150000\"" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/player_0_rstick=/c\player_0_rstick=\"engine:sdl,port:0,guid:030000005e040000120b000001000000,axis_x:3,axis_y:4,offset_x:-0.000000,offset_y:0.000000,invert_x:+,invert_y:+,deadzone:0.150000\"" "${CONF_DIR}/${EDEN_INI}"

	#REPLACE PLAYER 0 GUID
		sed -ri "/^player_0/s/(guid:)([0-9a-z]*)/guid:$CONTROLLER_GUID/g" "${CONF_DIR}/${EDEN_INI}"

	#MISC
                sed -i "/device_name=/c\device_name=Eden" "${CONF_DIR}/${EDEN_INI}"
                sed -i "/network_interface=/c\network_interface=wlan0" "${CONF_DIR}/${EDEN_INI}"
                sed -i "/eden_username=/c\eden_username=Eden" "${CONF_DIR}/${EDEN_INI}"
                sed -i "/language_index=/c\language_index=1" "${CONF_DIR}/${EDEN_INI}"
                sed -i "/language_index\\\default=/c\language_index\\\default=false" "${CONF_DIR}/${EDEN_INI}"
                sed -i "/region_index=/c\region_index=1" "${CONF_DIR}/${EDEN_INI}"
                sed -i "/region_index\\\default=/c\region_index\\\default=false" "${CONF_DIR}/${EDEN_INI}"
                sed -i "/Paths\\\language\\\default=/c\Paths\\\language\\\default=false" "${CONF_DIR}/${EDEN_INI}"
                sed -i "/Paths\\\language=/c\Paths\\\language=en" "${CONF_DIR}/${EDEN_INI}"
                sed -i "/check_for_updates\\\default=/c\check_for_updates\\\default=false" "${CONF_DIR}/${EDEN_INI}"
                sed -i "/check_for_updates=/c\check_for_updates=false" "${CONF_DIR}/${EDEN_INI}"

	#CHECK ROMS PATH
                grep -qF "Paths\gamedirs\4\path=" "${CONF_DIR}/${EDEN_INI}" || echo "Paths\gamedirs\4\path=/storage/roms/switch" >> "${CONF_DIR}/${EDEN_INI}"
                grep -qF "Paths\gamedirs\4\deep_scan\default=" "${CONF_DIR}/${EDEN_INI}" || echo "Paths\gamedirs\4\deep_scan\default=true" >> "${CONF_DIR}/${EDEN_INI}"
                grep -qF "Paths\gamedirs\4\deep_scan=" "${CONF_DIR}/${EDEN_INI}" || echo "Paths\gamedirs\4\deep_scan=false" >> "${CONF_DIR}/${EDEN_INI}"
                grep -qF "Paths\gamedirs\4\expanded\default=" "${CONF_DIR}/${EDEN_INI}" || echo "Paths\gamedirs\4\expanded\default=true" >> "${CONF_DIR}/${EDEN_INI}"
                grep -qF "Paths\gamedirs\4\expanded=" "${CONF_DIR}/${EDEN_INI}" || echo "Paths\gamedirs\4\expanded=true" >> "${CONF_DIR}/${EDEN_INI}"
                sed -i "/Paths\\\gamedirs\\\size=/c\Paths\\\gamedirs\\\size=4" "${CONF_DIR}/${EDEN_INI}"
	cp -r "${CONF_DIR}/${EDEN_INI}" "${CONF_DIR}/qt-config.override.ini"
fi #finish override creation

echo >> "${LOG_DIR}/${LOG_FILE}" ; echo >> "${LOG_DIR}/${LOG_FILE}"

#Emulation Station Features
GAME=$(echo "$GAME"| sed -r 's/[\[]+/\\[/g')
GAME=$(echo "$GAME"| sed -r 's/[]]+/\\]/g')
PLATFORM=$(echo "${2}"| sed "s#^/.*/##")
CPUACCURACY=$(get_setting cpu_accuracy "${PLATFORM}" "${GAME}")
CPUBACKEND=$(get_setting cpu_backend "${PLATFORM}" "${GAME}")
GRAPHICSBACKEND=$(get_setting backend "${PLATFORM}" "${GAME}")
SWITCHMODE=$(get_setting switch_mode "${PLATFORM}" "${GAME}")
GPUACCURACY=$(get_setting gpu_accuracy "${PLATFORM}" "${GAME}")
ZRAM=$(get_setting zram "${PLATFORM}" "${GAME}")

#Move Nand / Saves to switch roms folder
if [ ! -d "/storage/roms/bios/eden/nand" ]; then
    mkdir -p "/storage/roms/bios/eden/nand"
fi

rm -rf /storage/.config/eden/nand
ln -sf /storage/roms/bios/eden/nand /storage/.config/eden/nand

echo "EMULATIONSTATION OPTIONS: " >> "${LOG_DIR}/${LOG_FILE}"
echo "CONF_DIR: ${CONF_DIR}" >> "${LOG_DIR}/${LOG_FILE}"
echo "Game: $GAME" >> "${LOG_DIR}/${LOG_FILE}"
echo "Platform: $PLATFORM" >> "${LOG_DIR}/${LOG_FILE}"
echo "CPU Accuracy: $CPUACCURACY" >> "${LOG_DIR}/${LOG_FILE}"
echo "CPU Backend: $CPUBACKEND" >> "${LOG_DIR}/${LOG_FILE}"
echo "Graphics Backend: $GRAPHICSBACKEND" >> "${LOG_DIR}/${LOG_FILE}"
echo "Switch Mode: $SWITCHMODE" >> "${LOG_DIR}/${LOG_FILE}"
echo "GPU Accuracy: $GPUACCURACY" >> "${LOG_DIR}/${LOG_FILE}"
echo "ZRam: $ZRAM" >> "${LOG_DIR}/${LOG_FILE}"
echo >> "${LOG_DIR}/${LOG_FILE}" ; echo >> "${LOG_DIR}/${LOG_FILE}"

#CPU ACCURACY
        if [ "$CPUACCURACY" = "0" ] #ACCURATE
        then
                echo "inside CPU Accuracy ACCURATE [0]..." >> "${LOG_DIR}/${LOG_FILE}"
                sed -i "/cpu_accuracy=/c\cpu_accuracy=0" "${CONF_DIR}/${EDEN_INI}"
                sed -i "/cpu_accuracy\\\default=/c\cpu_accuracy\\\default=false" "${CONF_DIR}/${EDEN_INI}"
                cat "${CONF_DIR}/${EDEN_INI}" | grep cpu_accuracy >> "${LOG_DIR}/${LOG_FILE}"
		echo "exiting CPU Accuracy ACCURATE [0]..." >> "${LOG_DIR}/${LOG_FILE}"
        fi
        if [ "$CPUACCURACY" = "1" ] #UNSAFE
        then
		echo "inside CPU Accuracy UNSAFE [1]..." >> "${LOG_DIR}/${LOG_FILE}"
                sed -i "/cpu_accuracy=/c\cpu_accuracy=1" "${CONF_DIR}/${EDEN_INI}"
                sed -i "/cpu_accuracy\\\default=/c\cpu_accuracy\\\default=false" "${CONF_DIR}/${EDEN_INI}"
                cat "${CONF_DIR}/${EDEN_INI}" | grep cpu_accuracy >> "${LOG_DIR}/${LOG_FILE}"
		echo "exiting CPU Accuracy UNSAFE [1]..." >> "${LOG_DIR}/${LOG_FILE}"
        fi
        if [ "$CPUACCURACY" = "2" ] #PARANOID
        then
		echo "inside CPU Accuracy PARANOID [2]..." >> "${LOG_DIR}/${LOG_FILE}"
                sed -i "/cpu_accuracy=/c\cpu_accuracy=2" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/cpu_accuracy\\\default=/c\cpu_accuracy\\\default=false" "${CONF_DIR}/${EDEN_INI}"
		cat "${CONF_DIR}/${EDEN_INI}" | grep cpu_accuracy >> "${LOG_DIR}/${LOG_FILE}"
                echo "exiting CPU Accuracy PARANOID [2]..." >> "${LOG_DIR}/${LOG_FILE}"
        fi
#CPU BACKEND
        if [ "$CPUBACKEND" = "0" ] #DYNAMIC
        then
		echo "inside CPU Backend DYNAMIC [0]..." >> "${LOG_DIR}/${LOG_FILE}"
                sed -i "/cpu_backend=/c\cpu_backend=0" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/cpu_backend\\\default=/c\cpu_backend\\\default=false" "${CONF_DIR}/${EDEN_INI}"
                cat "${CONF_DIR}/${EDEN_INI}" | grep cpu_backend >> "${LOG_DIR}/${LOG_FILE}"
                echo "exiting CPU Backend DYNAMIC [0]..." >> "${LOG_DIR}/${LOG_FILE}"
        fi
        if [ "$CPUBACKEND" = "1" ] #NCE
        then
		echo "inside CPU Backend NCE [1]..." >> "${LOG_DIR}/${LOG_FILE}"
                sed -i "/cpu_backend=/c\cpu_backend=1" "${CONF_DIR}/${EDEN_INI}"
		sed -i "/cpu_backend\\\default=/c\cpu_backend\\\default=false" "${CONF_DIR}/${EDEN_INI}"
		cat "${CONF_DIR}/${EDEN_INI}" | grep cpu_backend >> "${LOG_DIR}/${LOG_FILE}"
                echo "exiting CPU Backend NCE [1]..." >> "${LOG_DIR}/${LOG_FILE}"
        fi

#GRAPHICS BACKEND
        if [ "$GRAPHICSBACKEND" = "0" ] #OPENGL
        then
                echo "inside Graphics Backend OPENGL [0]..." >> "${LOG_DIR}/${LOG_FILE}"
                sed -i "/backend=/c\backend=0" "${CONF_DIR}/${EDEN_INI}"
                sed -i "/backend\\\default=/c\backend\\\default=false" "${CONF_DIR}/${EDEN_INI}"
                cat "${CONF_DIR}/${EDEN_INI}" | grep backend >> "${LOG_DIR}/${LOG_FILE}"
                echo "exiting Gaphics Backend OPENGL [0]..." >> "${LOG_DIR}/${LOG_FILE}"
        fi
        if [ "$GRAPHICSBACKEND" = "1" ] #VULKAN
        then
                echo "inside Graphics Backend VULKAN [1]..." >> "${LOG_DIR}/${LOG_FILE}"
                sed -i "/backend=/c\backend=1" "${CONF_DIR}/${EDEN_INI}"
                sed -i "/backend\\\default=/c\backend\\\default=false" "${CONF_DIR}/${EDEN_INI}"
                cat "${CONF_DIR}/${EDEN_INI}" | grep backend >> "${LOG_DIR}/${LOG_FILE}"
                echo "exiting Graphics Backend VULKAN [1]..." >> "${LOG_DIR}/${LOG_FILE}"
        fi

#GPU ACCURACY
        if [ "$GPUACCURACY" = "0" ] #NORMAL
        then
                echo "inside GPU Accuracy NORMAL [0]..." >> "${LOG_DIR}/${LOG_FILE}"
                sed -i "/gpu_accuracy=/c\gpu_accuracy=0" "${CONF_DIR}/${EDEN_INI}"
                sed -i "/gpu_accuracy\\\default=/c\gpu_accuracy\\\default=false" "${CONF_DIR}/${EDEN_INI}"
                cat "${CONF_DIR}/${EDEN_INI}" | grep gpu_accuracy >> "${LOG_DIR}/${LOG_FILE}"
                echo "exiting GPU Accuracy NORMAL [0]..." >> "${LOG_DIR}/${LOG_FILE}"
        fi
        if [ "$GPUACCURACY" = "1" ] #HIGH
        then
                echo "inside GPU Accuracy HIGH [1]..." >> "${LOG_DIR}/${LOG_FILE}"
                sed -i "/gpu_accuracy=/c\gpu_accuracy=1" "${CONF_DIR}/${EDEN_INI}"
                sed -i "/gpu_accuracy\\\default=/c\gpu_accuracy\\\default=false" "${CONF_DIR}/${EDEN_INI}"
                cat "${CONF_DIR}/${EDEN_INI}" | grep gpu_accuracy >> "${LOG_DIR}/${LOG_FILE}"
                echo "exiting GPU Accuracy HIGH [1]..." >> "${LOG_DIR}/${LOG_FILE}"
        fi
        if [ "$GPUACCURACY" = "2" ] #EXTREME
        then
                echo "inside GPU Accuracy EXTREME [2]..." >> "${LOG_DIR}/${LOG_FILE}"
                sed -i "/gpu_accuracy=/c\gpu_accuracy=2" "${CONF_DIR}/${EDEN_INI}"
                sed -i "/gpu_accuracy\\\default=/c\gpu_accuracy\\\default=false" "${CONF_DIR}/${EDEN_INI}"
                cat "${CONF_DIR}/${EDEN_INI}" | grep gpu_accuracy >> "${LOG_DIR}/${LOG_FILE}"
                echo "exiting GPU Accuracy EXTREME [2]..." >> "${LOG_DIR}/${LOG_FILE}"
        fi

#SWITCH MODE
        if [ "$SWITCHMODE" = "0" ] #HANDHELD
        then
                echo "inside switch mode HANDHELD [0]..." >> "${LOG_DIR}/${LOG_FILE}"
                sed -i "/switch_mode=/c\switch_mode=0" "${CONF_DIR}/${EDEN_INI}"
                sed -i "/switch_mode\\\default=/c\switch_mode\\\default=false" "${CONF_DIR}/${EDEN_INI}"
                cat "${CONF_DIR}/${EDEN_INI}" | grep switch_mode >> "${LOG_DIR}/${LOG_FILE}"
                echo "exiting Gaphics Backend HANDHELD [0]..." >> "${LOG_DIR}/${LOG_FILE}"
        fi
        if [ "$SWITCHMODE" = "1" ] #DOCKED
        then
                echo "inside switch mode DOCKED [1]..." >> "${LOG_DIR}/${LOG_FILE}"
                sed -i "/switch_mode=/c\switch_mode=1" "${CONF_DIR}/${EDEN_INI}"
                sed -i "/switch_mode\\\default=/c\switch_mode\\\default=false" "${CONF_DIR}/${EDEN_INI}"
                cat "${CONF_DIR}/${EDEN_INI}" | grep switch_mode >> "${LOG_DIR}/${LOG_FILE}"
                echo "exiting switch mode DOCKED [1]..." >> "${LOG_DIR}/${LOG_FILE}"
        fi

#Link eden keys to bios folder
if [ ! -d "/storage/roms/bios/eden/keys" ]; then
    mkdir -p "/storage/roms/bios/eden/keys"
fi

rm -rf /storage/.config/eden/keys
ln -sf /storage/roms/bios/eden/keys /storage/.config/eden/keys

#Link  .config/eden to .local
rm -rf /storage/.local/share/eden
ln -sf /storage/.config/eden /storage/.local/share/eden

#Set QT Platform to Wayland-EGL
export QT_QPA_PLATFORM=xcb

#eden won't work with the pipewire driver yet
export SDL_AUDIODRIVER=pulseaudio

set_kill set "-9 eden"

#Run eden emulator

/usr/bin/eden -f "${1}"
