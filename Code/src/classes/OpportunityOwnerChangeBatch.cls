Public class OpportunityOwnerChangeBatch implements Database.batchable<sObject>{
    User updUser;
    public OpportunityOwnerChangeBatch(){
        updUser = [select id from User where name='Karthi SFDC' limit 1];
    }
    
    public Database.QueryLocator start(Database.batchableContext bc){
        User usr = [Select id from User where name ='Harsh Students' limit 1];
         
        return Database.getQueryLocator([Select id,name,OwnerId from Opportunity where OwnerId=:usr.id]);
    }
    public void execute(Database.batchableContext bc,List<Opportunity> scope){
        //write logic
        
        for(Opportunity op:scope){
            op.ownerId =updUser.id;
        }
        update scope;
    }
    public void finish(Database.batchableContext bc){
       
    }
}