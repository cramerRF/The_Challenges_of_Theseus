# de facto there is a sources handle_success.bash here
get_success_lock_might_return

if [ ! -f "/user_shell_files/foreground_activated" ]; then
	touch /user_shell_files/foreground_activated
	stty igncr -isig -icanon -ixoff -echo
	tput civis
	tput clear
	printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n\n\n$COLOR_GREEN%s\n%s$COLOR_RESET\n" \
		"Nire bihotza dardarka," \
		"inork al daki zer duen niretzat etorkizunak?" \
		"" \
		"Ari, Ari... zertan ari gara?" \
		"Ihes hau askatasuna al da," \
		"edo hemen genuen heriotza" \
		"ukatzeko beste aukera petral bat?" \
		"" \
		"Maitasuna eta poza aurkituko al dugu" \
		"eramango gaituzten lurralde berrietan?" \
		"erabiltzailea: inception" \
		"pasahitza: lunar_effect" \
		> /home/abacus/sarraila/haria
	cat /home/abacus/sarraila/haria
	stty -igncr
	read -s -r -n1
	stty sane
	mv /home/abacus/sarraila /home/abacus/ate_irekia
	mv /home/abacus/helburua /home/abacus/helburu_lortua
	cd
	tput clear
	tput cnorm
fi

yield_success_lock
