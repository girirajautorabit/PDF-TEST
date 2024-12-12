import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
        // slkdjf
        greeting = 'World';
        changeHandler(event) {
        this.greeting = event.target.value;
        }
}
