@isTest public with sharing class ECFMGCertificateDetailsTest{
@isTest static void createRegenAssetTest(){
         Account acc = new Account();
         acc.Name = 'Test Account';
         acc.BillingCountry = 'United States';
         acc.BillingState = 'California'; //test1234
         
         acc.BillingCountry = 'United States';  //test8761 
         acc.BillingPostalCode = '123456';
         insert acc;
         System.assert(acc.Id != null, 'Account creation failed');
      }   
         }