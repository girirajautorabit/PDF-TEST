trigger ContactTrigger1 on Contact (before insert) {

    for(Contact a2: Trigger.New) {

        a2.Description = 'Contact Description for this ContactTrigger543211111';
    }  
}