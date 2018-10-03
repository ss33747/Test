@RestResource(urlMapping='/AccountService/*')
global class AccountRestWebservice{
   @HttpGet
   //fetch accounts based on rating
   global static List<Account> fetchAcccount(){
        //Read endpoint url parameters
        RestRequest req = RestContext.Request;
        String rt = req.params.get('Rating');
		system.debug('Hello!!!!');
        
        
        List<Account> acs = [select id,name,rating,AnnualRevenue from Account where Rating=:rt];
        return acs;
   }
   
   @HttpPost
   global static Account createAccount(string name,string phone,string rating,Double annaulRevenue){
       Account ac = new Account();
       ac.Name=name;
       ac.Phone=phone;
       ac.Rating=rating;
       ac.AnnualRevenue=annaulRevenue;
       
       insert ac;
       return ac;
   }
}