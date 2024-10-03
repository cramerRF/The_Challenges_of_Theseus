FROM debian:latest

RUN		apt update && apt upgrade && apt install sudo vim nano man gosu procps -y
RUN		apt clean -y

RUN		echo ENV=/etc/shinit >> /etc/environment
RUN		echo case "$-" in > /etc/shinit
RUN		echo "*i*) trap 'tput clear || true; tput cnorm || true' SIGUSR1 ;;" >> /etc/shinit
RUN		echo esac >> /etc/shinit
RUN		chmod +x /etc/shinit

COPY	basque/create_users.bash /root/basque/create_users.bash

COPY	create_all_users.bash /root/create_all_users.bash
RUN		bash /root/create_all_users.bash

COPY	basque/home/ /home/
RUN     for dir in /home/*; do sudo chown -R $(basename $dir):$(basename $dir) $dir; done

COPY	basque/user_monitoring_scripts/ /root/basque/user_monitoring_scripts/
COPY	basque/launch_monitors.bash /root/basque/launch_monitors.bash
COPY	launch_all_monitors.bash /root/launch_all_monitors.bash
