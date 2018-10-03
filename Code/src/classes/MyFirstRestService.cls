@RestResource(urlMapping='/SamleRestService/*')
global class MyFirstRestService {
    @HttpGet
   global static string sayHello(){
        return 'Hello!!! Welcome to Rest Webservices..';
   }
}