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
# blocking youtube.com from 08:00 to 18:00
sudo blockpy set youtube.com -f 8 -t 18
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
