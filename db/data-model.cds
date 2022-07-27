using {
    managed,
    sap,
    cuid
} from '@sap/cds/common';

namespace ppg.Emerge;

entity ProductSurvey : cuid, managed {
    System          : String(3);
    Customer        : String;
    RepresentName   : String;
    RepresentTitle  : String;
    Airframer       : Association to Airframer;
    Program         : Association to Program;
    Component       : Association to Component;
    TotalComponents : Integer;
    //    Active            : Boolean;
    //    ProductType       : Association to ProductType;
    //    Product           : String;
    //    ProductKitsNumber : Integer;
    BusinessShare   : Integer;
    to_Infos        : Composition of many ProductSurvey_Infos
                          on to_Infos.to_ProductSurvey = $self;
    to_Changes      : Association to many Changes
                          on to_Changes.to_ProductSurvey = $self;
}

entity ProductSurvey_Infos : cuid, managed {
    to_ProductSurvey  : Association to ProductSurvey;
    Active            : Boolean;
    ProductType       : Association to ProductType;
    Product           : String;
    ProductKitsNumber : Integer;
}

entity Changes : cuid, managed {
    FieldName        : String;
    OldValue         : String;
    NewValue         : String;
    to_ProductSurvey : Association to ProductSurvey;
}

entity ProductType : sap.common.CodeList {
    key Id : String;
}

entity Airframer : cuid, managed {
    Name        : String;
    to_Programs : Composition of many Program
                      on to_Programs.to_Airframer = $self;
}

entity Program : cuid, managed {
    Name         : String;
    to_Airframer : Association to Airframer;
}

entity Component : cuid, managed {
    Name : String;
}
