hastebin
=======

A script for fetching or posting text pastes on https://hastebin.com.

## Upload A Paste

To upload a paste, pipe some text via `stdin` to `hastebin`.

    $ cat file.txt | hastebin
    $ hastebin < file.txt

An uploader can automatically copy the resulting paste URL to clipboard with `--clipboard|-c`.

    $ cat file.txt | hastebin --clipboard
    $ cat file.txt | hastebin -c

The clipboard command can be customized via `--clip-command|-cc`.

    $ cat file.txt | hastebin -cc 'xclip -sel clipboard' -c

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