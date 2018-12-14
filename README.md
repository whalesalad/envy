# Envy

Envy intends to be a very straightforward server that will print its' own environment variables.

I built this to have a quick-n-dirty binary I can run inside of the [Firecracker microVM](https://github.com/firecracker-microvm/firecracker) to test certain things.

Expect it to grow and gain more functionality, but it will always be a simple json loopback-style debug server.


# Building & Running

First we build:

    shard build

Then we run:

    ./bin/envy

The `PORT` environment variable is used to determine where it binds, defaulting to `8080`
