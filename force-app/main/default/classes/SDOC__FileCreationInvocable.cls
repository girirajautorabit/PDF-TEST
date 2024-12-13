/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class FileCreationInvocable {
    global FileCreationInvocable() {

    }
    @InvocableMethod(label='Create PDF File from S-Doc' description='Creates a PDF File from an S-Doc Id')
    global static List<SDOC.FileCreationInvocable.Results> createFile(List<SDOC.FileCreationInvocable.Request> requestList) {
        return null;
    }
global class Request {
    @InvocableVariable(label='S-Doc Id' description='Id of S-Doc to be used to generate PDF file.' required=true)
    global Id sdocId;
    global Request() {

    }
}
global class Results {
    @InvocableVariable(label='Generated File' description='The generated PDF file' required=false)
    global ContentVersion file;
    global Results(ContentVersion fileIn) {

    }
}
}
