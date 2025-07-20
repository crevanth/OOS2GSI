# OOS2GSI - OxygenOS GSI Porter

An automated toolset to port OxygenOS stock firmware into Generic System Images (GSIs). This is a streamlined fork of the original [ErfanGSIs](https://github.com/erfanoabdi/ErfanGSIs) project by erfanoabdi.

---

## Requirements
- Linux or macOS

## How to Use

### 1. Download the Tools
First, clone this repository and its submodules to your local machine.

```bash
git clone --recurse-submodules https://github.com/crevanth/OOS2GSI.git
cd OOS2GSI
```

### 2. Set Up Requirements
Run the setup script to install all necessary dependencies for your system.

```bash
bash setup.sh
```

### 3. Generate the GSI from a Firmware URL
Use the `url2GSI.sh` script to convert a stock OxygenOS firmware package into a flashable GSI. The `Firmware type` argument must be `OxygenOS`.

**Example:**
```bash
# Usage: ./url2GSI.sh <firmware_url> <rom_type>
./url2GSI.sh https://oxygenos.oneplus.net/OnePlus7ProOxygen_21.O.07_OTA_007_all_1905120542_fc480574576b4843.zip OxygenOS
```

The final `.img` file will be located in the `output/` directory. For more advanced options, you can inspect the `url2GSI.sh` script.
