@isTest
public class SOQLLimitExampleTest {

    @isTest
    public static void testSOQLLimit() {
        // Create some test data (Accounts)
        List<Account> testAccounts = new List<Account>();
        for (Integer i = 0; i < 200; i++) {
            testAccounts.add(new Account(Name = 'Test Account ' + i));
        }
        insert testAccounts;  // Insert the test Accounts

        
        try {
            SOQLLimitExample.testSOQLLimit();
            // If no exception was thrown, we want the test to fail
            System.assert(false, 'Expected System.LimitException due to exceeding SOQL queries limit.');
        } catch (System.LimitException e) {
            // If the exception is caught, the test is successful
            System.debug('Successfully caught System.LimitException: ' + e.getMessage());
        }

           }
}