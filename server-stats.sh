#!/bin/bash
# server-stats.sh
# Script to check basic server performance stats
# Created by: SK SAKIL ALI
# Date: 13-09-2025

echo "======================================"
echo "       SERVER PERFORMANCE STATS       "
echo "======================================"

# 1. CPU Usage
echo ""
echo "1. CPU Usage:"
if command -v mpstat >/dev/null 2>&1; then
    cpu_usage=$(mpstat 1 1 | awk '/Average/ {print 100 - $NF}')
else
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk -F'id,' '{print 100 - $1}' | awk '{print $NF}')
fi
echo "   Usage: ${cpu_usage}%"

# 2. Memory Usage
echo ""
echo "2. Memory Usage:"
free -m | awk '/Mem:/ { used=$3-$6-$7; free=$4+$6+$7; printf "   Used: %s MB | Free: %s MB | Usage: %.1f%%\n", used, free, used/$2*100 }'

# 3. Disk Usage
echo ""
echo "3. Disk Usage (Total):"
df -h --total | awk '/total/ { printf "   Used: %s | Free: %s | Usage: %s\n", $3, $4, $5 }'

# 4. Top 5 Processes by CPU
echo ""
echo "4. Top 5 Processes by CPU:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6 | tail -n 5

# 5. Top 5 Processes by Memory
echo ""
echo "5. Top 5 Processes by Memory:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6 | tail -n 5

# ===== Extra Info =====
echo ""
echo "===== Extra Info ====="

# OS Version
echo ""
echo "OS Version:"
if [ -f /etc/os-release ]; then
    grep PRETTY_NAME /etc/os-release | cut -d= -f2- | tr -d '"'
else
    uname -a
fi

# Uptime
echo ""
echo "Uptime:"
uptime -p 2>/dev/null || uptime | sed 's/.*up //; s/,.*//'

# Load Average
echo ""
echo "Load Average:"
uptime | awk -F'load average:' '{print $2}' | sed 's/^ *//'

# Logged-in Users
echo ""
echo "Logged-in Users:"
who | wc -l

# Failed Login Attempts
echo ""
echo "Failed Login Attempts:"
if [ -f /var/log/auth.log ]; then
    grep -c "Failed password" /var/log/auth.log 2>/dev/null || echo "   Permission denied (needs root)"
elif [ -f /var/log/secure ]; then
    grep -c "Failed password" /var/log/secure 2>/dev/null || echo "   Permission denied (needs root)"
else
    echo "   Log file not found"
fi

echo ""
echo "======================================"
echo "            END OF REPORT"
echo "======================================"
