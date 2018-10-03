public class DisplayAccountCCController {
    public Account ac{get;set;}
    
    //Constructor
    public DisplayAccountCCController(){
        String aId = ApexPages.currentPage().getParameters().get('id');
        ac = [select id,name,phone,rating,annualRevenue,BillingStreet,BillingState,BillingPostalCode,BillingCountry from Account where id=:aId];
    }
}