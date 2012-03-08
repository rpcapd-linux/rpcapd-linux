# rpcapd utility for Linux
rpcapd is a daemon that provides remote traffic capture for popular Wireshark protocol analyzer. It is shipped with WinPCAP network interface capture library for Windows but is absent from libpcap in Linux.
This fork is modified to compile and work in Linux.

It is still quite messy and may not compile or work. Also contains a memory leak when client (Wireshark) is requesting available interfaces.

## Installing
Installation under Ubuntu Linux:

    sudo apt-get build-dep libpcap
    cd rpcapd/libpcap
    ./configure && make
    cd ../
    make

