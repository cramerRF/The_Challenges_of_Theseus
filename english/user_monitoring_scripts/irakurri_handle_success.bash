# de facto there is a sources handle_success.bash here
get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n%s\n%s\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"oh ene heroi ausarta, heroien artetik" \
		"bihotzez jakin dut, lehen ikusi nizunetik" \
		"adimenean lehiatu dezakezula sortzailearekin" \
		"labirinto hau menperatuko duzu, erraz errazki" \
		"erabiltzailea: eskuliburu" \
		"pasahitza: osoa" > /home/irakurri/sarraila/haria
	cat /home/irakurri/sarraila/haria
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/irakurri/sarraila /home/irakurri/ate_irekia
	mv /home/irakurri/helburua /home/irakurri/helburu_lortua
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
