trigger Accounttrigger3 on Account (before delete) {
    //List<Account> accs = trigger.old;
    Map<Id,Account> oldMap = trigger.oldMap;
    for(Account ac:[Select id,name,(select id,name from Contacts) from Account where id IN:oldMap.keySet()]){
        if(ac.contacts!=null && ac.contacts.size()>0){
           //Pass record id to old map and get record
           Account acOld = oldMap.get(ac.id);
           acOld.addError('You cannot delete this Account, it is assoicated with some contacts'); 
        }
    }
}



/****
Below code is not bulkified, it won't work for bulk records
****/

/*trigger Accounttrigger3 on Account (before delete) {
    List<Account> accs = trigger.old;
    for(Account ac:accs){
        List<Contact> cons = [Select id,name from Contact where AccountId =:ac.id];
        if(cons!=null && cons.size()>0){
           ac.addError('You cannot delete this Account, it is assoicated with some contacts'); 
        }
        
    }
}*/