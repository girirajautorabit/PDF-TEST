@isTest
public class MyApexClass1Test {
    @isTest
    static void testCreateAccount() {
        // Creating an instance of MyApexClass
        MyApexClass1 myClass = new MyApexClass1();

        // Testing the createAccount method
        myClass.createAccount('Test Account');
        
        // Verifying the account creation
        Account acc = [SELECT Id, Name FROM Account WHERE Name = 'Test Account' LIMIT 1];
        System.assertNotEquals(null, acc.Id);
        System.assertEquals('Test Account', acc.Name);
    }

    // Intentionally not covering the updateAccount and deleteAccount methods to generate warnings
}