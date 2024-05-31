@isTest //Define Annotation of test class
public class ContactInsert
{
 public static testmethod void testdeletion()
 {
//Store any string name
  String myname = 'SalesforceKid';
  Account acc = new Account(name = 'TestTriggerAccount');
    insert acc;
 //Pass that string name as a Input to Account 
  Contact a = new Contact(lastname = myname, AccountId = acc.Id);
//Pass lastname to contact as a string 
  Contact con = new Contact(lastname = 'Salesforcekid', AccountId = acc.Id); 
  insert a;
//  insert con;
  
//Find out the contact with same name as Account string myname
   List<Contact> cList = [SELECT Id, lastname FROM Contact WHERE lastname=:myname];

//Check whether the value of contact and account is similar
   System.assertEquals(1, cList.size());
   
 }
}