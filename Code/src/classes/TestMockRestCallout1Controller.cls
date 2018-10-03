public class TestMockRestCallout1Controller implements HttpCalloutMock{
    public HttpResponse respond(HttpRequest req){
        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        res.setBody('{"userId": 1,"id": 1,"title":"Test","body": "Test"}');
        return res;
    }
}