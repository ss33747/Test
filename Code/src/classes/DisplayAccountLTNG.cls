public class DisplayAccountLTNG{
    @AuraEnabled
    public static Account fetchAccount(){
        return [Select id,name,phone,rating from Account limit 1];
    }
    
    @AuraEnabled
    public static List<Account> fetchAccounts(){
        return [Select id,name,phone,rating from Account];
    }
}