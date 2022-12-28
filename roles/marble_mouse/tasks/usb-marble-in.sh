#!/bin/bash

nameToMatch="Logitech USB Trackball"

set_config() {
  id="$1"
  xinput set-int-prop "$id" "Evdev Wheel Emulation Button" 8 8
  xinput set-int-prop "$id" "Evdev Wheel Emulation" 8 1
  xinput set-int-prop "$id" "Evdev Middle Button Emulation" 8 1
  xinput set-prop "$id" "Evdev Wheel Emulation Axes" 6 7 4 5
  # for wayland
  # @see https://forums.fedoraforum.org/showthread.php?t=312288
  xinput set-prop "$id" "libinput Scroll Method Enabled" 0 0 1
  xinput set-prop "$id" "libinput Button Scrolling Button" 8
}

verify_and_print_id() {
  id="$1"
  output=$(xinput list --short $id)
  echo "$output" | grep pointer &> /dev/null || return

  echo "$output" | grep "$nameToMatch" &> /dev/null || \
    return

  echo $id
}

list_ids() {
  xinput list --id-only | while read id; do
    verify_and_print_id $id
  done
}

main_x11() {
  list_ids | while read id; do
    set_config $id
  done
}

main_wayland() {
  # https://wiki.archlinux.org/title/Logitech_Marble_Mouse#Plasma_and_Wayland
  event="$(basename $(readlink /dev/input/by-id/usb-Logitech_USB_Trackball-event-mouse))"
  qdbus org.kde.KWin /org/kde/KWin/InputDevice/$event org.kde.KWin.InputDevice.scrollOnButtonDown true
}

sleep 1s
main_x11
main_wayland
