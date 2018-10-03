public class JSONParserDemo{
    public JSONParserDemo(){
        String jsonStr = '{'+
        '"Name":"Karthik",'+
        '"Email":"karthik@gmail.com",'+
        '"Mobile":"9689896896"'+
        '}';
        JSONParser parser = JSON.createParser(jsonStr);
        while(parser.nextToken()!= null){
            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME)){
                system.debug('Token Name:'+parser.getText());
                parser.nextToken();
                system.debug('Value::'+parser.getText());
            }
        }
    }

}