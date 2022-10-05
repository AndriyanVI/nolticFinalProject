@IsTest
private class UserControllerTest {
    @IsTest
    static void getUsersTest_positive() {
        List <User> users = UserController.getUsers();
        System.assert(users != null);
    }
}