Here, to make the use of sockets and our life simpler, we use the `socket.io` library.

When we open a connection between 2 instances, be it client-client or client-server, both the
instances need to have a socket handler to get and send events and messages. So, installing the
`socket.io` library on the server side is not enough. We need the library on the client side as well.

There is a library named `socket.io-client` that is used on the client side to help manage
the sockets. We should do that if we are using `node` to develop a client-side application like in
React/Angular. But for pure JS application, the `socket.io` library provides a work-around. Let's
say we have a server hosted and that is using `socket.io` package, the same way it is being used in
the current example, then `socket.io` also binds a special URL `/socket.io/socket.io.js` to the
server. So, if a client hits that route, the client will get a minified version of the `socket.io`
client-side. Although, this is not the preferred way for production, but this work-around exists.
