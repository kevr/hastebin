hastebin
=======

## Overview

A script for fetching or posting text pastes on https://hastebin.com.

See [Installation](#installation) for instructions on installing this script
to your system.

## Usage & Options

    usage: hastebin [-h] [--clip-command clip_command] [--clipboard] [id]

    Upload text from stdin to HASTEBIN_SERVER_URL. If [id] is provided,
    the corresponding paste is fetched and displayed instead.

    positional arguments:
      id                    when provided, fetches and displays a hastebin paste

    optional arguments:
      -h, --help            show this help message and exit
      --clip-command clip_command, -cc clip_command
                            clipboard command (default: HASTEBIN_CLIPPER)
      --clipboard, -c       pipe stdout to --clip-command

    environment variables:
      HASTEBIN_CLIPPER (default: 'xclip -sel primary')
      HASTEBIN_SERVER_URL (default: 'https://hastebin.com')
      HASTEBIN_SERVER_TIMEOUT (default: 5)

## Upload A Paste

To upload a paste, pipe some text via `stdin` to `hastebin`.

    $ cat file.txt | hastebin
    https://hastebin.com/bvnsansfasxy
    $ hastebin < file.txt
    https://hastebin.com/fdgabeb94321

An uploader can automatically copy the resulting paste URL to clipboard with `--clipboard|-c`.

    $ cat file.txt | hastebin --clipboard
    https://hastebin.com/blahblah1234
    $ cat file.txt | hastebin -c
    https://hastebin.com/hahaabcd4312

The clipboard command can be customized via `--clip-command|-cc`.

    $ cat file.txt | hastebin -cc 'xclip -sel clipboard' -c
    https://hastebin.com/specialhash1

## Fetch A Paste

Already uploaded pastes can be fetched by passing the paste ID to hastebin as a positional argument.

    $ echo 'test' | hastebin
    https://hastebin.com/abcdefgh1234
    $ hastebin abcdefgh1234
    test
    $ hastebin https://hastebin.com/abcdefgh1234
    test

## Configuration

A few environment variables are utilized for defaults.

* `HASTEBIN_SERVER_URL`: The hastebin URL (default: 'https://hastebin.com')
* `HASTEBIN_SERVER_TIMEOUT`: The hastebin request timeout (default: 5)
* `HASTEBIN_CLIPPER`: Default --clip-command

## Installation

The `hastebin` script in this repository can be installed to any location
in `$PATH` to be used on your system.

Dependencies:
- python3
- python3 requests package
    - https://pypi.org/project/requests/
    - https://packages.ubuntu.com/search?keywords=python3-requests

To install globally, one can place hastebin in `/usr/local/bin` as root:

    # install -m755 hastebin /usr/local/bin/hastebin

To install locally, one can place hastebin in `~/.local/bin` and add
`~/.local/bin` to their `$PATH` in shell initialization:

    $ install -m755 hastebin ~/.local/bin/hastebin

An installation script will be provided at some point; for now, these
methods can be used as workarounds.
