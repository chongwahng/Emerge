using ppg.Emerge from '../db/data-model';

 service EmergeService
{
    @Capabilities: { 
        InsertRestrictions.Insertable: true,
        UpdateRestrictions.Updatable:  true,
        DeleteRestrictions.Deletable:  false  
    }
    entity ProductSurvey as projection on Emerge.ProductSurvey;
    // view AirframerList as select from Emerge.AirframerList;
    // view ProgramList as select from Emerge.ProgramList;
    // view ComponentList as select from Emerge.ComponentList;
}