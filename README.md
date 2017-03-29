# [weechat][] in docker

> WeeChat (Wee Enhanced Environment for Chat) is a fast and light chat
> client for many operating systems.

## Building

Build the image first:

    docker build -t weechat .

Or use the Makefile:

    make

## Usage

To use the image run:

    mkdir ~/.weechat
    docker run -it --rm -v $HOME/.weechat:/home/guest/.weechat weechat

To make using this simpler there is a small shell script called `weechat`. It
can be installed to your `PATH` with:

    make install

[weechat]: https://weechat.org/
