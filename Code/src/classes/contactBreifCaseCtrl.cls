public class contactBreifCaseCtrl {

    public string selectedCountry {get; set;}
    public string selectedState {get; set;}
    public string selectedCity {get; set;} 
    public contact con {get; set;} 
    public list<contact> conList {get;set;}
    public list<SelectOption> countryList {get;set;}
    public list<selectOption> stateList {get;set;}
    public list<selectoption> cityList {get;set;}
    public contactBreifCaseCtrl(ApexPages.StandardController controller) {      
        con = (contact)controller.getRecord();
        selectedCountry = '--None--';
        selectedState = '--None--';
        selectedCity = '--None--';
        conList = [select name, id, (select id, CaseNumber, Subject, CreatedDate, Status from cases), (select id, name, stagename, Amount, closedate from opportunities), 
                    AccountID, Email, Department, ownerID, MobilePhone,Phone, title, Country__c, State__c from contact where id =:con.id];
        System.debug('conList-->'+ conList);
        countryList = new list<SelectOption>();
        countryList.add(new SelectOption('None','--None--'));
        countryList.add(new SelectOption('US','US'));
        countryList.add(new SelectOption('SriLanka','SriLanka'));
        countryList.add(new selectoption('Pakisthan', 'Pakisthan'));
        
        stateList = new list<selectOption>();
        stateList.add(new selectOption('None','--None--'));
        stateList.add(new selectOption('AP','AP'));
        stateList.add(new selectOption('Telangana','Telangana'));
        
        cityList = new list<selectOption>();
        cityList.add(new selectOption('None','--None--'));
        cityList.add(new selectOption('Hyderabad','Hyderabad'));
        cityList.add(new selectOption('Bangalore','bangalore'));
        
        
    }
    
    public void selectedValues() {
        system.debug('---selectedCountry----' +selectedCountry)   ;
    }

}