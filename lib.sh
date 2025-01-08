# Adding colors
BLACK='\033[0;30m'       # Black
RED='\033[0;31m'         # Red
GREEN='\033[0;32m'       # Green
YELLOW='\033[0;33m'      # Yellow
BLUE='\033[0;34m'        # Blue
MAGENTA='\033[0;35m'     # Magenta
CYAN='\033[0;36m'        # Cyan
WHITE='\033[0;37m'       # White

BRIGHT_BLACK='\033[1;30m'   # Bright Black (Gray)
BRIGHT_RED='\033[1;31m'     # Bright Red
BRIGHT_GREEN='\033[1;32m'   # Bright Green
BRIGHT_YELLOW='\033[1;33m'  # Bright Yellow
BRIGHT_BLUE='\033[1;34m'    # Bright Blue
BRIGHT_MAGENTA='\033[1;35m' # Bright Magenta
BRIGHT_CYAN='\033[1;36m'    # Bright Cyan
BRIGHT_WHITE='\033[1;37m'   # Bright White

RESET='\033[0m'           # Reset / No Color

TITLE_COLOR=$BRIGHT_CYAN

# Function to print section title
section_title() {
    local color="$TITLE_COLOR"
    local message="$1"
    if [[ "$1" =~ ^\\033 ]]; then
        color="$1"
        message="$2"
    fi
    echo -e "\n${color}==== $message ====${RESET}\n"
}

# Function to print console message
console_message() {
    local color="$1"
    local message="$2"
    echo -e "::: ${color}$message${RESET}"
}

console_error() {
    console_message "$RED" "$1"
}

console_warning() {
    console_message "$YELLOW" "$1"
}

console_info() {
    console_message "$BRIGHT_BLUE" "$1"
}

console_success() {
    console_message "$BRIGHT_GREEN" "$1"
}

# Function to ensure a directory exists
ensure_directory() {
    local dir="$1"
    mkdir -p "$dir" || {
        console_error "Failed to create directory: $dir."
        exit 1
    }
}

# Function to create a script file
create_script() {
    local filepath="$1"
    local content="$2"
    echo "$content" > "$filepath"
    if [ -f "$filepath" ]; then
        console_message "$BRIGHT_GREEN" "File created: $filepath"
        chmod +x "$filepath" || {
            console_error "Failed to configure script: $filepath."
            exit 1
        }
    else
        console_error "Failed to create the file: $filepath"
        exit 1
    }
}
