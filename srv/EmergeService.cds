using ppg.Emerge from '../db/data-model';

service EmergeService //@( requires: ['Emerge_KBU'])
{
    @Capabilities : {
        InsertRestrictions.Insertable : true,
        UpdateRestrictions.Updatable  : true,
        DeleteRestrictions.Deletable  : false
    }
    entity ProductSurvey as projection on Emerge.ProductSurvey;

    entity Airframer     as projection on Emerge.Airframer;
    entity Program       as projection on Emerge.Program;
    entity Component     as projection on Emerge.Component;
    @readonly
    entity Change        as projection on Emerge.Changes;
}

annotate EmergeService.ProductSurvey with @odata.draft.enabled;

service ReportService {
    @readonly
    entity ProductSurvey as
        select from Emerge.ProductSurvey {
            Airframer.Name as AirframerName,
            Program.Name   as ProgramName,
            Component.Name as ComponentName,
            TotalComponents,
            BusinessShare,
            to_Infos.Active,
            to_Infos.ProductType.name,
            to_Infos.Product,
            to_Infos.ProductKitsNumber
        }
}
