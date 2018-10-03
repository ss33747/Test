trigger faxWithPhone on Account (before insert, before update) {
    list<Account> accList = new list<Account>();
    accList=Trigger.new;
    for(Account ac : accList) {
        ac.fax = ac.phone;
    }

}