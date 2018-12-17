# Envy

Envy intends to be a very straightforward server that will print its' own environment variables.

I built this to have a quick-n-dirty binary I can run inside of the [Firecracker microVM](https://github.com/firecracker-microvm/firecracker) to test certain things.

Expect it to grow and gain more functionality, but it will always be a simple json loopback-style debug server.

### Example Output

```json
{
  "environment": {
    "HOME": "/Users/michael",
    "PWD": "/Users/michael/Code/envy",
    "RACK_ENV": "development",
    "RAILS_ENV": "development",
    "SHELL": "/bin/zsh",
  },
  "uname": "Darwin loki 18.2.0 Darwin Kernel Version 18.2.0: Mon Nov 12 20:24:46 PST 2018; root:xnu-4903.231.4~2/RELEASE_X86_64 x86_64",
  "hostname": "loki"
}
```


### Building & Running

First we build:

    shard build

Then we run:

    ./bin/envy

The `PORT` environment variable is used to determine where it binds, defaulting to `8080`
