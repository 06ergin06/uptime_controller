# Uptime Controller

A simple Bash script that monitors website uptime by continuously checking the availability of a specified website and providing detailed statistics.

## Features

- **Real-time Monitoring**: Continuously monitors website availability
- **Customizable Sleep Interval**: User can specify check frequency (default: 5 seconds)
- **Status Tracking**: Counts online and offline occurrences
- **Runtime Tracking**: Shows total monitoring duration in hours, minutes, and seconds
- **Color-coded Output**: Green for online count, red for offline count
- **Graceful Reporting**: Press Ctrl+C to generate a summary report
- **Error Code Display**: Shows curl error codes for debugging offline issues
- **Simple Interface**: Easy-to-use command-line interface

## How It Works

The script uses `curl` to send HEAD requests to the specified website:

- **Online**: When curl returns status code 0 (success)
- **Offline**: When curl returns any non-zero status code (with error code displayed)
- **Monitoring Loop**: Continuously checks at specified intervals
- **Signal Handling**: Intercepts Ctrl+C to display final report

## Installation

### Download the Script

You can download the script directly using `curl` or `wget`:

```bash
# Using curl
curl -O https://raw.githubusercontent.com/06ergin06/uptime_controller/main/script.sh

# Using wget
wget https://raw.githubusercontent.com/06ergin06/uptime_controller/main/script.sh

# Or clone the entire repository
git clone https://github.com/06ergin06/uptime_controller.git
cd uptime_controller
```

## Usage

Make the script executable and run it:

```bash
chmod +x script.sh
./script.sh <website_url> [sleep_interval]
```

### Parameters

- `<website_url>` (required): The website URL to monitor (e.g., `https://google.com`)
- `[sleep_interval]` (optional): Time in seconds between checks (default: 5 seconds)

### Examples

```bash
# Monitor Google with default 5-second intervals
./script.sh https://google.com

# Monitor GitHub with 10-second intervals
./script.sh https://github.com 10

# Monitor a local server with 2-second intervals
./script.sh http://localhost:3000 2
```

## Sample Output

```text
./script.sh https://google.com
Welcome to uptime controller
https://google.com
ONLINE
ONLINE
ONLINE
OFFLINE (Error code : 6)
ONLINE
^C
-------- Uptime Report https://google.com : --------
Online count : 4
Offline count : 1
Total runtime : 0 hours, 0 minutes, 25 seconds
```

```text
./script.sh https://example.com 10
Welcome to uptime controller
https://example.com
ONLINE
ONLINE
ONLINE
^C
-------- Uptime Report https://example.com : --------
Online count : 3
Offline count : 0
Total runtime : 0 hours, 0 minutes, 30 seconds
```
