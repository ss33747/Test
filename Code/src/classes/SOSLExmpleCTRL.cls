public class SOSLExmpleCTRL {
    public string searchKey{get;set;}
    public List<Account> accounts{get;set;}
    public List<Contact> contacts{get;set;}
    public List<Lead> leads{get;set;}
    public List<Opportunity> opportunities{get;set;}
    
    public void fetchData(){
        List<List<sObject>> machRecords = [FIND :searchKey IN ALL FIELDS returning Account(Name,Rating,AnnualRevenue),Contact(Name,Email),Lead(Name,Email),Opportunity(Name,StageName,Closedate)];
        accounts = machRecords[0];
        contacts =  machRecords[1];
        leads= machRecords[2];
        opportunities=  machRecords[3];
    }
   
}