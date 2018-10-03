public class CountriesCTRL {
    public String res{get;set;}
    public List<string> countries_lst{get;set;}
    
    public CountriesCTRL(){
        countries_lst = new List<String>();
        
        wwwWebservicexNet.countrySoap ob = new wwwWebservicexNet.countrySoap();
        res = ob.GetCountries();
        system.debug('Result>>'+res);
        
        
        Dom.Document doc = new Dom.Document();
        doc.load(res);
        
        //Red Root Element
        Dom.XMLNode newDataSet = doc.getRootElement();
        
        List<Dom.XMLNode> allTables = newDataSet.getChildElements();
        for(Dom.XMLNode table:allTables){
            Dom.XMLNode nameElm = table.getChildElement('Name',null);
            String country = nameElm.getText();
            system.debug('Countr is:'+country);
            countries_lst.add(country);
        }
        
        
    }
}