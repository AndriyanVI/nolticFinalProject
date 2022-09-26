trigger EventTrigger on Event (before insert, before update) {
   EventTriggerHandler.handle(Trigger.new, Trigger.operationType);
}