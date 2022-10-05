@IsTest
private class EventServiceTest {
    @TestSetup
    static void testDataCreator() {
        Event firstEvent = new Event();
        firstEvent.StartDateTime = Datetime.newInstance(2022,1,1,12,0,0);
        firstEvent.EndDateTime = Datetime.newInstance(2022,1,1,13,0,0);
        firstEvent.Subject = 'buying car';
        insert firstEvent;

        Event secondEvent = new Event();
        secondEvent.StartDateTime = Datetime.newInstance(2022,2,1,12,0,0);
        secondEvent.EndDateTime = Datetime.newInstance(2022,2,1,13,0,0);
        secondEvent.Subject = 'buying car';
        insert secondEvent;

    }
    @IsTest
    static void eventTimeConflictTest_negative() {
        Event thirdEvent = new Event();
        thirdEvent.StartDateTime = Datetime.newInstance(2022,1,1,12,0,0);
        thirdEvent.EndDateTime = Datetime.newInstance(2022,1,1,13,0,0);
        thirdEvent.Subject = 'buying car';


        Test.startTest();
        Database.insert(thirdEvent, false);
        Test.stopTest();

        Integer events = [SELECT COUNT() FROM Event];
        System.assertEquals(2, events);
    }


    @IsTest
    static void eventTimeConflictTestForUpdate_negative() {
        List<Event> currentEvents = [SELECT StartDateTime, EndDateTime, Subject FROM Event];

        Test.startTest();
        currentEvents[1].StartDateTime = Datetime.newInstance(2022,1,1,12,0,0);
        currentEvents[1].EndDateTime = Datetime.newInstance(2022,1,1,13,0,0);
        Database.SaveResult res =  Database.update(currentEvents[1], false);
        Test.stopTest();

        System.assertEquals(res.isSuccess(), false);
    }
}
