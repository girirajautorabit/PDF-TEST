<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>em</fullName>
        <description>em</description>
        <protected>false</protected>
        <recipients>
            <recipient>integration@00d280000019lseeaa.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CommunityChangePasswordEmailTemplate</template>
    </alerts>
    <fieldUpdates>
        <fullName>fieldupdate</fullName>
        <field>FT1__c</field>
        <name>fieldupdate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>QuoteLineItem</fullName>
        <active>true</active>
        <criteriaItems>
            <field>User.AboutMe</field>
            <operation>startsWith</operation>
            <value>s</value>
        </criteriaItems>
        <description>test 1234</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
