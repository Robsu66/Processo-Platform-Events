public with sharing class OrderCreatedTriggerHandlers {
    public static void OrderCreatedEvent(List<Order_Created__e> newOrders) {
        List<Order_Log__c> orderLogs = new List<Order_Log__c>();

        for(Order_Created__e order : newOrders){
            Order_Log__c orderLog = new Order_Log__c();
            orderLog.ClientId__c = order.ClientId__c;
            orderLog.Price__c = order.Price__c;
            orderLog.Product_Name__c = order.Product_Name__c;
            orderLog.Quantity__c = order.Quantity__c;
            orderLog.Status__c = 'In Process';
            orderLog.Total_Price__c = order.Quantity__c * order.Price__c;

            orderLogs.add(orderLog);
        }

        if(!orderLogs.isEmpty()){
            insert orderLogs;
        }
    }
}