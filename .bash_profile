#!/bin/bash


# Q1
# Add greeting message to .bash_profile
echo "Hello $USER"

export course_id="devopsthehardway"

token_file="$HOME/.token"

# Check if the .token file exists
if [ -f "$token_file" ]; then
    # Get the octal representation of the file permissions
    permissions=$(stat -c "%a" "$token_file")

    # Check if permissions are different from 600
    if [ "$permissions" -gt 600 ]; then
        echo "Warning: .token file has too open permissions"
    fi
else
    echo "Warning: .token file does not exist in the home directory"
fi

umask 006

export PATH="$PATH:/home/$USER/usercommands"

# Get the current date and time in ISO 8601 format with UTC timezone
echo "The current date is:" $(/bin/date -u +'%Y-%m-%dT%H:%M:%S%:z')

# Print the current date and time
echo $current_date

alias ltxt="/bin/ls *.txt"

# Define the directory path
tmp_dir="$HOME/tmp"

# Check if the directory exists
if [ -d "$tmp_dir" ]; then
    # Directory exists, clean its contents
    /bin/rm -rf "$tmp_dir"/*   # Deletes all files and subdirectories inside tmp_dir
else
    # Directory does not exist, create it
    /bin/mkdir "$tmp_dir"
fi

# Check if a process is bound to port 8080
if /bin/lsof -Pi :8080 -sTCP:LISTEN -t >/dev/null; then
    # Get the PID of the process bound to port 8080
    PID=$(lsof -Pi :8080 -sTCP:LISTEN -t)
    #Kill the process
    kill $PID
fi
