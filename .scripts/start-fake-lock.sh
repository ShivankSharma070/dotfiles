
#!/bin/bash


# Function to collect system information
collect_system_info() {
    # Time and Date
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S %Z')

    # Hostname and User
    HOSTNAME=$(hostname)
    CURRENT_USER=$(whoami)

    # Memory Usage
    MEMORY=$(free -h | awk '/^Mem:/ {print "Total: " $2 ", Used: " $3 ", Free: " $4}')

    # CPU Usage (requires sysstat for mpstat)
    if command -v top > /dev/null; then
        CPU_USAGE=$(top -bn1 | grep "%Cpu(s)" | awk '{print 100 - $8 "%"}')
    else
        CPU_USAGE="No Cpu info"
    fi

    # Uptime
    UPTIME=$(uptime -p)

    # Recent Login Attempts (last 3)
    LOGIN_ATTEMPTS=$(last -3 -a | head -n -2)

    # Network Status
    IP_ADDRESS=$(ip addr show | grep -oP 'inet \K[\d.]+' | grep -v '127.0.0.1' | head -n 1)
    NETWORK_INTERFACES=$(ip link show | awk -F': ' '/^[0-9]+:/ {print $2}')

    # Location (approximate, using ipinfo.io)
    if command -v curl > /dev/null && ping -c 1 8.8.8.8 > /dev/null 2>&1; then
      LOCATION=$(curl -s https://ipinfo.io | jq -r '"City: \(.city)\nRegion: \(.region)\nCountry: \(.country)\nCoordinates: \(.loc)\nInternetProvider: \(.org)\nPostal: \(.postal)"' 2>/dev/null || echo "Unable to fetch location")
    else
        LOCATION="No internet or curl not installed"
    fi

    # Combine information
    cat <<EOF
Intruder Alert: Someone tried to use your computer!

Timestamp: $TIMESTAMP
Hostname: $HOSTNAME
Current User: $CURRENT_USER
Memory Usage: $MEMORY
CPU Usage: $CPU_USAGE
Uptime: $UPTIME
IP Address: $IP_ADDRESS
Network Interfaces:
$NETWORK_INTERFACES
Location (Approximate): $LOCATION
Recent Login Attempts:
$LOGIN_ATTEMPTS
EOF
}

# Function to send email
send_email() {
    local subject="Intruder Alert at $HOSTNAME"
    local body
    body=$(collect_system_info)
    echo "$body" | mail -s "$subject"  "shivanksharma070@gmail.com"
}


kdeconnect-cli -d 1f0d6246_838e_4507_87f5_c1d73103ba59 --ping-msg "Someone is using your computer" 
send_email &
if ! pgrep -f fake-lock-screen > /dev/null; then
  fake-lock-screen.py 
fi 
