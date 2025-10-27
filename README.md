# Battery Health Checker

A lightweight **Bash script** that displays your machine's battery **health, charge level, voltage, and status** using data from `dmidecode` and `upower`.

---

## Overview

This script helps you monitor the **true health** of your battery by comparing its **current full charge capacity** with its **original design capacity**.

It uses:
- `dmidecode` to read hardware-level design capacity (from firmware)
- `upower` to fetch current charge and battery state

---

## Features

 Shows **battery health** (%)  
 Displays **current charge level** (%)  
 Reports **charging/discharging status**  
 Reads **voltage**  
 Provides **original vs current capacity comparison**  
 Runs entirely in **Bash** — no external dependencies beyond standard Linux tools  

---

## Requirements

Make sure the following packages are installed:

```bash
sudo apt install dmidecode upower
```

You’ll also need:
- **Linux system** (works on Ubuntu, Debian, Fedora, etc.)
- **Sudo privileges** (for reading design capacity from BIOS via `dmidecode`)

---

## Usage

1. Clone or copy the script:
   ```bash
   git clone https://github.com/EDGARDEVEN/kali-battery-health-checker.git
   cd battery-health-checker
   ```

2. Make the script executable:
   ```bash
   chmod +x battery_health.sh
   ```

3. Run the script:
   ```bash
   ./battery_health.sh
   ```

4. You’ll see output like:
   ```
   Battery Health:   92% (Current full: 47 Wh, Design: 51 Wh)
   Current Charge:   68% (Now: 32 Wh)
   Status:           discharging
   Voltage:          11.4 V
   Designed By DCS
   ```

---

## Script Breakdown

| Variable | Description |
|-----------|--------------|
| `design_capacity_mwh` | Original battery capacity from firmware (mWh) |
| `design_capacity_wh` | Converted design capacity in Wh |
| `energy_full` | Maximum current charge capacity (Wh) |
| `energy_now` | Current energy level (Wh) |
| `status` | Charging/discharging status |
| `voltage` | Current voltage |
| `health` | Battery health = (energy_full / design_capacity_wh) × 100 |
| `charge` | Current charge = (energy_now / energy_full) × 100 |

---

## Troubleshooting

- If you get **“permission denied”** errors for `dmidecode`, prepend the script with `sudo`:
  ```bash
  sudo ./battery_health.sh
  ```

- If `upower` shows no batteries:
  ```bash
  upower -e
  ```
  Ensure your system battery is listed as `/org/freedesktop/UPower/devices/battery_BAT0` or similar.

---

## Author

**Designed By DCS (Deven Cybersecurity Services)**  
Maintained by: [Edgar Deven]  
Contact: [edgardeven303@gmail.com]

---

## License

This project is licensed under the **MIT License** - free to use, modify, and distribute.