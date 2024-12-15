@isTest
public class A50Test {
    @isTest
    static void testCreateAccount() {
        A50 obj = new A50();
        Account acc = obj.createAccount('Test Account');
        System.assertEquals('Test Account', acc.Name);
    }
}