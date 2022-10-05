public with sharing class UserController {
    @AuraEnabled(Cacheable=true)
    public static List<User> getUsers() {
        return [SELECT Name, Phone, Email, IsActive, Username, Alias, City FROM User WHERE UserRoleId != NULL];
    }
}