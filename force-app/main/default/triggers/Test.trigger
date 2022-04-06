trigger Test on Contact (after insert){
    List<Contact> contacts = new List<Contact>();
    
    for(Contact c : Trigger.New){
        Contact con = new Contact(Id = c.Id);
        
        List<Holiday__c> hList = [Select Id, Hotel_Name__c, City__c, Country__c 
                                  FROM Holiday__c 
                                  WHERE Id =: c.Holiday__c
                                 ];

        con.Hotel_Name__c = hList[0].Hotel_Name__c;
        con.City__c = hList[0].City__c;
        con.Country__c = hList[0].Country__c;
        contacts.add(con);
    } 
    UPDATE contacts;
}