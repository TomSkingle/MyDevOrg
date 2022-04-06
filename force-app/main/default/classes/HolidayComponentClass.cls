public class HolidayComponentClass {
	@AuraEnabled
    public static Contact loadContactRecordsApex(String recordId){
        return [SELECT Id, Holiday__c, Holiday__r.Temperature_Rating__c, Holiday__r.Category__c, Holiday__r.Continent__c, Holiday__r.Location__c, Holiday__r.Star_Rating__c, Holiday__r.Price_Per_Night__c, Holiday__r.Hotel_Name__c, Holiday__r.City__c, Holiday__r.Country__c, Holiday__r.Name
                FROM Contact 
                WHERE Id =: recordId
               ];
    }
}