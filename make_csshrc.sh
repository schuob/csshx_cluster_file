#!/bin/bash
## Converting ~/.ssh/known_hosts.fastly to a working .csshrc config file.

# Array of POPS
NA_POP=(JFK IAD ATL BOS DEN ORD MIA DFW SJC LAX SEA YYZ)
SA_POP=(GRU)
EU_POP=(FRA AMS LCY LHR BMA)
APAC_POP=(AKL FJR WLG SYD MEL BNE PER ITM NRT SIN HKG)

echo "NA_POP = JFK IAD ATL BOS DEN ORD MIA DFW SJC LAX SEA YYZ" >> /etc/clusters
echo "SA_POP = GRU" >> /etc/clusters
echo "EU_POP = FRA AMS LCY LHR BMA" >> /etc/clusters
echo "APAC_POP = AKL FJR WLG SYD MEL BNE PER ITM NRT SIN HKG" >> /etc/clusters

for i in ${NA_POP[@]}; do
	i_lc=`echo "$i" | awk '{print tolower($0)}'`
	cache_node=$(grep "cache-${i_lc}" ~/.ssh/known_hosts.fastly | cut -d ',' -f2 | cut -d' ' -f1)
	output="${i} = ${cache_node}"
	echo $output >> /etc/clusters
done
for i in ${SA_POP[@]}; do
	i_lc=`echo "$i" | awk '{print tolower($0)}'`
	cache_node=$(grep "cache-${i_lc}" ~/.ssh/known_hosts.fastly | cut -d ',' -f2 | cut -d' ' -f1)
	output="${i} = ${cache_node}"
	echo $output >> /etc/clusters
done
for i in ${EU_POP[@]}; do
        i_lc=`echo "$i" | awk '{print tolower($0)}'`
	cache_node=$(grep "cache-${i_lc}" ~/.ssh/known_hosts.fastly | cut -d ',' -f2 | cut -d' ' -f1)
	output="${i} = ${cache_node}"
	echo $output >> /etc/clusters
done
for i in ${APAC_POP[@]}; do
	i_lc=`echo "$i" | awk '{print tolower($0)}'`
	cache_node=$(grep "cache-${i_lc}" ~/.ssh/known_hosts.fastly | cut -d ',' -f2 | cut -d' ' -f1)
	output="${i} = ${cache_node}"
	echo $output >> /etc/clusters
done

exit 0
