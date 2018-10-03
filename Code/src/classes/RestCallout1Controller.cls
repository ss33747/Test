public class RestCallout1Controller {
    public String response{get;set;}
    public MyWrapper responseBdy{get;set;} 
    
    public void makeCallout(){
        //Create a instance to Http
        Http htp = new Http();
        
        //Create a instance to HttpRequest and prepare the request params
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://jsonplaceholder.typicode.com/posts/1');
        req.setMethod('GET');
        req.setTimeout(2000);//proivde a value in milliseconds
        
        //Send request and read the response
        HttpResponse res = new HttpResponse();
        res = htp.send(req);
        /*if(!Test.isRunningTest()){
            res = htp.send(req);
        }else{
            res.setStatusCode(200);
            res.setBody('{"userId": 1,"id": 1,"title":"Test","body": "Test"}');
        }*/
        response = res.getBody();
        
        responseBdy = (MyWrapper)JSON.deserialize(res.getBody(),MyWrapper.class);
        
        
    }
    
    public class MyWrapper{
        public integer  userId1{get;set;}
        public integer id{get;set;}
        public string title{get;set;}
        public string body{get;set;}
    }
}