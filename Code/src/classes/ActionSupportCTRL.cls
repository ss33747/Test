public class ActionSupportCTRL {
    public Account acc{get;set;}
    public List<Account> accs{get;set;}
    
    public ActionSupportCTRL(){
        acc = new Account();
    }
    public void fetchData(){
        accs = [Select id,name,rating,annualRevenue from Account where rating=:acc.Rating];
    }
}