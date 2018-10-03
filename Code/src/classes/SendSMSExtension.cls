public class SendSMSExtension {
    public string message{get;set;}
    Contact con;
    
    public SendSMSExtension(ApexPages.StandardController controller) {
        con = (Contact)controller.getRecord();
    }
    
    public void sendSMS(){
        Http htp = new Http();
        
        String endpoint ='https://api.textlocal.in/send?apiKey=8d9zFIkw8gc-veBGkrAyklHhVxgol7nDvlp0YRKmrB&message='+message+'&numbers='+con.MobilePhone;
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        
        HttpResponse res = new HttpResponse();
        res = htp.send(req);
        if(res.getStatusCode()==200){
            ResponseWrapper respWrap = (ResponseWrapper)JSON.deserialize(res.getBody(),ResponseWrapper.class);
            if(respWrap.status=='success'){
                ApexPages.Message msg = new ApexPages.Message(apexpages.severity.confirm,'Message Delivered, remaining balance :'+respWrap.balance);
                ApexPages.addMessage(msg);
            }else{
                ApexPages.Message msg = new ApexPages.Message(apexpages.severity.Error,'Message not Delivered, remaining balance :'+respWrap.balance);
                ApexPages.addMessage(msg);
            }
        }else{
            ApexPages.Message msg = new ApexPages.Message(apexpages.severity.Error,'Message not delivered with error:'+res.getBody());
            ApexPages.addMessage(msg);
        }
    }
    
    public class ResponseWrapper{
        public String status{get;set;}
        public Integer balance{get;set;} 
    }

}