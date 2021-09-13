using {
    managed,
    sap,
    cuid
} from '@sap/cds/common';

namespace ppg.Emerge;

entity ProductSurvey : cuid, managed {

    Customer            : String;
    RepresentativeName  : String;
    RepresentativeTitle : String;
    Airframer           : String;
    Program             : String;
    Component           : String;
    Active              : Boolean;
    ProductType         : String;
    Product             : String;
    ProductKitsNumber   : Integer;
    BusinessShare       : Integer;

}
