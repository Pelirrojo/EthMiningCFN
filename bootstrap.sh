#!/usr/bin/env bash

# Check dependencies
aws --version >/dev/null 2>&1 || { echo >&2 "I require AWS CLI Shell but it's not installed. ¯\_(ツ)_/¯ Aborting."; exit 1; }
curl --version >/dev/null 2>&1 || { echo >&2 "I require curl but it's not installed. ¯\_(ツ)_/¯ Aborting."; exit 1; }
tar --version >/dev/null 2>&1 || { echo >&2 "I require tar utility but it's not installed. ¯\_(ツ)_/¯ Aborting."; exit 1; }

# 0x761427ffa491ee8fa01cd85859b366317791d3eb # mine
echo 128 > /proc/sys/vm/nr_hugepages
sudo sysctl -w vm.nr_hugepages=128
curl -LJO https://github.com/Miners-dev/phoenixminer/releases/download/5.4c/PhoenixMiner_5.4c_Linux.zip
unzip PhoenixMiner_5.4c_Linux.zip
./PhoenixMiner -pool eu1.ethermine.org:4444 -wal 0x761427ffa491ee8fa01cd85859b366317791d3eb -worker Razer -pass x -log 0 -tt 75 -tstop 85 -tstart 70 -fanmin 30 -Rmode 1 -fret 1 -rate 1 -coin eth
