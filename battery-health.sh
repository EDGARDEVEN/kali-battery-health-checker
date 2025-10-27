#!/bin/bash

# Get real design capacity from dmidecode (mWh → Wh)
design_capacity_mwh=$(sudo dmidecode -t 22 | grep "Design Capacity" | awk '{print $3}')
design_capacity_wh=$((design_capacity_mwh / 1000))

# Get values from upower
battery=$(upower -e | grep BAT)
energy_full=$(upower -i $battery | grep "energy-full:" | awk '{print $2}')
energy_now=$(upower -i $battery | grep "energy:" | grep -v "energy-full" | awk '{print $2}')
status=$(upower -i $battery | grep "state:" | awk '{print $2}')
voltage=$(upower -i $battery | grep "voltage:" | awk '{print $2}')

# Calculate health
health=$(awk "BEGIN {print ($energy_full / $design_capacity_wh) * 100}")

# Calculate charge %
charge=$(awk "BEGIN {print ($energy_now / $energy_full) * 100}")

# Output
echo " Battery Health:   ${health%.*}% (Current full: ${energy_full} Wh, Design: ${design_capacity_wh} Wh)"
echo " Current Charge:   ${charge%.*}% (Now: ${energy_now} Wh)"
echo " Status:           $status"
echo " Voltage:          $voltage"
echo " Designed By DCS"

