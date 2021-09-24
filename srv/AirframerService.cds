using ppg.Emerge from '../db/data-model';

service AirframerService {
        @Capabilities: { 
        InsertRestrictions.Insertable: true,
        UpdateRestrictions.Updatable:  true,
        DeleteRestrictions.Deletable:  false  
    }
    entity AirframerHierarchy as projection on Emerge.AirframerHierarchy;
}