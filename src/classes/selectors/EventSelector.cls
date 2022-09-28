public with sharing class EventSelector {
 public static List<Event> getEvents(List<Date> times) {
     return [SELECT Id, OwnerId, StartDateTime, EndDateTime, WhatId FROM Event WHERE ActivityDate IN :times];
 }
}