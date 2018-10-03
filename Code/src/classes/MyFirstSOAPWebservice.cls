global class MyFirstSOAPWebservice{
    webservice static string doSome(){
        return 'Hello!! Welcome to Webservices';
    }
    
    webservice static string sendGreetings(string name){
        String grtngs = 'Hello!!!! '+name+'. Welcome to SOAP Webservcies';
        return grtngs;
    }
}