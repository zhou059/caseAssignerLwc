public with sharing class CaseController {

    @AuraEnabled(cacheable=true)
    public static List<Case> assignCase() {
        Id userId = UserInfo.getUserId();
        Id defaultOwner = [SELECT Id FROM User WHERE Username='jonathan.zhou@1stamerican.demo'].Id;

        List<Case> toAssign = [SELECT Id, CaseNumber, OwnerId, Type FROM Case WHERE OwnerId = :defaultOwner ORDER BY CreatedDate LIMIT 1];

        for (Case updtCase : toAssign) {
            updtCase.OwnerId = userId;
        }

        Update toAssign;

        return toAssign;
    }
}
