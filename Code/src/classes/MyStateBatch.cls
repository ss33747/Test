public class MyStateBatch implements Database.batchable<sObject>,Database.stateFul{
    public integer count=0;
    public Database.QueryLocator start(Database.batchableContext bc){
        return Database.getQueryLocator([Select id,name from Account]);
    }
    
    public void execute(Database.batchableContext bc,List<Account> scope){
        count++;
    }
    
    public void finish(Database.batchableContext bc){
        system.debug('Total Count/Batches is:'+count);
    }
}