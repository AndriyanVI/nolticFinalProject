public with sharing class EventService {
 public static void checkForTimeConflicts(List <Event> newEvents) {
     List <Event> events = EventSelector.getEvents();
     for (Event currEvent : newEvents) {
         for (Event e : events) {
             if (e.OwnerId == currEvent.OwnerId && atTheSameTime(currEvent, e)) {
                 currEvent.addError('You cant have two appointments at the same time');
             }
         }
     }

 }
    public static Boolean atTheSameTime(Event currEvent, Event oldEvent) {
        return oldEvent.EndDateTime >= currEvent.StartDateTime && oldEvent.StartDateTime <= currEvent.EndDateTime ? true : false;
    }
}