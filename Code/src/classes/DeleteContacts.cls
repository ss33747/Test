Public class DeleteContacts{
    @InvocableMethod(label='Get Contacts' description='Delete Contacts associated to account')
    Public static void deleteAccountContacts(List<Id> AccountIds){
        List<Contact> contacts =[SELECT Id FROM Contact WHERE AccountId=:AccountIds];
        delete contacts;
    }
}