public with sharing class EventSelector {
 public static List<Event> getEvents() {
     return [SELECT Id, OwnerId, StartDateTime, EndDateTime FROM Event];
 }
}