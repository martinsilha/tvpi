# Adding colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'
BLUE='\033[0;34m'
WHITE='\033[1;37m'
PINK='\033[1;35m'
PURPLE='\033[0;35m'
ORANGE='\033[0;33m'
MAROON='\033[0;41m'

# Function to print section title
section_title() {
    local color="$1"
    local message="$2"
    echo -e "\n${color}==== $message ====${NC}\n"
}

# Function to print console message
console_message() {
    local color="$1"
    local message="$2"
    echo -e "${color}$message${NC}"
}

# Function to send a Slack message
send_slack_message() {
    local channel="$1"
    local message="$2"
    local hostname=$(hostname)
    local timestamp=$(date)
    curl -X POST -H 'Content-type: application/json' --data "{
        \"channel\": \"$channel\",
        \"username\": \"$SLACK_USERNAME\",
        \"text\": \"[$timestamp] [$hostname] $message\"
    }" $SLACK_WEBHOOK_URL
}

# Function to handle errors
error_handler() {
    local exit_code=$?
    local command="${BASH_COMMAND}"
    send_slack_message "$SLACK_CHANNEL_ERROR" "Error during execution of command: \"$command\" with exit code $exit_code."
    exit $exit_code
}

# Function to ensure a directory exists
ensure_directory() {
    local dir="$1"
    mkdir -p "$dir" || {
        send_slack_message "$SLACK_CHANNEL_ERROR" "Failed to create directory: $dir."
        exit 1
    }
}

# Function to create a script file
create_script() {
    local filepath="$1"
    local content="$2"
    echo "$content" > "$filepath"
    if [ -f "$filepath" ]; then
        console_message "File created: $filepath"
        sudo chmod +x "$filepath" || {
            send_slack_message "$SLACK_CHANNEL_ERROR" "Failed to configure script: $filepath."
            exit 1
        }
    else
        console_message "${RED}Failed to create the file: $filepath${NC}"
        send_slack_message "$SLACK_CHANNEL_ERROR" "Failed to create the file $filepath."
        exit 1
    fi
}
