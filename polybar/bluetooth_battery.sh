#!/bin/bash

DEVICE="AF:22:D9:F1:A9:03"  # Replace with your Bluetooth device address

battery_level=$(bluetoothctl info "$DEVICE" | grep "Battery Percentage" | awk '{print $3}')

if [ -n "$battery_level" ]; then
    # Strip the 0x prefix and convert hex to decimal if necessary
    if [[ $battery_level == 0x* ]]; then
        battery_level=$((16#${battery_level:2}))
    fi
    echo "BT: $battery_level%"
else
    echo "BT: N/A"
fi
