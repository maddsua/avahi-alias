# Publish mDNS aliases automatically

This is a "set and forget" solution for people who want multiple .local addresses without the joy of them breaking every time their laptop sneezes and switches Wi-Fi networks.

## Installation

**a.** With make install
1. Run `make install`
2. ???
3. Profi.... wait it's free fucking software damn it!

**b.** With a debian package because of course I provide one
1. Build the package with `make deb-pkg`
2. Install the resulting .deb using apt or dpkg or whathever you want to use

## How-to-use

```sh
sudo systemctl enable --now avahi-alias@look-ma-no-ips.local
```

## Firewall

Usually you also have to allow port `5353/udp` if you have a firewall enabled.

Not every firewall completely blocks mDNS traffic but you should assume that it does and explicitly add a rule to allow mDNS traffic on your desired network.
