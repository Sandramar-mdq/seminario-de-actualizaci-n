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
        this.groupid1.id = 'ID';
        this.groupid1.innerText = 'ID'

        this.groupidInput = document.createElement('input');
        this.groupidInput.className = 'Inputid';
        this.groupidInput.type = 'text';
        this.groupidInput.name = 'id';
        this.groupidInput.id = 'id';
        this.groupidInput.placeholder = "ID del grupo"

        this.groupname1= document.createElement('h2');
        this.groupname1.id = 'Usuario';
        this.groupname1.innerText = 'Username'

        this.groupnameInput = document.createElement('input');
        this.groupnameInput.className = 'Inputgroup';
        this.groupnameInput.type = 'text';
        this.groupnameInput.name = 'groupname';
        this.groupnameInput.id = 'groupname';
        this.groupameInput.placeholder = "Nombre del grupo"

        this.descrip1 = document.createElement('h2');
        this.descrip1.id = 'descripcion';
        this.descrip1.innerText = 'descrip'

        this.descripInput = document.createElement('input');
        this.descripInput.className = 'Inputdescrip';
        this.descripInput.type = 'descrip';
        this.descripInput.name = 'descrip';
        this.descripInput.id = 'descrip';
        this.descripInput.placeholder = "Ingrese una descripcion del grupo"

        this.submitBtn = document.createElement('button');
        this.submitBtn.id = 'LoginBtn';
        this.submitBtn.type = 'submit';
        this.submitBtn.innerText = 'Login';

    }

    connectedCallback()
    {
        this.appendChild(this.formElement);

        this.formElement.appendChild(this.groupid1);
        this.formElement.appendChild(this.groupidInput);
        this.formElement.appendChild(this.groupname1);
        this.formElement.appendChild(this.groupnameInput);
        this.formElement.appendChild(this.descrip1);
        this.formElement.appendChild(this.descripInput);
        this.formElement.appendChild(this.submitBtn);
    }

}

customElements.define('x-auth', View)

export { View }