### Should be done before bootstrapping the application
```js
process.on('uncaughtException', (error)  => {
    console.log('Oh my god, something terrible happened: ',  error);
    // gracefully shut/close all the resources like DB connections, etc
    // if needed, email the admin, the error.
    // if needed, log the error.
    process.exit(1); // exit application
})
```

```js
process.on('unhandledRejection', (error) => {
    // when promise rejection is not handled
});
```
