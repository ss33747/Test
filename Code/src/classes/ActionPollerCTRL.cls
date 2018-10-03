public class ActionPollerCTRL {
    public integer count{get;set;}
    public DateTime tdt{get;set;}
    
    public ActionPollerCTRL(){
        count=0;
    }
    
    public void incrementCounter(){
        count++;
        tdt= system.now();
    }
}