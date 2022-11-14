class View extends HTMLElement
{
    constructor(model)
    {
        super();
        this.innerModel = model;

        this.formElement = document.createElement('form');
        this.formElement.id = 'loginContainer';
        this.formElement.method = 'post';

        this.groupid1= document.createElement('h2');
        this.groupid1.id = 'IDdelete';
        this.groupid1.innerText = 'ID delete'

        this.groupidInput = document.createElement('input');
        this.groupidInput.className = 'Inputid';
        this.groupidInput.type = 'text';
        this.groupidInput.name = 'id';
        this.groupidInput.id = 'id';
        this.groupidInput.placeholder = "ID del grupo a eliminar"

        this.submitBtn = document.createElement('button');
        this.submitBtn.id = 'LoginBtn';
        this.submitBtn.type = 'submit';
        this.submitBtn.innerText = 'Login';

    }

    connectedCallback()
    {
        this.appendChild(this.formElement);

        this.formElement.appendChild(this.username1);
        this.formElement.appendChild(this.usernameInput);
        
    }

}

customElements.define('x-auth', View)

export { View }