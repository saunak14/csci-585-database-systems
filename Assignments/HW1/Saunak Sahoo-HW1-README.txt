Covid-19 Contact Tracing System

CS585 HW1: ER Diagram

Entity Design:
1. The EMPLOYEE table is populated with details of any employee that signs up. The employee would be assigned a ROOM_NO to sit in and initialized with a 'well' SICKNESS_STATUS.
2. The COVID_TEST tabel is populated whenever an employee undergoes a COVID-19 test. For a given employee, the attribute IS_CONTACT_TRACING_DONE stores whether an employee for whom TEST_RESULT = 'Y' has undergone contact tracing or not (algorithm is given below)
3. The MEETING_ATTENDEE table consists of a list of all MEETING_ID(s) and the corresponding EMPLOYEE_ID(s) that attended the given meeting
4. The MEETING table contains information of all the meetings that took place including the timestamp of start and end time
5. The ROOM table contains information of all the rooms available in the office building. It describes the FLOOR_NO for each room and the ROOM_TYPE which can be 'Meeting Room' or 'Office room' (where employees sit on their desks)

Algorithm:
1. An employee self-reports COVID-19 symptoms Or gets selected at random for a Covid-19 test. This information is inserted into the COVID_TEST table: a unique COVID_TEST_ID is generated and inserted into the table along with the EMPLOYEE_ID and DATE_OF_TEST.
2. When the test result comes back from the lab, it is inserted into boolean attribute column TEST_RESULT ('Y' if the test is positive and 'N' if negative). The IS_CONTACT_TRACING_DONE column is updated to 'N' initially. 
3. The SICKNESS_STATUS column is also updated accordingly ('well' if the test result is negative, 'sick' if positive and 'hospitalized' if the employee needed hospitalization). This column will be updated when an employee self-reports their health condition (eg. an employee may move from being 'sick' to 'well' after recovering from COVID-19).
4. Once all the COVID-19 test results are processed, for every row in COVID_TEST table where TEST_RESULT = 'Y' and IS_CONTACT_TRACING_DONE = 'N' perform the following 2 actions: Alert close-contacts AND Inform employees on the same floor
5. Alert close-contacts: Get the EMPLOYEE_ID from COVID_TEST table for employee that has tested postive. Check in the MEETING_ATTENDEE table which MEETING_ID(s) have they been a part of. For these MEETING_ID(s) check what other EMPLOYEE_ID(s) were also part of those meetings. For such employees, look up their MOBILE_NO and EMAIL_ID (if it exists) and send out an alert though these communication channels. 
6. These employees will then have a COVID-19 test and steps 2-6 would be repeated for each of them
7. Inform employees on the same floor: Get the EMPLOYEE_ID from COVID_TEST table for employee that has tested postive. Check the ROOM_NO for each employee. From the ROOM table get the FLOOR_NO for each of these ROOM_NO(s). From the same table check for each such FLOOR_NO which ROOM_NO(s) are part of each floor. Once we have the affected ROOM_NO(s), select all of the employees that are present in these ROOM_NO(s) in the EMPLOYEE table. These employees will be notified that they may consider getting a COVID-19 test.
8. Finally, update IS_CONTACT_TRACING_DONE column to 'Y' in the COVID_TEST table for those employees on whom the above steps have been performed.