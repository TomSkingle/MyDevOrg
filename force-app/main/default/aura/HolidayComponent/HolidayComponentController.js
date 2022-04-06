({
	doInit : function(component, event, helper) {
        console.log('@@@ doinit');
		helper.loadContactRecords(component);
	},
})