import {LightningElement, wire} from 'lwc';
import Id from '@salesforce/user/Id';
import {getRecord} from 'lightning/uiRecordApi';
import UserName from '@salesforce/schema/User.Name';
import userEmail from '@salesforce/schema/User.Email';
import userIsActive from '@salesforce/schema/User.IsActive';
import userAlias from '@salesforce/schema/User.Alias';
import userPhone from '@salesforce/schema/User.Phone';
import userCity from '@salesforce/schema/User.City';


export default class CurrentUserInfo extends LightningElement {
    nameField = UserName;
    emailField = userEmail;
    isActiveField = userIsActive;
    aliasField = userAlias;
    phoneField = userPhone;
    cityField = userCity;
    editInfo = false;
    userId = Id;
    currentUserName;
    currentUserEmailId;
    currentIsActive;
    currentUserAlias;
    currentUserPhone;
    currentUserCity;
    error;


    @wire(getRecord, {recordId: Id, fields: [UserName, userEmail, userIsActive, userAlias, userPhone, userCity]})
    userDetails({error, data}) {
        if (data) {
            this.currentUserName = data.fields.Name.value;
            this.currentUserEmailId = data.fields.Email.value;
            this.currentUserPhone = data.fields.Phone.value
            this.currentIsActive = data.fields.IsActive.value;
            this.currentUserAlias = data.fields.Alias.value;
            this.currentUserCity = data.fields.City.value;
        } else if (error) {
            this.error = error;
        }
    }

    handleChange() {
        this.editInfo = !this.editInfo;
    }

}

