using {
    managed,
    sap,
    cuid
} from '@sap/cds/common';

namespace ppg.Emerge;

entity ProductSurvey : cuid, managed {
    System            : String(3);
    Customer          : String;
    RepresentName     : String;
    RepresentTitle    : String;
    Airframer         : Association to Airframer;
    Program           : Association to Program;
    Component         : Association to Component;
    Active            : Boolean;
    ProductType       : Association to ProductType;
    Product           : String;
    ProductKitsNumber : Integer;
    BusinessShare     : Integer;

}

entity ProductType : sap.common.CodeList {
    key Id : String;
}

entity Airframer : cuid, managed {
    AirframerId : String;
    Name        : String;
    to_Programs : Composition of many Program
                      on to_Programs.Airframer = $self;
}

entity Program : cuid, managed {
    ProgramId     : String;
    Name          : String;
    Airframer     : Association to Airframer;
    to_Components : Composition of many Component
                        on to_Components.Program = $self;
}

entity Component : cuid, managed {
    ComponentId : String;
    Name        : String;
    Program     : Association to Program;
}

// entity AirframerHierarchy : managed {
//     key Id       : String;
//         Name     : String;
//         Type     : String enum {
//             Airframer;
//             Program;
//             Component;
//         };
//         Parent   : Association to AirframerHierarchy;
//         Children : Composition of many AirframerHierarchy
//                        on Children.Parent = $self;
// }
//  view AirframerList as select from AirframerHierarchy {
//     Id,
//     Name,
//     Parent
// } where Type = 'Airframer';
// view ProgramList as select from AirframerHierarchy {
//     Id,
//     Name,
//     Parent
// } where Type = 'Program';
// view ComponentList as select from AirframerHierarchy {
//     Id,
//     Name,
//     Parent
// } where Type = 'Component';
