trigger AccountTrigger2 on Account (before delete) {
    List<Account> oldAccounts= trigger.old;
    for(Account ac: oldAccounts){
        if(ac.Rating=='Hot'){
            //show error message
            ac.addError('You cannot delete this Account.');
        }
    }
}