public class OpportunityOwnerChangeBatchSchedular implements Schedulable{
    public void execute(schedulableContext sc){
        //here write code.
        OpportunityOwnerChangeBatch ob = new OpportunityOwnerChangeBatch();
        Database.executeBatch(ob);
    }
}