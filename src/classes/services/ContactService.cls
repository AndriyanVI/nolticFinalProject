public with sharing class ContactService {
    public static void sendWelcomeEmailsToNewCustomers(List<Contact> contacts) {
        String[] addresses = new String[]{
        };
        for (Contact contact : contacts) {
            addresses.add(contact.Email);
        }
        Messaging.reserveSingleEmailCapacity(10);
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] ccAddresses = new String[]{
                'vysotskiy.andriyan.w@gmail.com'
        };
        mail.setToAddresses(addresses);
        mail.setCcAddresses(ccAddresses);
        mail.setReplyTo('support@trace.com');
        mail.setSenderDisplayName('Trace Support');
        mail.setSubject('Welcome To TRACE Car Shop');
        mail.setPlainTextBody('Welcome to trace car shop you can checkout our propositions in our shop and test drive some cars. Contact our consultants to book test drive or to buy a car. We will do our best to find best solution to your needs. Your best car shop TRACE<3');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{
                mail
        });
    }
}