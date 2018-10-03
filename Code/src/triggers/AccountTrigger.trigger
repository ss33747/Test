trigger AccountTrigger on Account (before insert,before update) {
    List<Account> newAccounts = trigger.new;
    for(Account ac:newAccounts){
        if(ac.BillingCountry==null){
            //show the error message
            //ac.addError('Billing country is Required');//error message at record level
            ac.BillingCountry.addError('Billing country is Required'); //error message at field level
        }
    }
}