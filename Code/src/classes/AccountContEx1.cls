public class AccountContEx1 {

    public Account ac{get;set;}
    public String conFirstName{get;set;}
    public String conLastName{get;set;}
    public String conPhone{get;set;}
    public String conEmail{get;set;}
    public String conBillingAdd{get;set;}
    public String conShippingAdd{get;set;}
   
    
    public AccountContEx1(ApexPages.StandardController controller) {
    
        Account acc = (Account)controller.getRecord();
        System.debug('---acc id---' + acc.id);
        ac = [select id, name, phone,fax,AccountNumber, owner.name, DunsNumber, rating, ParentID, AccountSource from Account where id =:acc.id];
        System.debug('---Account information---' + ac);

    }

    public PageReference ContactAccSubmission() {
    
        system.debug('--Account submission' + conFirstName + '--' + conLastName + '--ac.id--' + ac.id);
        Contact con = new contact();
        con.lastname = conLastName;
        con.Accountid = ac.id;
        upsert con;
        PageReference pageRef = new PageReference('/' + con.id);
        return pageRef;
    }
}