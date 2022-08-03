#!/usr/bin/env bash

dir="~/.config/rofi"
uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/powermenu.rasi"

# Options
shutdown=""
reboot=""
lock=""
logout="﫼"

# Confirmation
confirm_exit() {
	sleep 0.1; echo -e "Yes\nNo" | rofi -hover-select -me-select-entry '' -me-accept-entry MousePrimary -dmenu -selected-row 2 -theme-str "
		@import \"~/.config/rofi/confirm.rasi\"
		textbox {
		    str: \"Confirm $1\"; 
		}
	"
}

# Variable passed to rofi
options="$lock\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -hover-select -me-select-entry '' -me-accept-entry MousePrimary -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
		ans=$(confirm_exit "Shutdown" &)
		if [[ $ans == "Yes" ]]; then
			systemctl poweroff
		elif [[ $ans == "No" ]]; then
			echo $chosen
			exit 0
		fi
        ;;
    $reboot)
		ans=$(confirm_exit "Restart" &)
		if [[ $ans == "Yes" ]]; then
			systemctl reboot
		elif [[ $ans == "No" ]]; then
			exit 0
		fi
        ;;
    $lock)
		if [[ -f /usr/bin/betterlockscreen ]]; then
			betterlockscreen -l
		fi
        ;;
    $logout)
		ans=$(confirm_exit "Logout" &)
		if [[ $ans == "Yes" ]]; then
			bspc quit
		elif [[ $ans == "No" ]]; then
			echo $chosen
			exit 0
		fi
        ;;
esac