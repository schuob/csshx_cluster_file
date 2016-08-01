# CSSHX Clusters

This script parses your `~/.ssh/known_hosts.fastly` file to make a list of all the cache-nodes and group them up based by POP and Region.

## Dependencies

 * Updated **known_hosts.fastly** file

## Installation

Update the ** known_hosts.fastly** file by running the following command, this will ensure you have the latest nodes.
```
scp bastion-slsjc1:/etc/ssh/ssh_known_hosts ~/.ssh/known_hosts.fastly
chmod 644 ~/.ssh/known_hosts.fastly 
```

Download `make_csshrc.sh` and chmod it on your terminal, then run the following in the folder where the file is located in.

```
sudo ./make_csshrc.sh
```

## Usage

The following commands are available:

```
csshx --screen # FRA
cssh FRA
```
