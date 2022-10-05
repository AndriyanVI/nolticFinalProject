@IsTest
private class OrderControllerTest {
    @IsTest
    static void getUsersByOrderIdTest_positive() {
        Account someAcc = TestDataFactory.createAccount();
        insert someAcc;
        Order testOrder = TestDataFactory.createOrder(someAcc.Id);
        insert testOrder;

        List<User> users = OrderController.getUsersByOrderId(testOrder.Id);
        System.assert(users != null);
    }
}