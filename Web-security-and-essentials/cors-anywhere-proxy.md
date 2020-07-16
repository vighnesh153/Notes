The simplest proxy is to use the heroku one:
    https://cors-anywhere.herokuapp.com/

But at times, it can be very slow.

So, solution? Create your own proxy FREE OF COST.

Visit this: https://github.com/Zibri/cloudflare-cors-anywhere

Take the code from `index.js` and deploy on a cloudflare worker. There you have
it, your own cors-anywhere proxy.
