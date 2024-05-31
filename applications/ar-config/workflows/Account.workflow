<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>em1</fullName>
        <description>em1</description>
        <protected>false</protected>
        <recipients>
            <recipient>integration@00d280000019lseeaa.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CommunityForgotPasswordEmailTemplate</template>
    </alerts>
    <alerts>
        <fullName>em2</fullName>
        <description>em2</description>
        <protected>false</protected>
        <recipients>
            <recipient>integration@00d280000019lseeaa.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CommunityChgEmailVerNewTemplate</template>
    </alerts>
    <fieldUpdates>
        <fullName>F2</fullName>
        <field>OwnerId</field>
        <lookupValue>saikumar-sb.three@autorabit.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>F2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>File1</fullName>
        <field>BillingCity</field>
        <name>File1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Account - Industry Code Lookup Populated</fullName>
        <actions>
            <name>Account_Update_NAICS_Code</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>When the Industry Code field is populated on the Account, populate the NAICS Code Text field.</description>
        <formula>AND( $User.No_Workflow__c = false, OR( ISNEW(), ISCHANGED(cm_Industry_Code__c) ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>LLC_BI__Account Set Business Record Type</fullName>
        <actions>
            <name>LLC_BI__Set_Account_Business_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Type</field>
            <operation>notEqual</operation>
            <value>Household,Individual,Sole Proprietorship,Financial Institution,Institutional Investor</value>
        </criteriaItems>
        <description>sets Record Type to Business if Account Type is not &quot;Household&quot;, &quot;Sole Proprietorship&quot;, &quot;Institutional Investor&quot;, &quot;Financial Institution&quot; or &quot;Individual&quot;</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>LLC_BI__Account Set Household Record Type</fullName>
        <actions>
            <name>LLC_BI__Set_Account_Household_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Type</field>
            <operation>equals</operation>
            <value>Household</value>
        </criteriaItems>
        <description>sets Record Type to Household if Account Type is &quot;Household&quot;</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>LLC_BI__Account Set Individual Record Type</fullName>
        <actions>
            <name>LLC_BI__Set_Account_Individual_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Type</field>
            <operation>equals</operation>
            <value>Individual,Sole Proprietorship</value>
        </criteriaItems>
        <description>sets Record Type to Individual if Account Type is &quot;Sole Proprietorship&quot; or &quot;Individual&quot;</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>LLC_BI__Account Set Lender Record Type</fullName>
        <actions>
            <name>LLC_BI__Update_Record_Type_to_Lender</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Type</field>
            <operation>equals</operation>
            <value>Financial Institution,Institutional Investor</value>
        </criteriaItems>
        <description>sets Record Type to Lender if Account Type is &quot;Financial Institution&quot; or &quot;Institutional Investor&quot;</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>LLC_BI__Set Default App for Lenders</fullName>
        <actions>
            <name>LLC_BI__Set_Default_App_to_Counterparty_Report</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lender</value>
        </criteriaItems>
        <description>When Record Type is Lender, set default app to be counterparty report.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Default App-Master Relationship</fullName>
        <actions>
            <name>Set_Default_App_Master_Relationship</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>1=1</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>test</fullName>
        <actions>
            <name>em1</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>em2</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>F2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>File1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
            <value>guntur</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.OwnerId</field>
            <operation>notEqual</operation>
            <value>guntur</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>