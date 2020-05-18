A small command line utility for uploading text to hastebin.

## USAGE

```
cat /etc/passwd | hastebin
```

## Configuration

There are two environment variables for little configuration.

| Name                      | Description                 | Default                |
|---------------------------|-----------------------------|------------------------|
| HASTEBIN\_SERVER\_URL     | URL of the hastebin service | `https://hastebin.com` |
| HASTEBIN\_SERVER\_TIMEOUT | Timeout in seconds          | `5`                    |
