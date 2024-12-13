public class DMLLimitExample {

    public static void testDMLLimit() {
        // Try to execute more than 150 DML operations
        for (Integer i = 0; i < 151; i++) {
            Account acct = new Account(Name = 'Test Account ' + i);
            insert acct;
        }
    }
}