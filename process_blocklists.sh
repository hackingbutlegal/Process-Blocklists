#!/bin/bash
#
# Script to download my blacklists, process them, and reload my Transmission daemon
# Based off blacklists available here http://www.iblocklist.com/lists.php 
#

mkdir /tmp/blocklists

# Anti-Infringement (Paid) Blocklist
wget "http://list.iblocklist.com/?list=srzondksmjuwsvmgdbhi&fileformat=p2p&archiveformat=gz&id=signalgod&pin=7133" --output-document=/tmp/blocklists/anti-infringement.bin.gz
gunzip /tmp/blocklists/anti-infringement.bin.gz
mv /tmp/blocklists/anti-infringement.bin /raid/data/module/transmission/system/etc/blocklists

# Level 1 (Free) Blocklist
wget "http://list.iblocklist.com/?list=bt_level1&fileformat=p2p&archiveformat=gz" --output-document=/tmp/blocklists/level1.bin.gz
gunzip /tmp/blocklists/level1.bin.gz
mv /tmp/blocklists/level1.bin /raid/data/module/transmission/system/etc/blocklists

# Level 2 (Free) Blocklist
wget "http://list.iblocklist.com/?list=bt_level2&fileformat=p2p&archiveformat=gz" --output-document=/tmp/blocklists/level2.bin.gz
gunzip /tmp/blocklists/level2.bin.gz
mv /tmp/blocklists/level2.bin /raid/data/module/transmission/system/etc/blocklists

# Level 3 (Free) Blocklist
wget "http://list.iblocklist.com/?list=bt_level3&fileformat=p2p&archiveformat=gz" --output-document=/tmp/blocklists/level3.bin.gz
gunzip /tmp/blocklists/level3.bin.gz
mv /tmp/blocklists/level3.bin /raid/data/module/transmission/system/etc/blocklists

# Malicious (Free) Blocklist
wget "http://list.iblocklist.com/?list=npkuuhuxcsllnhoamkvm&fileformat=p2p&archiveformat=gz" --output-document=/tmp/blocklists/malicious.bin.gz
gunzip /tmp/blocklists/malicious.bin.gz
mv /tmp/blocklists/malicious.bin /raid/data/module/transmission/system/etc/blocklists

# Sony (Free) Blocklist
wget "http://list.iblocklist.com/?list=soe&fileformat=p2p&archiveformat=gz" --output-document=/tmp/blocklists/sony.bin.gz
gunzip /tmp/blocklists/sony.bin.gz
mv /tmp/blocklists/sony.bin /raid/data/module/transmission/system/etc/blocklists

# Restart Transmission Daemon
killall -HUP transmission-daemon 

# Cleanup
rm -rf /tmp/blocklists