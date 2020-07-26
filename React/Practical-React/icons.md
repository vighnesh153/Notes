### Installation
```
    npm install react-icons --save
```


### Using font-awesome icon
```js
import { FaBeer } from 'react-icons/fa';

class Question extends React.Component {
  render() {
    return <h3> Lets go for a <FaBeer color='purple' size='10rem' /> </h3>
  }
}
```

### Configuring color and size for app lever level
> If using app level, and then providing config to individual icon, the icon level
> config will have higher precedence

```js
import { IconContext } from "react-icons";

<IconContext.Provider value={{ color: "blue", className: "global-class-name" size='whatever' }}>
  <div>
    <App />
  </div>
</IconContext.Provider>
```
