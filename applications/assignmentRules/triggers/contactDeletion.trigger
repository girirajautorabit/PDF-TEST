trigger contactDeletion on Contact(before insert)
{
//define list to store all the account names
 List<String> mynames = new List<String>();
//bulkifying for every new Account record 
  for(Contact a : Trigger.New)
 {
//Add all account names in the list 
  mynames.add(a.LastName);
 }
//Query to get all the list of contacts where Name is like Name inside mynames
List<Contact> mycontacts = [SELECT Id FROM Contact WHERE
                                                LastName IN : mynames];
//delete all the mycontacts list from salesforce
delete myContacts;
}