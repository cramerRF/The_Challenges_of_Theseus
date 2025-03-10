source /root/common_functions/monitors_lock.bash

PARENT_DIR="/home/git"
TARGET_DIR="locksmith"
KEY_FILE="change_file"
REPO_PATH="/home/git/repo"
COMMIT_HASH=$(git -C "$REPO_PATH" log --grep='^ready!!$' --pretty=format:"%H" -1)
EXPECTED_CONTENT=$(git -C "$REPO_PATH" show "$COMMIT_HASH":key)
ORIGINAL_CONTENT=$(cat "$REPO_PATH/key")

trap '' SIGINT

while true; do
	if [[ -f "$PARENT_DIR/$TARGET_DIR/$KEY_FILE" ]]; then
		cat <<< "$ORIGINAL_CONTENT" > /tmp/jatorrizko_giltza
		patch /tmp/jatorrizko_giltza $PARENT_DIR/$TARGET_DIR/$KEY_FILE &> /dev/null
		FILE_CONTENT=$(cat "/tmp/jatorrizko_giltza")
		rm /tmp/jatorrizko_giltza
		if [[ "$FILE_CONTENT" == "$EXPECTED_CONTENT" ]]; then
			get_root_lock
			cat /root/common_functions/handle_success.bash > /handle_sigint.bash
			cat /root/user_monitoring_scripts/git_handle_success.bash >> /handle_sigint.bash
			handle_succes_and_release_lock
			exit 0
		fi
	fi
	sleep 0.2
done
