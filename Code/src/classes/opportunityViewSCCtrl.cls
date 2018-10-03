public class opportunityViewSCCtrl {

    public string opptyid;
    public boolean isChecked {get;set;}
    public opportunity opp {get; set;}
    public list<opportunity> opptyLineItem {get;set;}
    public opportunityViewSCCtrl(ApexPages.StandardController controller) {
        opp = new opportunity();
       opptyLineItem = new list<opportunity>();
        opptyid = ApexPages.currentPage().getParameters().get('id');
        System.debug('opptyid -->' + opptyid );
        opp = [select id, name, stagename, CloseDate, Probability, ExpectedRevenue, Amount, AccountID, Account.Name, Account.rating, ownerID from opportunity where id=:opptyid];
        isChecked = false;
    }
    
    public void validation() {
        try {
            System.debug('Amhere isChecked  ---> ' + isChecked );
            //isChecked = true;
            System.debug('Amhere ---> ' + opptyid );
            opptyLineItem = [select id , name, AccountID, (select id, Quantity, ListPrice, UnitPrice, TotalPrice,ProductCode, name from opportunitylineitems) from opportunity 
                                           where id =: opptyid ];
        } Catch(Exception e) {
        }
      }  
        public pagereference AddressDetails() {
        try {
            System.debug('Am here-->');
            opp.id = opptyid ;
            update opp ;
            pagereference pg = new pagereference('/'+'006/o');
            pg.setRedirect(true);
            return pg;
        } Catch(Exception e) {
            return null;
        }
    }

}