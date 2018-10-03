public class repeatEx {

    public List<Account> acc{get;set;}
    public repeatEx(ApexPages.StandardController controller) {        
        
        Account ac = (Account)controller.getRecord();
        System.debug('Account record --->'+ac);
        ID id = (ID)controller.getID();
        System.debug('Account id is --->' + id);
        acc= [select id, name, rating, phone, AccountNumber, (select id, Accountid, Email, firstname, lastname from Contacts) from Account where rating=: 'Hot'];
        system.debug('Account with contacts information is-->' + acc);
    }
    
    public PageReference conRecord() {
        System.debug('here');
    
     return null;
    }

}