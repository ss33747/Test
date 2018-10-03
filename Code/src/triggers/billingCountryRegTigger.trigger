trigger billingCountryRegTigger on Account (before insert, before update) {
    list<Account> acList = new list<Account>();
    acList=trigger.new;
    for(Account acc: acList) {
        if(acc.billingCountry == null) {
            System.debug('Hello trigger');
            System.debug('acc.billingCountry==' +acc.billingCountry);
            acc.billingCountry.addError('You must enter Billing Country in order to save Account record');
        }
    }

}