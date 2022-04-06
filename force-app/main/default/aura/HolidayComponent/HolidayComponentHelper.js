({
	loadContactRecords : function(component) {
        console.log('@@@ loadContactRecords');
		var action = component.get("c.loadContactRecordsApex");
        action.setParams({
            "recordId": component.get('v.recordId')
        }); 
        action.setCallback(this, function(response) {
            var state = response.getState();
            var errors = response.getError();  
            console.log('@@@ error: ' + JSON.stringify(errors));
 
            if (state === "SUCCESS") {
                console.log('@@@ response: ' + JSON.stringify(response.getReturnValue()));
                component.set('v.contactRecord', response.getReturnValue());
            }
        })
        $A.enqueueAction(action);
	}
})