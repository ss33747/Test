public class AccountSCCtrl {

    public String rating {get; set;}
    public list<account> accs {get ; set;}
    public String shipTo {get; set;}
    public String billTo {get; set;}
    public String billToAdd {get; set;}
    public string shioToAdd {get; set;}
    
    public AccountSCCtrl(ApexPages.StandardController controller) {
        accs = [select id, name, rating from Account where id = '0016A0000031BRy'];   
        rating = accs[0].rating; 
        System.debug('rating --' +rating );
    }
    
    public void process() {
        System.debug('Hi Am heere' + rating );
        System.debug('shipto-->' + shipTo + 'BillTo--->' + billTo + 'ShipToAdd-->' + shioToAdd  + 'billToAdd-->' + billToAdd);
        
    }
    

}