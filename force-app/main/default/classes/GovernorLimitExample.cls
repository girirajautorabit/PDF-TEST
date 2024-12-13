public class GovernorLimitExample {
    
    public static void testGovernorLimit() {
        // Create a list to hold 10,000 dummy records
        List<Account> accountsToInsert = new List<Account>();
        
        for (Integer i = 0; i < 10000; i++) {
            accountsToInsert.add(new Account(Name = 'Account ' + i));
        }
        
        // Trying to insert more than 10,000 records will hit the DML row limit
        try {
            insert accountsToInsert; // This will exceed the row limit
        } catch (System.DmlException e) {
            System.debug('Error: ' + e.getMessage());
        }
    }
}