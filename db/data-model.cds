using {
    managed,
    sap,
    cuid
} from '@sap/cds/common';

namespace ppg.Emerge;

entity ProductSurvey : cuid, managed {

    Customer          : String;
    RepresentName     : String;
    RepresentTitle    : String;
    Airframer         : String;
    Program           : String;
    Component         : String;
    Active            : Boolean;
    ProductType       : String;
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
