trigger OrderCreatedTrigger on Order_Created__e (after insert) {
    if(Trigger.isInsert){
        OrderCreatedTriggerHandlers.OrderCreatedEvent(Trigger.New);
    }
}