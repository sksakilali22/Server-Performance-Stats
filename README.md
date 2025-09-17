## Server Performance Stats

## Overview
This project contains a bash script (server-stats.sh) that analyzes basic server performance statistics on a Linux system.

## Contents

1. server-stats.sh – The main script (bash executable)
2. server-stats.txt – Same script in plain text format
3. Report.pdf – Documentation, instructions, and sample output
4. Output_server_stats.txt

## Features Implemented

1. CPU Usage – Shows total CPU usage percentage.
2. Memory Usage – Displays used vs free memory with percentage.
3. Disk Usage – Displays used vs free disk space with percentage.
4. Top 5 CPU Processes – Lists top 5 processes by CPU usage.
5. Top 5 Memory Processes – Lists top 5 processes by memory usage.
6. Extra Details – Additionally, the script includes extra details such as:
• OS version
• System uptime
• Load average
• Logged-in users
• Failed login attempts

## How to Run

1. Save the script file:
server-stats.sh

2. Make it executable:
chmod +x server-stats.sh

3. Run the script:
./server-stats.sh

## Conclusion
The server-stats.sh script successfully collects and reports key server performance statistics, including CPU usage, memory usage, disk usage, and top processes. It is lightweight, portable, and designed to work on most Linux environments without requiring additional dependencies. This makes it a reliable tool for basic server monitoring and performance analysis.
