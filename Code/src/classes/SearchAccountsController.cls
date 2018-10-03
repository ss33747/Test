public class SearchAccountsController {
    public Account acc{get;set;}
    public List<Account> accs{get;set;}
    
    public SearchAccountsController(){
        acc = new Account();
    }
    
    public void fetchAccounts(){
         accs = [select id,name,rating from Account where Rating=:acc.rating];
    }
}