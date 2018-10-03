trigger deleteAccOnRating on Account (before delete) {
list<Account> acclist = new list<Account>();
acclist = Trigger.old;
for(Account ac : acclist) {
    if(ac.rating == 'Hot') {
        ac.rating.addError('You cannot delete a Hot Account');
    }
}

}