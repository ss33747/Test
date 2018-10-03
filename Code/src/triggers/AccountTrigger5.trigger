trigger AccountTrigger5 on Account (after update) {
    Map<Id,Account> oldAcMap = trigger.oldMap;
    Map<Id,Account> accsToProcess = new Map<Id,Account>();
    List<Contact> consToUpd = new List<Contact>();
    
    for(Account ac:trigger.new){
        Account oldAcc = oldAcMap.get(ac.id);
        if(ac.phone != oldAcc.phone){
            accsToProcess.put(ac.id,ac);
        }
    } 

    for(Contact con:[Select id,phone,AccountId from COntact where AccountId IN:accsToProcess.keySet()]){
        Account acc = accsToProcess.get(con.AccountId);
        con.phone = acc.phone;
        
        //update con;
        consToUpd.add(con);
    }
    Update consToUpd;
}
/***
Below trigger is not bulkified , it won't work for bulk records

****/

/*trigger AccountTrigger5 on Account (after update) {
    List<Account> accs = trigger.new;
    Map<Id,Account> oldAcMap = trigger.oldMap;
    
    system.debug('trigger fired..');
    for(Account ac:accs){
        Account oldAcc = oldAcMap.get(ac.id);
        if(ac.phone != oldAcc.phone){
            List<Contact> cons = [Select id,name,phone from Contact where AccountId=:ac.id];
            for(Contact con:cons){
                con.phone=ac.phone;
                update con;
                system.debug('Contact updated..');
                
            }
        }
    }
    
}*/