# de facto there is a sources handle_success.bash here
get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"Oh, ene heroi distiratzailea," \
		"eguzki pozkidatzailea," \
		"inor ez dut ikusiko zure antzekorik." \
		"" \
		"Ez zaitut utziko labirintoaren aruka biluzik," \
		"haria emango dizut," \
		"eta beste muturrean aurkituko nauzu ni." \
		"" \
		"Ezpata emango dizut," \
		"ene maitea," \
		"piztia eta berarentzat dugun izua," \
		"erbestuak izango dira" \
		"huarte hontatik" \
		"erabiltzailea: Bombe" \
		"pasahitza: Bombe_gailua_ez_zen_turing_osoa" > /home/Z3/sarraila/haria
	cat /home/Z3/sarraila/haria
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/Z3/sarraila /home/Z3/ate_irekia
	mv /home/Z3/helburua /home/Z3/helburu_lortua
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
