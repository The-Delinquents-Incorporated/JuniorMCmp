#!/bin/bash

# Start the Playit daemon in a NEW Terminal window
echo "Starting playitd in a new window..."
osascript -e 'tell application "Terminal" to do script "cd /Users/caden/A.Developer/JuniorMC/PLAY-IT/ && cargo run --release --bin playitd"'

# Delay for 5 seconds to allow the daemon to connect
echo "Waiting 5 seconds before starting CLI..."
sleep 5

# Start the Playit CLI in another NEW Terminal window
echo "Starting playit-cli in a new window..."
osascript -e 'tell application "Terminal" to do script "cd /Users/caden/A.Developer/JuniorMC/PLAY-IT/ && cargo run --release --bin playit-cli"'

# Start the Minecraft server in THIS foreground window
echo "Starting Minecraft server..."
cd "/Users/caden/A.Developer/JuniorMC/SERVER" || exit
./run.sh

# When the Minecraft server stops, kill the Playit processes
echo "Server stopped. Shutting down playit agents..."
pkill -f "playitd"
pkill -f "playit-cli"