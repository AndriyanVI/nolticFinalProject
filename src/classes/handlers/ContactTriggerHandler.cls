public with sharing class ContactTriggerHandler {
    public static void handle(List<Contact> contacts, System.TriggerOperation triggerOperation) {
        switch on triggerOperation {
            when AFTER_INSERT {
                ContactService.sendWelcomeEmailsToNewCustomers(contacts);
            }
        }
    }
}