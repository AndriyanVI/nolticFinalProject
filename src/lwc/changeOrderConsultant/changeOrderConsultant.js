import {api, LightningElement, wire, track} from 'lwc';
import getUsersByOrderId from '@salesforce/apex/OrderController.getUsersByOrderId'

export default class WireGetRelatedListRecords extends LightningElement {
    @api recordId;
    @track userData;
    @track error;

    @wire (getUsersByOrderId, {orderId: '$recordId' }) wiredUser({data,error}){
        if (data) {
            this.userData = data;
            this.error = undefined;
            console.log(`Data returned: + ${this.userData.Name}`);
        } else if (error) {
            this.error = error;
            this.userData = undefined;
        }
    }
}
