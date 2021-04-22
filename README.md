# ESP32: Hello World!

Derived from SpinDance's [ESP32 AWS Starter](https://github.com/spindance/esp32-aws-starter), this repository is meant to serve as a quick-start for developing basic solutions on the ESP32.

<!-- toc -->

- [Getting Started](#getting-started)
- [Build, Flash, and Monitor](#build-flash-and-monitor)
- [General Information](#general-information)

<!-- tocstop -->

# Getting Started

## Install required system packages

Recommended to use a POSIX-like environment (MacOS, Linux, or Git-Bash for Windows)

```sh
brew install cmake
brew install direnv
```

## Clone repo

```sh
git clone git@github.com:spindance/esp32-hello-world.git --recursive
```

* Note the `--recursive` as this will clone all submodules recursively
* If you don't use `--recursive` then `cd` to the workspace and run `git submodule update --init --recursive`

## Install ESP-IDF toolchain, setup environment

1. `cd esp32-hello-world`
1. `direnv allow`: enables `.envrc` to install esp-idf toolchain

More information about the `esp-idf` toolchain can be found in the [ESP-IDF get-started documentation](https://docs.espressif.com/projects/esp-idf/en/latest/get-started/index.html).

It is recommended to create a `.userenv` file in the root of the repository.
If this file exists, it will be sourced inside of the `.envrc` file.

`.userenv` defines user/system-specific variables, such as the path to
UART port that ESP tools rely on for logging and JTAG (`$ESPPORT`).

To find the specific port to communicate with the ESP32, plug in your device via USB and execute the following:

```bash
ls /dev/cu.usbserial-*

# The output should look something like:
/dev/cu.usbserial-14330
```

Given the above, an example `.userenv` should have (at least) the following contents:

```
export ESPPORT=/dev/cu.usbserial-14330
```

# Build, Flash, and Monitor

## Build the Firmware

```
cd esp32-hello-world/src
idf.py build
```

For more information about the build system, see the [esp-idf documentation](https://docs.espressif.com/projects/esp-idf/en/latest/api-guides/build-system.html#idf-py).

To clean the project, execute `idf.py fullclean`, which will delete the `build`
folder.

## Flash the Firmware

```
idf.py flash -p $ESPPORT
```

## Monitor the Firmware

Once the firmware has been flashed onto the device, execute the following to view the output of the firmware:

```
idf.py monitor
```

For more information about the `monitor` command, see the [official Espressif documentation](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/tools/idf-monitor.html).

# General Information

## Flash Memory Map

The file `partitions.csv` defines the flash partitions.

| Name | Address | Size | Encrypted? | Description |
| --- | --- | --- | --- | --- |
| bootloader | 0x1000 | 0xf000 | No | Stage 2 bootloader, boots after stage 1 bootloader in ESP32 ROM |
| partition table | 0x10000 | 0x1000 | No | The partition table, offsets to partitions |
| nvs | 0x11000 | 0x6000 | No | Non Volatile Storage. Basically a key-value store for user/application data. |
| ota_data | 0x17000 | 0x2000 | No | Used internally. Determines which ota partition is active. |
| phy_init | 0x19000 | 0x1000 | No | Unused. Stores PHY initialization variables. |
| ota_0 | 0x20000 | 0x190000 | No | First partition used to store OTA images. This is written to if ota_1 is the active partition. |
| ota_1 | 0x1b0000 | 0x190000 | No | Second partition used to store OTA images. This is written to if ota_0 is the active partition. |
| fctry | 0x340000 | 0x6000 | No | Contains read-only device stamping data |
