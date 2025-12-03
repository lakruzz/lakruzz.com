# When the port hangs

When you kill the command `jekyll serve` it should tear down and release the port as well. Occasionally that doesn't happen. Which means that the port `4000` is bound and you can't start the command again on port `4000`. Instead you get an error:

```shell
Error: command error: server startup failed: listen tcp 127.0.0.1:4000: bind: address already in use
```

When that happens run the following command to learn which process is listening to the port:

```shell
netstat -pna | grep "4000"
```

It will reveal the process like this:

```shell
tcp        0      0 127.0.0.1:4000          0.0.0.0:*               LISTEN      3992/jekyll serve - 
```

In this case PID `3992`.

Now simply kill it (e.g. `kill 3992`) and the port is released.
