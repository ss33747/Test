public with sharing class accountLogin {

    public accountLogin() {

    }


    public accountLogin(ApexPages.StandardController controller) {

    }

        
        public String password { get; set; }
    public String username { get; set; }
    
    public PageReference registerUser() {
        PageReference newPage = new PageReference('https://mail.google.com/mail/u/0/#inbox');
        newPage.setRedirect(true);
        return newPage;
    
    }
    
}