#!/bin/bash
#Script to automate pcapp analysis
PCAP_DIR="/home/is414/bro_is414/pcaps/*"
BROLOGS_DIR="/home/is414/bro_is414/brologs/"

#Change color of STDOUT
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'


rm -rf $BROLOGS_DIR
mkdir $BROLOGS_DIR

for file in $PCAP_DIR
do

	#make directory for $file analysis
	filename=$(basename -- "$file")
	echo -e "${RED}Now analyzing $filename${NC}"
	mkdir "${BROLOGS_DIR}${filename}"
	cd /home/is414/bro_is414/brologs/"$filename"

	#analyze $file with bro
	/usr/local/bro/bin/bro -r "$file"

	echo -e "${GREEN}Saved analysis in $(pwd)${NC}"
done
