## OpenBMC

```shell
# Get Temperature:
ipmitool raw 0x06 0x52 0x0d 0x80 0x10 0x8E

# Get Retimer Reset:
ipmitool raw 0x06 0x52 0x0d 0x80 0x02 0x28

# Set Retimer Reset:
ipmitool raw 0x06 0x52 0x0d 0x80 0x00 0x28 0x00 0x00

# Get barchetta2-service status
systemctl status barchetta2phy.service

# Get journal of barchetta2
journalctl | grep barchetta2
```

## SDR & SEL

I believe that when we run `ipmitool sdr elist`, it references the `[xxx]-ipmi-sensors.yaml` file and retrieves data from the corresponding bus path based on the file's content.

## To-Do

- Discuss with Casper about timeout count on UBB CPLD
- Make sure ethernet topology
- commit code to git server
- status.py / eth-training-log-dump verify
- eth-streaming-test-app is not suitable at this stage
- eth test script integration in MFG
- static training config to specific port (spi rom - eth partition)

## S7T boot workflow

1. Chassis Power On:

    - GPIO 64 (ALL_UBB_PWR_PG) goes high, signaling that UBB power is stable.
    - The retimer reset pin is deasserted.
    - Holding the system for up to 90 seconds.

2. Retimer Initialization:

    - The barchetta2phy.service restart. (Due to detect ALL_UBB_PWR_PG)
    - After completion, GPIO 241 (PHY_CONFIG_DONE) goes high, indicating successful PHY configuration.

3. System Power-Up:
    - The retimer reset pin is asserted.
    - The system continues powering up.
    - Initialize ASIC and linking training.

## Error

1.  1: 0x80 
1.  2: 0xa0
1.  4: no error
