using ppg.Emerge from '../db/data-model';

service AirframerService {
        @Capabilities: { 
        InsertRestrictions.Insertable: true,
        UpdateRestrictions.Updatable:  true,
        DeleteRestrictions.Deletable:  true  
    }
    // entity AirframerHierarchycds as projection on Emerge.AirframerHierarchy;
    entity Airframers as projection on Emerge.AirframerHierarchy where Type = 'Airframer';
    entity Programs as projection on Emerge.AirframerHierarchy where Type = 'Program';
    entity Components as projection on Emerge.AirframerHierarchy where Type = 'Component';
}