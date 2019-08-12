import { LightningElement, track } from 'lwc';
import assignCase from '@salesforce/apex/CaseController.assignCase';

export default class CaseAssigner extends LightningElement {
    @track cases;
    @track error;

    handleAssign() {
        assignCase()
        .then(result => {
            this.cases = result;
            this.error = undefined;
        })
        .catch(error => {
            this.error = error;
            this.cases = undefined;
        });
    }
}