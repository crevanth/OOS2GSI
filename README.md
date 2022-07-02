### Download tools
```
git clone --recurse-submodules https://github.com/oxygenosonclite/oxygenosporter
cd oxygenosporter
```

### For setting up requirements
    bash setup.sh

### Generating GSI from stock firmware URL
```
sudo ./dyn.sh ~/OnePlus8Oxygen_15.W.18_OTA_0180_all_2103101834_1669dec.zip
chmod +x clean.sh
sudo ./clean.sh
sudo ./make.sh work OxygenOS AB
cd out
```
