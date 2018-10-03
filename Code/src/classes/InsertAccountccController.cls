public class InsertAccountccController {
    public Account acc{get;set;}
    
    public InsertAccountccController(){
        acc = new Account();
    }
    
    public PageReference insertAccount(){
        try{
            insert acc;
            PageReference pg = new PageReference('/'+acc.id);
            pg.setRedirect(true);
            
            return pg;
        }catch(Exception ex){
            //push or add messages to page
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.error,'Record Creatin failed. '+ex.getMessage());
            ApexPages.addMessage(msg);
            
            return null;
        }
        
    }
    
}