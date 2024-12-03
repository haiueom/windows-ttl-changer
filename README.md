# Windows TTL Changer

Time to Live (TTL) is a crucial parameter in networking that defines the number of hops a packet can take before it is discarded.

- Windows: Default TTL = 128
- Linux/Android: Default TTL = 64

![](https://i.imgur.com/yhhO5mP.png)

## Why Change TTL?

Some Internet Service Providers (ISPs) may restrict tethering by detecting whether a device other than your phone is connected to the network. By setting the TTL value to 65, the traffic appears as though it originates directly from your phone, bypassing such restrictions.

## Usage

1. Download latest version of `ttl-changer.bat` from [latest release](https://github.com/haiueom/windows-ttl-changer/releases/latest)
2. Run `ttl-changer.bat` file as administrator.
3. Choose an Option:
   - Press 1 to enable bypass mode (TTL = 65).
   - Press 2 to restore the default TTL value (TTL = 128).
   - Press 3 to exit the program.
4. After applying changes, restart your system to ensure they take effect.

# Research

- [How ISPs detect tethering/hotspot](https://android.stackexchange.com/questions/47819/how-can-phone-companies-detect-tethering-incl-wifi-hotspot)
