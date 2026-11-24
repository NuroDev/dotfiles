aliases () {
	alias | grep "$1"
}

dir() {
	mkdir -p "$1"
	cd "$1"
}

edit() {
	code ${1:-.} # Default to .
}

# ─────────────────────────────────────────
# Determine size of a file or total size of a directory
#
# Source: mathiasbynens/dotfiles
# https://github.com/mathiasbynens/dotfiles/blob/main/.functions
# ─────────────────────────────────────────
fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* ./*;
	fi;
}

latency() {
	# Check if URL is provided
	if [[ -z "$1" ]]; then
		echo "Error: URL is required"
		echo "Usage: latency <url> [number_of_requests]"
		return 1
	fi

	local url="$1"
	local times=${2:-10}

	# Add http:// prefix if the URL doesn't start with http:// or https://
	if [[ ! "$url" =~ ^https?:// ]]; then
		url="https://$url"
	fi

	# Collect all measurements
	local results=()
	local timeTotal
	for i in $(seq 1 $times); do
		if ! timeTotal=$(curl -o /dev/null -s -w '%{time_total}' "$url"); then
			echo "Request $i: failed"
			continue
		fi
		local result=$(echo "$timeTotal" | awk '{printf "%.0f", $1 * 1000}')
		results+=($result)
		echo "Request $i: $result ms"
	done

	if (( ${#results} == 0 )); then
		echo "Error: all $times requests failed"
		return 1
	fi

	# Calculate statistics
	local sum=0
	local min=${results[1]}
	local max=${results[1]}

	for val in "${results[@]}"; do
		sum=$((sum + val))
		if (( val < min )); then min=$val; fi
		if (( val > max )); then max=$val; fi
	done

	local avg=$((sum / ${#results}))

	echo "------------------------"
	echo "Min: $min ms"
	echo "Max: $max ms"
	echo "Avg: $avg ms"
}

# ─────────────────────────────────────────
# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
# ─────────────────────────────────────────
tre() {
	tree -aC -I '.git|target|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}

tree() {
	command tree -I 'node_modules' -I 'target' "$@"
}

# ─────────────────────────────────────────
# Forked to use `jq` instead of `grep` & `awk`
#
# Source: trozler/whereAmI
# https://github.com/trozler/whereAmI/blob/master/findmepls.sh
# ─────────────────────────────────────────
whereami() {
	RESP=$(curl -s "ipinfo.io")
	CITY=$(echo "$RESP" | jq -r '.city')
	COUNTRY=$(echo "$RESP" | jq -r '.country')
	IP=$(echo "$RESP" | jq -r '.ip')
	REGION=$(echo "$RESP" | jq -r '.region')
	printf "%s - %s, %s, %s.\n" "$IP" "$CITY" "$REGION" "$COUNTRY"
}
