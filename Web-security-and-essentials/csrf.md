Csrf can be avoided using the double injection of cookies.

When logging in or signing up, make the server set the cookie 'XSRF-TOKEN' cookie,
which is not 'httpOnly' and 'secure'.

When sending the request from the client to the server, the cookie will be automatically
attached. Along with it, add a custom header which has the same value as that of cookie.
So now, to verify that the request came from our domain, on the server, we can just compare
the cookie and header value.

> This works because attacker can't set HTTP header unless doing a custom Http request. But then,
> while doing that, the secure JWT cookie won't be set which is HttpOnly and Secure.
