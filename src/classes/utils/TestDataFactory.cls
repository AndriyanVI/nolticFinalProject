@IsTest
public class TestDataFactory {
   public static Contact createContact() {
       return new Contact(LastName = 'test', Email = 'test@test.com');
   }

    public static Account createAccount() {
        return new Account(Name = 'testAcc');
    }

    public static Order createOrder(Id accId) {
        return  new Order(Status = 'draft', EffectiveDate = Date.newInstance(2022, 10, 2),	AccountId = accId);
    }
}