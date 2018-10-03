public class opportunityInsertCrtl {

    public string opptyName {get; set;}
    public string opptyOwner {get; set;}
    public string AccountName {get; set;}
    public opportunity opp {get; set;}
    public string opptyCloseDate {get; set;}
    public string opptyExpectedRevenue {get; set;}
    public string opptyStage {get; set;}
    public string opptyProbability {get; set;}

    public opportunityInsertCrtl () {
    
        opp = [select id, name, owner.name, accountid, account.name, account.ownerID, account.rating,account.Primary__c, (select id, name, pricebookEntry.Product2.Family, pricebookEntry.Product2ID from OpportunityLineItems),
        CloseDate, ExpectedRevenue, StageName, Probability, Amount from opportunity where id = '0066A000002m92X'];
        SYSTEM.DEBUG('Am here----' + opp);
        opptyProbability = String.valueof(opp.Probability);
        SYSTEM.DEBUG('opptyProbability ----' + opptyProbability );
        }
    
    public PageReference SubmitOppty() {
        opp = new opportunity();
        opp.Probability = decimal.Valueof(opptyProbability) ;
        opp.id = '0066A000002m92X';
        update opp;
        SYSTEM.DEBUG('Am here');
        PageReference pr = new PageReference('https://na50.salesforce.com/0066A000002m92X'); // google is blocked here
        pr.setRedirect(true);
        return pr;
     
    }

}