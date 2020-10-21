hastebin
=======

## Overview

A script for fetching or posting text pastes on https://hastebin.com.

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
