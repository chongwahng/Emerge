using ppg.Emerge from '../db/data-model';

service AirframerService {
        @Capabilities: { 
        InsertRestrictions.Insertable: true,
        UpdateRestrictions.Updatable:  true,
        DeleteRestrictions.Deletable:  true  
    }
    entity AirframerHierarchycds as projection on Emerge.AirframerHierarchy;
}