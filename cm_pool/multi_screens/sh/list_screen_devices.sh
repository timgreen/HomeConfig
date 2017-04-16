#!/bin/bash
xrandr | grep "\bconnected" | cut -d' ' -f 1
