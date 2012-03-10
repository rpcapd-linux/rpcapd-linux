# rpcapd utility for Linux
rpcapd is a daemon that provides remote traffic capture for Windows version of [Wireshark](http://www.wireshark.org) protocol analyzer. It is shipped with [WinPcap](http://www.winpcap.org/)  network capture library for Windows but is absent from libpcap in Linux.

This is a fork of rpcapd modified to compile and work in Linux.

It is still quite messy and may not compile or work. Also contains a memory leak when client (Wireshark) is requesting available interfaces.

## Building
This fork ships with a patched libpcap version found in WinPcap library.

Installation under Ubuntu Linux:

    sudo apt-get build-dep libpcap
    cd rpcapd/libpcap
    ./configure && make
    cd ../
    make

## Using
This tool is to be used with Windows clients connecting to the linux box. Launch this tool using

    sudo ./rpcapd -4 -n -p <chosen_port>

Root privileges are needed to capture the interfaces.

There are two ways to connect from a Windows box. One is to use GUI in Wireshark *Capture Options* dialog, but it's not cool and sometimes causes rpcapd child process to segfault during interface discovery.

Other way is to invoke wireshark from commnd line:

    wireshark -k -i rpcapd://<capture_box_ip>:<rpcapd_port>/<interface_to_capture>

`-k` means *start capture immedietly* and `-i` stands for *interface*. You can create a Windows shortcut or something afterwards.

