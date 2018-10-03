@RestResource(urlMapping='/AccountTestService/*')
global class AccountRestWebserviceTest{
   @HttpGet
   //fetch accounts based on rating
   global static Account insertAcccount(){
        //Read endpoint url parameters
        RestRequest req = RestContext.Request;
        String name = req.params.get('name');
        String rating = req.params.get('rating');
        String phone = req.params.get('phone');

        
        Account ac = new Account();
        ac.Name=name;
        ac.Phone=phone;
        ac.Rating=rating;
        
        insert ac;
        
        return ac;
   }
   
   /*@HttpPost
   global static Account createAccount(string name,string phone,string rating,Double annaulRevenue){
       Account ac = new Account();
       ac.Name=name;
       ac.Phone=phone;
       ac.Rating=rating;
       ac.AnnualRevenue=annaulRevenue;
       
       insert ac;
       return ac;
   }*/
}