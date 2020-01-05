// RxJS is a library for reactive programming using Observables, to make it easier
// to compose asynchronous or callback-based code
// It also makes the event emitting and subscribing easy.


<button id="lol">Click me</button>

<script src="https://unpkg.com/@reactivex/rxjs/dist/global/rxjs.umd.js"></script>
<script>
    const { Observable, fromEvent } = rxjs;
    const { throttleTime, map } = rxjs.operators;

    // Simple throttling and simple data transformation can be done.
    // many other things exist but these are the basics
    fromEvent(lol, 'click')
    .pipe(
        throttleTime(2000),
        map(event => event.target)
    )
    .subscribe(data => {
        console.log(data);
        console.log(new Date().toTimeString());
    });
</script>
