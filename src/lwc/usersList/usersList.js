import {api, LightningElement, track, wire} from "lwc"
import getUsers from '@salesforce/apex/UserController.getUsers'

export default class UsersList extends LightningElement {
    @api recordId;
    @track userData;
    @track error;

    @wire (getUsers) wiredUser({data,error}){
        if (data) {
            this.userData = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.userData = undefined;
        }
    }
}