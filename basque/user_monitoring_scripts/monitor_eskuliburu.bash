tar -xzf /home/eskuliburu/zaborra.tar.gz -C /home/eskuliburu/
rm -f /home/eskuliburu/zaborra.tar.gz
chown -R eskuliburu /home/eskuliburu/zaborra

PARENT_DIR="/home/eskuliburu"                               # Parent directory to watch
TARGET_DIR="sarraila"                                       # Directory that the student will create
KEY_FILE="giltza"                                           # The file to watch for inside TARGET_DIR
EXPECTED_CONTENT=$(find $PARENT_DIR/zaborra -size +0 | grep "giltz" | sort | xargs cat 2> /dev/null)
COLOR_GREEN="\033[32m"
COLOR_RESET="\033[0m"

trap '' SIGINT

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		FILE_CONTENT=$(cat "$PARENT_DIR/$TARGET_DIR/$KEY_FILE")
		if [[ "$FILE_CONTENT" == "$EXPECTED_CONTENT" ]]; then
			stty -F /dev/tty igncr -isig -icanon -ixoff -echo
			tput civis > /dev/tty
			tput clear > /dev/tty
			printf "%s\n%s\n%s\n%s\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
				"ene seme maitea, maitatu baldinba dezaket nik" \
				"hartu hegal hauek eta etorri nirekin;" \
				"baino ez zaitez hurbildu eguzkira gehiegi" \
				"ez baduzu nahi zerutik erortzen hil" \
				"erabiltzailea: madarikatua" \
				"pasahitza: gogoko_ditut_eskuliburuak" > /home/eskuliburu/sarraila/haria
			cat /home/eskuliburu/sarraila/haria > /dev/tty
			stty -F /dev/tty -igncr &> /dev/null
			read -s -r -n1 < /dev/tty
			stty -F /dev/tty sane &> /dev/null
			pkill -SIGINT bash
			exit 0
		fi
	fi
	sleep 0.2
done
