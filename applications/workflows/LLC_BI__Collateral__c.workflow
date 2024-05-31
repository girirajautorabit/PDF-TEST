<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>LLC_BI__Government Contracts2</fullName>
        <actions>
            <name>LLC_BI__Government_Contracts2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>--DEPRECATED-- Specifies page layout for Collateral2 based on Collateral Type</description>
        <formula>TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Type__c) = &quot;Other&quot;  &amp;&amp;  TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Subtype__c) = &quot;Government Contracts&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LLC_BI__Possessory Letter of Credit2</fullName>
        <actions>
            <name>LLC_BI__Possessory_Letter_of_Credit2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>--DEPRECATED-- Specifies page layout for Collateral2 based on Collateral Type</description>
        <formula>TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Type__c) = &quot;Possessory&quot;  &amp;&amp;  TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Subtype__c) = &quot;Letter of Credit&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LLC_BI__Possessory Life Insurance2</fullName>
        <actions>
            <name>LLC_BI__Possessory_Life_Insurance</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>--DEPRECATED-- Specifies page layout for Collateral2 based on Collateral Type</description>
        <formula>TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Type__c) = &quot;Possessory&quot;  &amp;&amp;  TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Subtype__c) = &quot;Life Insurance&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LLC_BI__Possessory Other2</fullName>
        <actions>
            <name>LLC_BI__Possessory_Other</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>--DEPRECATED-- Specifies page layout for Collateral2 based on Collateral Type</description>
        <formula>TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Type__c) = &quot;Possessory&quot;  &amp;&amp;  (TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Subtype__c) = &quot;Other Possessory&quot; || TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Subtype__c) = &quot;Note/Instrument&quot; || TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Subtype__c) = &quot;Receipts/Bills&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LLC_BI__Possessory Savings%2FCD2</fullName>
        <actions>
            <name>LLC_BI__Possessory_Savings_CD</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>--DEPRECATED-- Specifies page layout for Collateral2 based on Collateral Type</description>
        <formula>TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Type__c) = &quot;Possessory&quot;  &amp;&amp;  TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Subtype__c) = &quot;Savings/CD&apos;s&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LLC_BI__Possessory Securities2</fullName>
        <actions>
            <name>LLC_BI__Possessory_Securities</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>--DEPRECATED-- Specifies page layout for Collateral2 based on Collateral Type</description>
        <formula>TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Type__c) = &quot;Possessory&quot;  &amp;&amp;  TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Subtype__c) = &quot;Securities&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LLC_BI__Real Estate2</fullName>
        <actions>
            <name>LLC_BI__Real_Estate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>--DEPRECATED-- Specifies page layout for Collateral2 based on Collateral Type</description>
        <formula>TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Type__c) = &quot;Real Estate&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LLC_BI__Titled Aircraft2</fullName>
        <actions>
            <name>LLC_BI__Titled_Aircraft</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>--DEPRECATED-- Specifies page layout for Collateral2 based on Collateral Type</description>
        <formula>TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Type__c) = &quot;Titled&quot;  &amp;&amp;  TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Subtype__c) = &quot;Aircraft&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LLC_BI__Titled Mobile Home2</fullName>
        <actions>
            <name>LLC_BI__Titled_Mobile_Home</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>--DEPRECATED-- Specifies page layout for Collateral2 based on Collateral Type</description>
        <formula>TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Type__c) = &quot;Titled&quot;  &amp;&amp;  TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Subtype__c) = &quot;Mobile Home&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LLC_BI__Titled Motor Vehicle2</fullName>
        <actions>
            <name>LLC_BI__Titled_Motor_Vehicle</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>--DEPRECATED-- Specifies page layout for Collateral2 based on Collateral Type</description>
        <formula>TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Type__c) = &quot;Titled&quot;  &amp;&amp;  TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Subtype__c) = &quot;Motor Vehicle&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LLC_BI__Titled Pleasure Boat2</fullName>
        <actions>
            <name>LLC_BI__Titled_Boat</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>--DEPRECATED-- Specifies page layout for Collateral2 based on Collateral Type</description>
        <formula>TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Type__c) = &quot;Titled&quot;  &amp;&amp;  TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Subtype__c) = &quot;Pleasure Boat&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LLC_BI__Titled Vessel2</fullName>
        <actions>
            <name>LLC_BI__Titled_Vessel</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>--DEPRECATED-- Specifies page layout for Collateral2 based on Collateral Type</description>
        <formula>TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Type__c) = &quot;Titled&quot;  &amp;&amp;  TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Subtype__c) = &quot;Vessel&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LLC_BI__UCC2</fullName>
        <actions>
            <name>LLC_BI__UCC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>--DEPRECATED-- Specifies page layout for Collateral2 based on Collateral Type</description>
        <formula>TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Type__c) = &quot;UCC&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LLC_BI__Update Collateral Group Record Type</fullName>
        <actions>
            <name>LLC_BI__Set_Collateral_Group_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>--DEPRECATED-- This workflow rule sets the Record Type field to Group when the collateral mgmt record’s collateral type equals a group (Group Type field populated).</description>
        <formula>NOT(ISBLANK(TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Group_Type__c)))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Titled Trailer%2FOther3</fullName>
        <actions>
            <name>LLC_BI__Titled_Trailer_Other</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Specifies page layout for Collateral2 based on Collateral Type</description>
        <formula>TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Type__c) = &quot;Titled&quot;  &amp;&amp;  (TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Subtype__c) = &quot;Trailer&quot; || TEXT(LLC_BI__Collateral_Type__r.LLC_BI__Subtype__c) = &quot;Other Titled&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
