CS585 HW2: SQL

Q1: A bridge table has been created between EMPLOYEE and MEETING table called MEETING_ATTENDEE. This was as a result of performing normalization so that we do not have repeating blocks MEETING_IDs that were attended by employees having EMPLOYEE_IDs

Q2: Some additional insert queries for the SYMPTOM table have to be run in order to generate enough data to perform. The SELECT query is then run to reveal the SYMPTOM_ID that is self reported the most

Q3: Assumption: The organization tests EMPLOYEEs that have shown a symptom (having any SYMPTOM_ID from 1 to 5) either by self-reported SYMPTOM or SCAN are tested. Thus such employees would be present in the TEST table. Employees that tested 'positive' would also have records in the CASE table as well as the HEALTH_STATUS table
Hence, sick employees are all those employees that tested 'positive' from the TEST table AND are still 'sick' in the HEALTH_STATUS table

Q4: Assumption: Stats required by the management is the count of all the number of scans, tests, symptomatic reports and positive cases

Q5: Query written is to find all those employees that have reported all possible symptoms (SYMPTOM_ID values from 1 to 5) using the DIVIDE operator. While SQL doesn't natively support this operator, it can be replicated using operations such as JOIN which has been used here