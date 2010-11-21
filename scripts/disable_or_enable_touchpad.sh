# list all of inputs
xinput --list

# disable touchpad
xinput set-int-prop 12 "Device Enabled" 8 0

# enable touchpad
xinput set-int-prop 12 "Device Enabled" 8 1


#### another way (my touchpad changed to psmouse?)
modprobe -r psmouse
