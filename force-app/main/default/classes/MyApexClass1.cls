public class MyApexClass1 {
    // Method 1: Will be covered by test
    public void createAccount(String name) {
        Account acc = new Account(Name = name);
        insert acc;
    }

    // Method 2: Will not be covered by test
    public void updateAccount(Account acc) {
        if (acc != null) {
            update acc;
        }
    }

    // Method 3: Will not be covered by test
    public void deleteAccount(Id accountId) {
        Account acc = [SELECT Id FROM Account WHERE Id = :accountId LIMIT 1];
        delete acc;
    }
}