trigger AccountTrigger1 on Account (before insert) {
    List<Account> newAccounts = trigger.new;
    for(Account ac:newAccounts){
        if(ac.fax==null){
            ac.Fax= ac.Phone;
        }
    }
}