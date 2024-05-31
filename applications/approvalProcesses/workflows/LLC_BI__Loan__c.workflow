<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>CAB_Default Loan Name</fullName>
        <actions>
            <name>Default_Loan_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Enforces a Loan naming convention. Added for the Commercial Accelerate project.</description>
        <formula>AND(     NOT(ISBLANK(LLC_BI__Account__c)),     NOT(ISPICKVAL(LLC_BI__Product__c, &apos;&apos;)),     OR(     NOT(ISBLANK(LLC_BI__Amount__c)),         AND(             NOT(ISBLANK(LLC_BI__Amount__c)),             ISCHANGED(LLC_BI__Amount__c)         )     ), $User.No_Workflow__c = False )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Commercial Product Line-Record Type</fullName>
        <actions>
            <name>Assign_Commercial_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>LLC_BI__Loan__c.LLC_BI__Product_Line__c</field>
            <operation>equals</operation>
            <value>Commercial</value>
        </criteriaItems>
        <description>Upon creation, Loans with a Product Line of Commercial will be assigned the Commercial record type</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>LLC_BI__HMDA Record Type Check</fullName>
        <actions>
            <name>LLC_BI__Update_HMDA_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Sets the HMDA Record Type field based on the current date</description>
        <formula>TODAY()  &gt;=  DATE(2018,01,01)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>LLC_BI__Loan Set Balloon Indicator</fullName>
        <actions>
            <name>LLC_BI__Loan_Balloon_Indicator_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Set the Loan Balloon indicator when the Amortization Period (Months) and the Term (Months) are different.</description>
        <formula>AND( ISPICKVAL(LLC_BI__Balloon_Product_Structure__c, &apos;&apos;),   OR ( ISCHANGED( LLC_BI__Amortized_Term_Months__c ) , ISCHANGED( LLC_BI__Term_Months__c )),   (LLC_BI__Amortized_Term_Months__c &lt;&gt;  LLC_BI__Term_Months__c) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>LLC_BI__Loan Un-set Balloon Indicator</fullName>
        <actions>
            <name>LLC_BI__Loan_Balloon_Indicator_Unset</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Un-set the Loan Balloon indicator when the Amortization Period (Months) and the Term (Months) are the same.</description>
        <formula>AND( ISPICKVAL(LLC_BI__Balloon_Product_Structure__c, &apos;&apos;), OR ( ISCHANGED( LLC_BI__Amortized_Term_Months__c ) , ISCHANGED( LLC_BI__Term_Months__c )),  OR(IF(OR( ISBLANK(LLC_BI__Amortized_Term_Months__c), ISBLANK(LLC_BI__Term_Months__c)) , True, False),  (LLC_BI__Amortized_Term_Months__c  =  LLC_BI__Term_Months__c) ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Loan - Application Date</fullName>
        <actions>
            <name>Loan_Set_Application_Date_to_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Sets the Application Date to &apos;Today&apos; when a loan record is created</description>
        <formula>ISBLANK(Application_Date__c)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Loan - Booked Alert</fullName>
        <actions>
            <name>Loan_Booked</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>When a loan is set to &quot;Booked&quot; (Update for customer-specific equivalent) send out the loan closing e-mail alert</description>
        <formula>AND( ISPICKVAL(LLC_BI__Stage__c , &apos;Booked&apos;), $User.No_Workflow__c = False)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Loan - Employee Loan Equals True</fullName>
        <actions>
            <name>Loan_Employee_Loan_Equals_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>This workflow rule will automatically check the Employee Loan box if the loan is associated to an Employee Relationship</description>
        <formula>LLC_BI__Account__r.LLC_BI__Employee_Relationship__c = True</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Loan - Reg O Loan Equals True</fullName>
        <actions>
            <name>Loan_Reg_O_Equals_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>This workflow rule will automatically check the Reg O Loan box if the loan is associated to a Reg O Relationship</description>
        <formula>LLC_BI__Account__r.LLC_BI__Reg_O_Relationship__c = True</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Loan - isCopy - Set Default Stage %26 Status</fullName>
        <actions>
            <name>Loan_Set_Stage_to_Qualification</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Loan_Set_Status_to_Open</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>LLC_BI__Loan__c.LLC_BI__Is_Copy__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>This workflow will automatically set the Loan Stage to Qualification &amp; the Loan Status to Open when a loan is copied</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>UI Default App - Loan</fullName>
        <actions>
            <name>Loan_Default_App</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>When a loan is created, set the default app so the appropriate UI appears.</description>
        <formula>$User.No_Workflow__c = False</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
