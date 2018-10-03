@isTest
private class TestRestCallout1Controller {
    private static testMethod void unitTest(){
        Test.setMock(HttpCalloutMock.class,new TestMockRestCallout1Controller());
        
        RestCallout1Controller  ob = new RestCallout1Controller();
        ob.makeCallout();
    }
}