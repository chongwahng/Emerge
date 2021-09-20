using {
    managed,
    sap,
    cuid
} from '@sap/cds/common';

namespace ppg.Emerge;

entity ProductSurvey : cuid, managed {
    AccountId         : String;
    System            : String(3);
    Customer          : String;
    RepresentName     : String;
    RepresentTitle    : String;
    Airframer         : Association to AirframerList;
    Program           : Association to ProgramList;
    Component         : Association to ComponentList;
    Active            : Boolean;
    ProductType       : Association to ProductType;
    Product           : String;
    ProductKitsNumber : Integer;
    BusinessShare     : Integer;

}

entity ProductType : sap.common.CodeList {
    key Id : String;
}

entity AirframerHierarchy {
    key Id       : String;
        Name     : String;
        Type     : String enum {
            Airframer;
            Program;
            Component;
        };
        Parent   : Association to AirframerHierarchy;
        Children : Composition of many AirframerHierarchy
                       on Children.Parent = $self;
}


 view AirframerList as select from AirframerHierarchy {
    Id,
    Name,
    Parent
} where Type = 'Airframer';

view ProgramList as select from AirframerHierarchy {
    Id,
    Name,
    Parent
} where Type = 'Program';

view ComponentList as select from AirframerHierarchy {
    Id,
    Name,
    Parent
} where Type = 'Component';