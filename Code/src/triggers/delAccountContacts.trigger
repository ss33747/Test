trigger delAccountContacts on Account (before delete) {
    Map<id,Account> mapAccounts = trigger.oldMap;
    for(Account ac : [select id, name, (select id, name from contacts) from Account where id in :mapAccounts.keySet()]) {
        if(ac.contacts!=null && ac.contacts.size()>0){ 
            Account Acc = mapAccounts.get(ac.id);
            Acc.addError('You Cannot delete an Account if Contact exists');
        }
    }

}