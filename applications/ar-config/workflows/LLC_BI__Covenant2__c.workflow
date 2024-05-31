<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>PMB_Populate FI Effective Date</fullName>
        <actions>
            <name>PMB_Populate_FI_Effective_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Populates the Effective Date on Financial Indicator Covenant Mgmt records when their related Covenant Mgmt record is a Financial Statement Requirement</description>
        <formula>AND( NOT(ISBLANK(LLC_BI__Related_Covenant__c)), NOT(ISBLANK(LLC_BI__Related_Covenant__r.LLC_BI__Effective_Date__c)), ISPICKVAL(LLC_BI__Related_Covenant__r.LLC_BI__Covenant_Type__r.LLC_BI__Category__c, &apos;Financial Statement Requirements&apos;), $User.No_Workflow__c = False )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
