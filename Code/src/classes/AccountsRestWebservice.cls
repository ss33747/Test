@RestResource(urlMapping='/AccountsService/*')
global class AccountsRestWebservice{
   //fetch all accounts
    @HttpGet
    global static List<Account> fetchAccounts(){
        List<Account> accs = [select id,name from Account];
        return accs;
    }
}