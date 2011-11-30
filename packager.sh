#!/bin/bash

function timestamp {
	if [ "$(uname)" = "Linux" ]; then
		stat -c %Y "$1"
	else
		stat -f %m -t %s "$1"
	fi
}

while true
do

	for folder in `find . -type d -name "*.*" `; do
		extension=${folder##*.}
		
		if [ "$extension" = "less" ]; then

			last_generated=$(timestamp ${folder%.*}.css 2> /dev/null || echo 0)
		
			last_modified=0
			for file in `find $folder`; do
				time=$(timestamp $file)
				if [ $time -gt $last_modified ]; then
					last_modified=$time
				fi
			done
		
			if [ $last_modified -gt $last_generated ]; then
				echo Gerando ${folder%.*}.css
				
				temp=$(mktemp -t less)
				find $folder -type f -print0 | xargs -0 cat > $temp
				~/node_modules/less/bin/lessc $temp > ${folder%.*}.css
			fi
		fi
	done
	sleep 1
done