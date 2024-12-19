public class abc {
    public String regionValue {get;set;}    
    public List<SelectOption> regionOptions {get;set;}
    public List<Opportunity> filteredOpportunities {get;set;}
    
    public abc(ApexPages.StandardController controller) {
        regionOptions = new List<SelectOption>();
        regionOptions.add(new SelectOption('Manufacturing','Manufacturing'));
        regionOptions.add(new SelectOption('Medical','Medical'));
    }
    
    public void updateFilteredOpportunities() {
        filteredOpportunities = [SELECT id,name FROM Opportunity WHERE Account.Industry = :regionValue];
    }

}