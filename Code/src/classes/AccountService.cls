global class AccountService{
    webservice static AccountServiceResponse createAccount(AccountServiceRequest reqData){
        
        AccountServiceResponse resp = new AccountServiceResponse();
        
        
        try{
            //Create Account
            Account ac = new Account();
            ac.Name=reqData.aName;
            ac.Phone=reqData.aphone;
            ac.rating=reqData.aRating;
            ac.AnnualRevenue = reqData.annualRevenue;
            ac.BillingCountry = reqData.bCountry;
            
            insert ac;
            
            resp.response_code=1;
            resp.response_msg='Record successfully Created';
            resp.accId=ac.id;
            
        }catch(Exception ex){
            resp.response_code=2;
            resp.response_msg='Record Creation failed, with error :'+ex.getMessage();
        }
        
        return resp;
        
    }
    
    webservice static AccountServiceResponse updateAccount(String accId,AccountServiceRequest updReqData){
        //query account record
        AccountServiceResponse resp = new AccountServiceResponse();
        if(accId!=null && accId!=''){
            try{
                Account acc = [Select id,name,rating,phone,AnnualRevenue,BillingCountry from Account where id=:accId];
                system.debug();
                acc.rating=updReqData.aRating;
                acc.phone=updReqData.aphone;
                acc.AnnualRevenue=updReqData.annualRevenue;
                acc.BillingCountry=updReqData.bCountry;
                
                update acc;
                resp.response_code=5;
                resp.response_msg='Record Updated Successfully.';
                
            }catch(Exception ex){
                resp.response_code=4;
                resp.response_msg='Record Update failed.'+ex.getMessage();
            }
        }else{
            resp.response_code=3;
            resp.response_msg='Please provide Account id to Update.';
        }
        return resp;
    }
    
    webservice static List<AccountServiceSearchResponse> searchAccounts(string searchKey){
        List<AccountServiceSearchResponse> matchedAccounts = new List<AccountServiceSearchResponse>();
        if(searchKey!=null && searchKey!=''){
            searchKey = searchKey+'%';
            
            for(Account ac:[Select id,name,phone,Rating,AnnualRevenue from Account where name like :searchKey]){
                AccountServiceSearchResponse ob = new AccountServiceSearchResponse();
                ob.name=ac.Name;
                ob.phone=ac.phone;
                ob.rating=ac.Rating;
                ob.AnnualRevenue=ac.AnnualRevenue;
                
                matchedAccounts.add(ob);
            }
        }
        return matchedAccounts;
    }
    
    
    
    global class AccountServiceRequest{
        webservice string aName;
        webservice string aphone;
        webservice string aRating;
        webservice double annualRevenue;
        webservice string bCountry;
        
    }
    
    global class AccountServiceResponse{
        webservice integer response_code;
        webservice string response_msg;
        webservice string accId;
    }
    global class AccountServiceSearchResponse{
        webservice string name;
        webservice string phone;
        webservice string rating;
        webservice double AnnualRevenue;
    }
}