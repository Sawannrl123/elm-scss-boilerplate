import './main.css';
import { Elm } from './elm/Main.elm';
import * as images from './images'
import * as serviceWorker from './serviceWorker';
import {common, toggleNavMenu, activeMenu} from './js'

// console.log('%c Sawan', 'color: purple;')
// console.log({images})

var app = Elm.Main.init({
  node: document.getElementById('root'),
  flags: { images }
});

app.ports.common.subscribe(() => common(), activeMenu());
app.ports.handleNav.subscribe(() => toggleNavMenu());

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
