#!/bin/bash
#Script to automate pcapp analysis

#Directory Paths for 
PCAP_DIR="/home/is414/bro_is414/pcaps/*"
BROLOGS_DIR="/home/is414/bro_is414/brologs/"

#Change color of STDOUT
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo "Welcome to bro_pcapAnalysis.sh"
echo "I am a bot that will automate a few tasks for you"
echo "I will look for pcap files located at $PCAP_DIR"
echo -e "I will take each pcap file that I find and analyze it with the following command:\n /usr/local/bro/bin/bro -r [file]"
echo -e "I will save the bro analysis in $BROLOGS_DIR\n"

read -p "Begin automation now? (Y/N)" -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo -e "\nBegining Automation"
	rm -rf $BROLOGS_DIR
	mkdir $BROLOGS_DIR

	for file in $PCAP_DIR
	do

	        #make directory for $file analysis
	        filename=$(basename -- "$file")
		filename="${filename%.*}"
	        echo -e "${RED}Now analyzing $filename${NC}"
	        mkdir "${BROLOGS_DIR}${filename}"
	        cd /home/is414/bro_is414/brologs/"$filename"

	        #analyze $file with bro
	        /usr/local/bro/bin/bro -C -r "$file"

	        echo -e "${GREEN}Saved analysis in $(pwd)${NC}"
	done

else
	echo -e "\nExiting script without any actions"
fi
