Public class AccountsUpdateBatch implements Database.batchable<sObject>{
    public Database.QueryLocator start(Database.batchableContext bc){
        return Database.getQueryLocator([Select id,name,Description from Account]);
    }
    public void execute(Database.batchableContext bc,List<Account> scope){
        //write logic
        for(Account ac:scope){
            ac.Description='Hello welcome to Batch Apex';
        }
        update scope;
    }
    public void finish(Database.batchableContext bc){
        
        AsyncApexJob async = [Select Id,Status,ExtendedStatus,NumberOfErrors,JobItemsProcessed,TotalJobItems from AsyncApexJob where Id =:BC.getJobId()];
        
        
        //send email notification with batches details
        // First, reserve email capacity for the current Apex transaction to ensure
        // that we won't exceed our daily email limits when sending email after
        // the current transaction is committed.
        
        // Processes and actions involved in the Apex transaction occur next,
        // which conclude with sending a single email.

        // Now create a new single email message object
        // that will send out a single email to the addresses in the To, CC & BCC list.
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

        // Strings to hold the email addresses to which you are sending the email.
        String[] toAddresses = new String[] {'adapakarthi@gmail.com'}; 
        //String[] ccAddresses = new String[] {'adapakarthi@gmail.com'};
          

        // Assign the addresses for the To and CC lists to the mail object.
        mail.setToAddresses(toAddresses);
        //mail.setCcAddresses(ccAddresses);

        // Specify the address used when the recipients reply to the email. 
        mail.setReplyTo('adapakarthi@gmail.com');

        // Specify the name used as the display name.
        mail.setSenderDisplayName('Salesforce Support');

        // Specify the subject line for your email address.
        mail.setSubject('Account Batch Status');

        // Set to True if you want to BCC yourself on the email.
        mail.setBccSender(false);

        // Specify the text content of the email.
        //mail.setPlainTextBody('Your Case: ' + case.Id +' has been created.');

        mail.setHtmlBody('Account Batch Status:<br/><b>Status:</b> '+async.Status+'<br/><b></b>TotalJobItems:'+async.TotalJobItems+'<br/><b>JobItemsProcessed:</b>'+async.JobItemsProcessed+'<br/><b>NumberOfErrors:</b>'+async.NumberOfErrors);

        // Send the email you have created.
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        
    }
}