# blockpy
Block websites. Minimize distraction
## installation
```bash
sudo make install
```
#### uninstall
```bash
sudo make remove
```

## Usage
Adding website to block
```bash
# blocking youtube.com from 08:00 to 18:00 everyday
sudo blockpy set youtube.com -f 8 -t 18
# blocking stackoverflow on weekends
sudo blockpy set youtube.com -f0 -t 23 -d sat,sun
```
Modifying blocked website
```bash
# modified start from 08:00 to 10:00 
sudo blockpy set youtube.com -f 10 -t 18
```
***For now hours must be in 24 hour format***

Unblock a wesbsite
```bash
sudo blockpy delete youtube.com
```
