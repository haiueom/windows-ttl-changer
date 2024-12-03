# Windows TTL Changer

![GitHub Downloads (specific asset, latest release)](https://img.shields.io/github/downloads/haiueom/windows-ttl-changer/latest/ttl-changer.bat)

## Overview

Time to Live (TTL) is a crucial parameter in networking that defines the number of hops a packet can take before it is discarded.

- Windows: Default TTL = 128
- Linux/Android: Default TTL = 64

![](https://i.imgur.com/yhhO5mP.png)

## Why Change TTL?

Some Internet Service Providers (ISPs) may restrict tethering by detecting whether a device other than your phone is connected to the network. By setting the TTL value to 65, the traffic appears as though it originates directly from your phone, bypassing such restrictions.

# Research

- [How ISPs detect tethering/hotspot](https://android.stackexchange.com/questions/47819/how-can-phone-companies-detect-tethering-incl-wifi-hotspot)
