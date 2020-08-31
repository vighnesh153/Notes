> An http request making package

## More detailed info
[here](https://www.npmjs.com/package/axios)

## GET

Promise based approach
```js
axios.get('/user', {
    params: {
      ID: 12345
    }
  })
  .then(function (response) {
    console.log(response);
  })
  .catch(function (error) {
    console.log(error);
  })
  .finally(function () {
    // always executed
  });  
```

Async-Await based approach
```js
async function getUser() {
  try {
    const response = await axios.get('/user?ID=12345');
    console.log(response);
  } catch (error) {
    console.error(error);
  }
}
```

## POST

Promise based
```js
axios.post('/user', {
    firstName: 'Fred',
    lastName: 'Flintstone'
  })
  .then(function (response) {
    console.log(response);
  })
  .catch(function (error) {
    console.log(error);
  });
```

Async-Await based approach: similar to the one shown in `GET` section

## Performing multiple requests concurrently (at the same time, or simultaneously)
```js
function getUserAccount() {
  return axios.get('/user/12345');
}

function getUserPermissions() {
  return axios.get('/user/12345/permissions');
}

axios.all([getUserAccount(), getUserPermissions()])
  .then(
      axios.spread((userAccount, userPermissions) => {
          // Both requests are now complete
      })
  );
```

## Axios API
```js
// Send a POST request
axios({
  method: 'post',
  url: '/user/12345',
  data: {
    firstName: 'Fred',
    lastName: 'Flintstone'
  }
});

// GET request for remote image
axios({
  method: 'get',
  url: 'http://bit.ly/2mTM3nY',
  responseType: 'stream'
})
  .then(function (response) {
    response.data.pipe(fs.createWriteStream('ada_lovelace.jpg'))
  });
```

## Interceptors
Should be done at the beginning before making any requests, else, the middleware won't
be registered. In react, define it in `index.js` so that it is always registered first.
```js
axios.interceptors.request.use(
    request => {
        console.log(request);
        return request;
    }, error => {
        console.log(error);
        return Promise.reject(error);
    }
);

axios.interceptors.response.use(
    response => {
        console.log(response);
        return response;
    }, error => {
        console.log(error);
        return Promise.reject(error);
    }
);
```

##### Removing interceptors
```js
const myInterceptor = axios.interceptors.request.use(() => {});
axios.interceptors.request.eject(myInterceptor);
```

##### Global config
```js
axios.defaults.baseURL = 'some-url';
axios.defaults.headers.common['Authorization'] = 'AUTH-TOKEN';
axios.defaults.headers.post['Content-Type'] = 'application/json';       // only for post request
```


```js
import {default as axios} from 'axios';

const authInstance = axios.create({
    baseURL: 'auth service url';
});

authInstance.defaults.headers.common['Authorization'] = 'AUTH-TOKEN';

// we can even add interceptors here.

export default authInstance;
```
