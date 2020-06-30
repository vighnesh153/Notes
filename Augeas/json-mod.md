### install augeas


### Run
```
sudo augtool
```


### Load the json file
```
augtool> set   /augeas/load/Json/lens   Json.lns
augtool> set   /augeas/load/Json/incl   /practice/dummy.json
augtool> load
```


### Print the ways how to access all values
```
augtool> print   /files/practice/dummy.json
```
### It prints out path-like keys for each value


### To modify a value or key in json, just choose its path
### and set its value
```
augtool> set   /path/to/key   "new-value"
augtool> save
```
