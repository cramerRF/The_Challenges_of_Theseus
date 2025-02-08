# de facto there is a sources handle_success.bash here
get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"Asmakizun hau gainditu duzu" \
		"erabiltzailea: hastapena" \
		"pasahitza: ilargiondorioa" \
		> /home/abakoa/sarraila/haria
	cat /home/abakoa/sarraila/haria
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/abakoa/sarraila /home/abakoa/ate_irekia
	mv /home/abakoa/helburua /home/abakoa/helburu_lortua
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
