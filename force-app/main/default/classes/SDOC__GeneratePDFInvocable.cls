/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class GeneratePDFInvocable {
    global GeneratePDFInvocable() {

    }
    @InvocableMethod(label='Generate PDF' description='Generates a PDF')
    global static List<SDOC.GeneratePDFInvocable.Results> generatePDF(List<SDOC.GeneratePDFInvocable.Request> requestList) {
        return null;
    }
global class Request {
    @InvocableVariable(label='Object Id' description='Id of object to be used in generation' required=true)
    global Id objectId;
    @InvocableVariable(label='Template Id' description='Id of template to be used in generation' required=true)
    global Id templateId;
    global Request() {

    }
}
global class Results {
    @InvocableVariable(label='Generated Attachment' description='The generated Attachment' required=false)
    global Attachment attachment;
    @InvocableVariable(label='Generated ContentVersion' description='The generated ContentVersion' required=false)
    global ContentVersion contentVersion;
    @InvocableVariable(label='Generated SDoc__c' description='The generated SDoc__c object' required=false)
    global SDOC__SDoc__c sdoc;
    global Results() {

    }
}
}
