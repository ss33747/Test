public with sharing  class DisplayAllAccountsCCController {
     public List<Account> accs{get;set;}
    
    public DisplayAllAccountsCCController(){
       
    }
    
    public void doSome(){
        accs = [select id,name,phone,rating,annualRevenue from Account];
        Account ac = new Account();
           ac.name='Test';
           insert ac;
    }
}