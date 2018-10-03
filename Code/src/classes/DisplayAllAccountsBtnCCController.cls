public class DisplayAllAccountsBtnCCController {
    
    public List<Account> accs{get;set;}
    
    public void fetchAccounts(){
         accs = [Select id,name,rating,Phone,AnnualRevenue from Account];
    }
}