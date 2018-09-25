# Update: libpcap v1.9.0 now has rpcapd

An rpcapd executable is generated in libpcap v1.9.0 and later, when compiled with the `--enable-remote` flag (`./configure --enable-remote && make`). That should be used instead of this fork.

# rpcapd utility for Linux
rpcapd is a daemon that provides remote traffic capture for Windows version of [Wireshark](http://www.wireshark.org) protocol analyzer. It is shipped with [WinPcap](http://www.winpcap.org/)  network capture library for Windows but is absent from libpcap older than 1.9.0 in Linux.

This is a fork of rpcapd modified to compile and work in Linux.

It is still quite messy and may not compile or work.

## Building
This fork ships with a patched libpcap version found in WinPcap library.

Installation under Ubuntu Linux:

    sudo apt-get build-dep libpcap
    cd rpcapd/libpcap
    ./configure && make
    cd ../
    make

Installation under Centos/Fedora/Redhat Linux:

libcrypt.a in glibc-static is broken in ,remove `-static` in Makefile

     yum install -y byacc glibc-static libgcrypt-devel
     cd rpcapd/libpcap
     ./configure && make
     cd ../
     make

## Using
This tool is to be used with Windows clients connecting to the linux box. Launch this tool using

    sudo ./rpcapd -4 -n -p <chosen_port>

You can specify a data transfer port rather than a random port by default.

    sudo ./rpcapd -4 -n -t <data_transfer_port> -p <chosen_port>

Root privileges are needed to capture the interfaces.

There are two ways to connect from a Windows box: 
  1. Use GUI in Wireshark *Capture Options* dialog. Tested on Wireshark 1.7.1.
  2. Invoke wireshark from commnd line specifying capture interface directly:

    wireshark -k -i rpcapd://<capture_box_ip>:<rpcapd_port>/<interface_to_capture>

`-k` means *start capture immedietly* and `-i` stands for *interface*. You can create a Windows shortcut or something afterwards.

