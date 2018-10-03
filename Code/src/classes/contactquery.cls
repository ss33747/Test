public class contactquery{
    public List<Contact> cs{get; set;}
    public string setExcel{get;set;}
    public contactquery()
    {
    cs = new List<Contact>();
       for (Contact c : [Select id, Name from Contact])
       {       
           cs.add(c);
       }
    }
    
    public void downloadExcel() {
        if(setExcel == null) {
            setExcel = 'application/vnd.ms-excel#SalesForceExport.xls';
        }
    }
}