trigger HolidayFieldTrigger on Contact (before update){
    List<Contact> contacts = new List<Contact>();
    
    for(Contact c : Trigger.New){
        List<Holiday__c> hList = [Select Id, Hotel_Name__c, City__c, Country__c 
                                  FROM Holiday__c
                                  WHERE Id =: c.Holiday__c LIMIT 1
                                 ];
        
        if(hList.Size() > 0){
            c.Hotel_Name__c = hList[0].Hotel_Name__c;
            c.City__c = hList[0].City__c;
            c.Country__c = hList[0].Country__c;
        }
    }
}