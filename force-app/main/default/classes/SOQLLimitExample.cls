public class SOQLLimitExample {

    public static void testSOQLLimit() {
        List<Account> allAccounts = new List<Account>();
        
        // Loop to exceed SOQL query limit (100 queries per transaction)
        for (Integer i = 0; i < 101; i++) {
            // Try to execute more than 100 queries in a loop
            allAccounts.addAll([SELECT Id, Name FROM Account LIMIT 10]);
        }
        
        // No code beyond this will execute if the exception is triggered.
    }
}