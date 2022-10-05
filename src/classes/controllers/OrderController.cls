public with sharing class OrderController {
    @AuraEnabled(Cacheable=true)
    public static List<User> getUsersByOrderId(Id orderId) {
        return [
                SELECT Name, Username, Phone, Email, Alias, IsActive, City
                FROM User
                WHERE Id IN (
                    SELECT OwnerId
                    FROM Order
                    WHERE Id= :orderId
                )
        ];

    }
}