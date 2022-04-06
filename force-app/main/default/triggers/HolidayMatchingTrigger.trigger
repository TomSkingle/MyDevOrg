trigger HolidayMatchingTrigger on Contact (before update) {
    if(trigger.isUpdate){
        if(trigger.isBefore){
            HolidayMatchingHandler.MatchingMethod(trigger.new);
        }
    }
}