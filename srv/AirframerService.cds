using ppg.Emerge from '../db/data-model';

service AirframerService {
    @Capabilities : {
        InsertRestrictions.Insertable : true,
        UpdateRestrictions.Updatable  : true,
        DeleteRestrictions.Deletable  : true
    }
    entity Airframer as projection on Emerge.Airframer;

    entity Program   as projection on Emerge.Program;
    entity Component as projection on Emerge.Component;
}
