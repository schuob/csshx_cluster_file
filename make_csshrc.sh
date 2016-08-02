#!/bin/bash
## Converting ~/.ssh/known_hosts.fastly to a working .csshrc config file.

# Array of POPS
caches=$(grep ^cache- ~/.ssh/known_hosts.fastly | cut -d ',' -f1 | sort | uniq | sort -t- -k2,2 -k3,3 -k4n,4n -k5n,5n  | uniq)
pops=$(echo "$caches" | sed -E 's/cache-([^0-9]*).*$/\1/' | uniq)

for pop in $pops; do 
  hosts=$(echo "$caches" | grep ^cache-$pop | cut -d '.' -f1) 
  POP=$(echo $pop | tr [:lower:] [:upper:])
  echo $POP $hosts >> /etc/clusters
done

exit 0
