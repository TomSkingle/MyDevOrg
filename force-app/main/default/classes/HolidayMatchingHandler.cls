public class HolidayMatchingHandler {
    public static void MatchingMethod(List<Contact> Contact){        
        String TemperatureRating = Contact[0].Temperature_Rating__c;
        String Category = Contact[0].Category__c;        
        String Continent = Contact[0].Continent__c;
        String Location = Contact[0].Location__c;
        Decimal StarRating = Contact[0].Star_Rating__c;
        Decimal PricePerNight = Contact[0].Price_Per_Night__c;        
        String HotelName;
        String City;
        String Country; 
        
        List<Holiday__c> hList = [Select Id, Temperature_Rating__c, Category__c, Continent__c, Location__c, Star_Rating__c, Price_Per_Night__c, Hotel_Name__c, City__c, Country__c
                                  FROM Holiday__c 
                                  WHERE Temperature_Rating__c =: TemperatureRating
                                  OR Category__c =: Category
                                  OR Continent__c =: Continent
                                  OR Location__c =: Location
                                  OR Star_Rating__c >=: StarRating
                                  OR Price_Per_Night__c <=: PricePerNight
                                 ];
        
        String holidayID;
        Integer holidayCounter = 0;
        for(Holiday__c h : hList){
            Integer MatchPoint = 0;
            if(h.Temperature_Rating__c == TemperatureRating){
                MatchPoint++;
            }
            if(h.Category__c == Category){
                MatchPoint++;
            }
            if(h.Continent__c == Continent){
                MatchPoint++;
            }
            if(h.Location__c == Location){
                MatchPoint++;
            }
            if(h.Star_Rating__c >= StarRating){
                MatchPoint++;
            }
            if(h.Price_Per_Night__c <= PricePerNight){
                MatchPoint++;
            }
            if(MatchPoint > holidayCounter){
                holidayID = h.ID;
                HotelName = h.Hotel_Name__c;
                City = h.City__c;
                Country = h.Country__c;                    
                holidayCounter = MatchPoint;
            }
        }
		Contact[0].Holiday__c = holidayID;
        Contact[0].Hotel_Name__c = HotelName;
        Contact[0].City__c = City;
        Contact[0].Country__c = Country;
    }
}