class View extends HTMLElement
{
    constructor(model)
    {
        super();
        this.innerModel = model;

        this.formElement = document.createElement('form');
        this.formElement.id = 'createContainer';
        this.formElement.method = 'post';

        this.userid1= document.createElement('h2');
        this.userid1.id = 'ID';
        this.userid1.innerText = 'ID Usuario';

        this.useridInput = document.createElement('input');
        this.useridInput.className = 'Inputid';
        this.useridInput.type = 'text';
        this.useridInput.name = 'id';
        this.useridInput.id = 'id';
        this.useridInput.placeholder = "ID de Usuario"

        this.username1= document.createElement('h2');
        this.username1.id = 'Username';
        this.username1.innerText = ' Nombre de usuario'

        this.usernameInput = document.createElement('input');
        this.usernameInput.className = 'Inputuser';
        this.usernameInput.type = 'text';
        this.usernameInput.name = 'username';
        this.usernameInput.id = 'username';
        this.usernameInput.placeholder = "Nombre de usuario"

        this.password1 = document.createElement('h2');
        this.password1.id = 'Password' ;
        this.password1.innerText = 'Contraseña';

        this.passwordInput = document.createElement('input');
        this.passwordInput.className = 'Inputpass';
        this.passwordInput.type = 'password';
        this.passwordInput.name = 'password';
        this.passwordInput.id = 'password';
        this.passwordInput.placeholder = "Ingrese su contraseña"

        this.submitBtn = document.createElement('button');
        this.submitBtn.id = 'LoginBtn';
        this.submitBtn.type = 'submit';
        this.submitBtn.innerText = 'Crear';

    }

    connectedCallback()
    {
        this.appendChild(this.formElement);

        this.formElement.appendChild(this.username1);
        this.formElement.appendChild(this.usernameInput);
        this.formElement.appendChild(this.password1);
        this.formElement.appendChild(this.passwordInput);
        this.formElement.appendChild(this.submitBtn);
    }

}

customElements.define('x-auth', View)

export { View }