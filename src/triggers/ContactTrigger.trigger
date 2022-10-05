trigger ContactTrigger on Contact (after insert) {
    ContactTriggerHandler.handle(Trigger.new, Trigger.operationType);
}