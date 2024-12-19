/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class UserInputInvocable {
    global UserInputInvocable() {

    }
    @InvocableMethod(label='Generate S-Doc With Input' description='Generates an S-Doc with user input')
    global static List<SDOC.UserInputInvocable.Results> generateSDoc(List<SDOC.UserInputInvocable.Request> requestList) {
        return null;
    }
global class Request {
    @InvocableVariable(label='Object Id' description='Id of object to be used in generation' required=true)
    global Id objectId;
    @InvocableVariable(label='Template Name or Id' description='Name or Id of template to be used in generation' required=true)
    global String templateNameOrId;
    @InvocableVariable(label='User Inputs' description='User Inputs for merge fields to be used in generation' required=true)
    global List<SDOC.UserInput> userInputs;
    global Request() {

    }
}
global class Results {
    @InvocableVariable(label='Generated SDoc__c' description='The generated SDoc__c object' required=false)
    global SDOC__SDoc__c sdoc;
    global Results() {

    }
}
}
