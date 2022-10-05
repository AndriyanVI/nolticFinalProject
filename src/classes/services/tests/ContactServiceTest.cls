@IsTest
private class ContactServiceTest {
    @IsTest
    static void sendEmailToNewContactsTest_positive() {
        Contact testContact = TestDataFactory.createContact();

        Test.startTest();
        insert testContact;
        System.assertEquals(1, Limits.getEmailInvocations());
        Test.stopTest();
    }
}
