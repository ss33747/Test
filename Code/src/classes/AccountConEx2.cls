public class AccountConEx2 {

    public Account ac{get;set;}
    public list<SelectOption> conType{get;set;}
    public Id conID{get;set;}
    public boolean selected{get;set;}
    public Id conIDSub{get;set;}
    public string ratValue{get;set;}
    public boolean disList{get;set;}
    public string selectedChkB{get;set;}

    
    public AccountConEx2(ApexPages.StandardController controller) {
        Account acc = (Account) controller.getRecord();
        /*conType = new list<SelectOption>();
        conType.add(new SelectOption('--Select--', '--Select--'));
        conType.add(new SelectOption('New Contact', 'New'));
        conType.add(new SelectOption('Old Contact', 'Old'));  */
        ac=[select id, rating, phone, name, fax, annualrevenue, AccountNumber, DunsNumber, (select id, AccountID,name, phone, email,fax, MailingAddress, lastname from contacts)   from Account where id=:acc.id];
        selected = false;
        //disList = false;
    }
    
    public void getSelectedRecord() {
    
        System.debug('--Get Selected Record--');
        String str = String.valueOf(conID);

        conID = ApexPages.currentPage().getParameters().get('conID');
        System.debug('--Get Selected Record--' + conID );
        System.debug('--Assigned Record--' + conIDSub);
        selected = true;

    }
    
    public pagereference submitContact() {
        conID = ApexPages.currentPage().getParameters().get('conID');
        System.debug('--deepthi--' + conIDSub);
        return null;
    }
    
    public void ratingChange() {    
        system.debug('---ratValue--'+ ratValue);
        disList = true;
        system.debug('---disList --'+ disList );
        
        
    }
    
    public void setChkBox() {
    
        system.debug('am here chkbox');
        
    }
    
}