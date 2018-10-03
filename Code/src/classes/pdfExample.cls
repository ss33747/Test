public class pdfExample {

    public boolean setPdf{get;set;}
    public string render{get;set;}
    public Account ac{get;set;}
        
    public pdfExample(ApexPages.StandardController controller) {
        setPdf = true;
        ac = [select id, name, rating, phone, fax, accountnumber, billingstate, billingcity, billingcountry, (select id, firstname, lastname, email from contacts) from Account where rating =: 'Hot' limit 1];
    
    }

    public void generatePDF() {
        if(render == null) {
            render = 'pdf';
        }    
    }
}