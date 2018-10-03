public class WrapperClassesCTRL {
    public list<MyWrapper> accRecords{get;set;}
    public List<Account> selectedAccounts{get;set;}
    
    public WrapperClassesCTRL(){
        accRecords = new List<MyWrapper>();
        for(Account ac:[select id,name,phone,AnnualRevenue from Account limit 10]){
            //Prepare single wrapper
            MyWrapper mw = new MyWrapper();
            mw.isSelect=false;
            mw.acc=ac;
            
            //adding single wrapper record to list
            accRecords.add(mw);
        }
    }
    
    public void processSelected(){
        selectedAccounts = new List<Account>();
        for(MyWrapper mw:accRecords){
            if(mw.isSelect==true){
                selectedAccounts.add(mw.acc);
            }
        }
    }
    
    
    public class MyWrapper{
        public boolean isSelect{get;set;}
        public Account acc{get;set;}
    }

}