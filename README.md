# rpcapd utility for Linux
rpcapd is a daemon that provides remote traffic capture for Windows version of [Wireshark](http://www.wireshark.org) protocol analyzer. It is shipped with [WinPCAP](http://www.winpcap.org/)  network capture library for Windows but is absent from libpcap in Linux.

This is a fork of rpcapd modified to compile and work in Linux.

It is still quite messy and may not compile or work. Also contains a memory leak when client (Wireshark) is requesting available interfaces.

## Building
This fork ships with a patched libpcap version found in WinPCAP library.

Installation under Ubuntu Linux:

    sudo apt-get build-dep libpcap
    cd rpcapd/libpcap
    ./configure && make
    cd ../
    make

