trigger billingCountryREQ on Account (before insert) {
    list<Account> accList = new list<Account>();
    accList = trigger.new;
    for(Account ac: accList) {
        if(ac.billingCountry == null) {
            ac.billingCountry.addError('Billing Country is required for Account to be created');
        }
    }
}