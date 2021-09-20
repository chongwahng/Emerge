using ppg.Emerge from '../db/data-model';

 service EmergeService @( requires: ['Emerge_KBU'])
{
    @Capabilities: { 
        InsertRestrictions.Insertable: true,
        UpdateRestrictions.Updatable:  true,
        DeleteRestrictions.Deletable:  false  
    }
    entity ProductSurvey as projection on Emerge.ProductSurvey;
    
    view AirframerList @(cds.redirection.target : false)  as select from Emerge.AirframerList;
    view ProgramList   @(cds.redirection.target : false)  as select from Emerge.ProgramList;
    view ComponentList @(cds.redirection.target : false)  as select from Emerge.ComponentList;
}