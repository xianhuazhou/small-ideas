# list all of inputs
xinput --list

# disable touchpad
xinput set-int-prop 12 "Device Enabled" 8 0

# enable touchpad
xinput set-int-prop 12 "Device Enabled" 8 1
