# Windows TTL Changer

<!-- **Download Here**: [![](https://img.shields.io/github/downloads/AzimsTech/TTL-Changer/1.4/TTL-Changer_1.4.bat.svg)](https://github.com/AzimsTech/TTL-Changer/releases/download/1.4/TTL-Changer_1.4.bat) -->

## Overview

Time to Live (TTL) is a crucial parameter in networking that defines the number of hops a packet can take before it is discarded.

- Windows: Default TTL = 128
- Linux/Android: Default TTL = 64

![](https://i.imgur.com/yhhO5mP.png)

## Why Change TTL?

Some Internet Service Providers (ISPs) may restrict tethering by detecting whether a device other than your phone is connected to the network. By setting the TTL value to 65, the traffic appears as though it originates directly from your phone, bypassing such restrictions.

# Research

- [How ISPs detect tethering/hotspot](https://android.stackexchange.com/questions/47819/how-can-phone-companies-detect-tethering-incl-wifi-hotspot)
