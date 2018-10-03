public class DisplayAccountSCExtension {
    public List<Contact> cons{get;set;}

    public DisplayAccountSCExtension(ApexPages.StandardController controller) {
        //Read Account id from URL and fetch assoicated contacts
        //Another option
        Account acc = (Account)controller.getRecord();
        String acId = acc.id;
        
         cons = [Select id,name,phone,Email from Contact where AccountId=:acId AND email!=null];
        //String acId = ApexPages.CurrentPage().geParameters().get('id');
    }
}