# CSSHX Clusters

This script parses your `~/.ssh/known_hosts.fastly` file to make a list of all the cache-nodes and group them up based by POP and Region. Any suggestion or problems please slack me or open an issue on github.

## Dependencies

 * Updated **known_hosts.fastly** file
 * CSSHX 

## Installation

Installing CSSHX
```
git clone git@github.com:brockgr/csshx.git
cd csshx and move csshX to /usr/local/bin
```

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
csshx FRA
```

If you run into this problem when connecting to a large POP.
```
forkpty: Device not configured
Could not create a new process and open a pseudo-tty.
```

You can resolve this by adding the following to `/etc/sysctl.conf`
```
kern.tty.ptmx_max=255
```

This file may not exist; if you have to create it, you should probably be sure it has restricted ownership and permissions:

sudo chown root:wheel /etc/sysctl.conf
sudo chmod 644 /etc/sysctl.conf
