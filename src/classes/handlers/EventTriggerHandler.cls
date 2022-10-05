public with sharing class EventTriggerHandler {
    public static void handle(List <Event> events, System.TriggerOperation triggerOperation) {
        switch on triggerOperation {
            when BEFORE_INSERT {
                EventService.checkForTimeConflicts(events);
            }
            when BEFORE_UPDATE {
                EventService.checkForTimeConflicts(events);
            }
        }
    }
}