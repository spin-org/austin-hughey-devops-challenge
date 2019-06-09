# spin

This code is for a DevOps challenge from www.spin.app.

## Running the Service

When the service starts up, it'll tell you what port it's running on.

### IMPORTANT: If you don't set a port, it'll default to 8000 so SET A PORT ENV VAR.

```
[you@server] $ PORT=8000 go run service.go
[you@server] $ PORT=8001 go run service.go
[you@server] $ PORT=8002 go run service.go
```

You should see this per each process launched:

```
[you@server] $ PORT=8000 go run service.go
Starting up on port: 8000
```

If the port requested is already in use, you'll get an error message. Remember:
_if you haven't set a `PORT` environment variable, it'll default to `8000`_.

## Connecting to the service

You can use `nc` (netcat) to demo this:

```
[you@devbox] $ nc server 8000
Hello! From goservice.go
```

Use `CTRL+C` to exit netcat.

Or, you can use `telnet`:

```
[you@devbox] $ telnet server 8000
Trying ::1...
Connected to localhost.
Escape character is '^]'.
Hello! From goservice.go
```

To bail out, use `CTRL+]` (yes, control plus close bracket). Then type `quit`
and hit enter.

