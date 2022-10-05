public with sharing class EventService {
 public static void checkForTimeConflicts(List <Event> newEvents) {
     List <Date> times = datesToCheck(newEvents);
     List <Event> events = EventSelector.getEvents(times);
     for (Event currEvent : newEvents) {
         for (Event e : events) {
             if (e.OwnerId == currEvent.OwnerId && atTheSameTime(currEvent, e)) {
                 currEvent.addError('You cant have two appointments at the same time');
             }
             if (e.WhatId == currEvent.WhatId && atTheSameTime(currEvent, e)) {
                 currEvent.addError('You cant have an appointment with this car its currently unavailable');
             }
         }
     }

 }
    public static Boolean atTheSameTime(Event currEvent, Event oldEvent) {
        return oldEvent.EndDateTime >= currEvent.StartDateTime && oldEvent.StartDateTime <= currEvent.EndDateTime ? true : false;
    }

    public static List<Date> datesToCheck(List<Event> events) {
        List <Date> times = new List<Date>();
        for (Event event : events) {
            times.add(Date.newInstance(event.StartDateTime.year(), event.StartDateTime.month(), event.StartDateTime.day()));
            times.add(Date.newInstance(event.EndDateTime.year(), event.EndDateTime.month(), event.EndDateTime.day()));
        }
        return times;
    }
}