#!/bin/bash
wget --directory-prefix=.tmp --timestamping --input-file=natural_earth_urls.txt
for f in .tmp/*.zip
do
	echo "$f"
	echo "${f%*.zip}"	
	unzip -d "${f%*.zip}" "$f"
done