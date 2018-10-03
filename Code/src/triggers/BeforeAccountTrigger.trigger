trigger BeforeAccountTrigger on Account (before insert, before update) {
    if(Trigger.isBefore)
    {
        set<id> AccountList = new set<id>();
        
        if(Trigger.IsInsert)
        {
            Contact cont = new Contact();
            cont.LastName = Trigger.new[0].name;
            System.debug('---1---' + cont.LastName);
            System.debug('---2---' + Trigger.new[0].name);
            System.debug('---2---' + Trigger.new[0].id);
            cont.FirstName = Trigger.new[0].name;
            insert cont;
        }
        else if(Trigger.IsUpdate)
        {
            for(Account acc: Trigger.new){
                AccountList.add(acc.name);
            }
            list<Account> acc = [select id, name from Account where id =:Trigger.new[0].id];
            System.debug('---Acc---' + acc);
            Contact cont = new Contact();
            cont.LastName = '(Updated)';
            cont.FirstName = Trigger.new[0].name+ 'Updated';
            System.debug('---2---' + Trigger.new[0].id);
            insert cont;
        }
    }
    
}