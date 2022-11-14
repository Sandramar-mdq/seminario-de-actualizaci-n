import {View} from './View.js'
import {Model} from './Model.js'

function main()
{
    let model = new Model();
    let view = new View(model);

    document.body.appendChild(view);
    
}

window.addEventListener('load', main);