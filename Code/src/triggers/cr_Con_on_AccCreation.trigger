trigger cr_Con_on_AccCreation on Account (After insert) {
    list<Account> accList = Trigger.new;
    list<Contact> conList = new list<Contact>();
    for(Account ac: accList) {
        for(integer i=0; i<5; i++) { 
            Contact con = new Contact(LastName = ac.name, accountID = ac.id);
            conList.add(con);
        } 
    }
    insert conList;
}