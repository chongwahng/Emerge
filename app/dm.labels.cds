using {ppg.Emerge as dm} from '../db/data-model';

//
// annotations that control rendering of fields and labels
//

annotate dm.ProductSurvey with @title         : '{i18n>ProductSurvey}' {
    ID                @UI.Hidden;
    System            @UI.Hidden;
    Customer          @title                  : '{i18n>Customer}';
    RepresentName     @title                  : '{i18n>RepresentName}';
    RepresentTitle    @title                  : '{i18n>RepresentTitle}';
    Airframer         @title                  : '{i18n>Airframer}'
                      @Common.Text            : Airframer.Name
                      @Common.TextArrangement : #TextOnly;
    Program           @title                  : '{i18n>Program}'
                      @Common.Text            : Program.Name
                      @Common.TextArrangement : #TextOnly;
    Component         @title                  : '{i18n>Component}'
                      @Common.Text            : Component.Name
                      @Common.TextArrangement : #TextOnly;

    Active            @title                  : '{i18n>Active}';

    ProductType       @title                  : '{i18n>ProductType}'
                      @Common.Text            : ProductType.name
                      @Common.TextArrangement : #TextOnly;
    Product           @title                  : '{i18n>Product}';
    ProductKitsNumber @title                  : '{i18n>ProductKitsNumber}';
    BusinessShare     @title                  : '{i18n>BusinessShare}';
};

annotate dm.ProductType with {
    Id   @title       : '{i18n>TypeId}'
         @Common.Text : name;
    name @title       : '{i18n>TypeName}';
}

annotate dm.Airframer with {
    ID   @UI.Hidden
         @Common.Text : Name;
    code @title       : '{i18n>AirframerId}';
    Name @title       : '{i18n>AirframerName}';
};

annotate dm.Program with {
    ID   @UI.Hidden
         @Common.Text : Name;
    code @title       : '{i18n>ProgramId}';
    Name @title       : '{i18n>ProgramName}';
};

annotate dm.Component with {
    ID   @UI.Hidden
         @Common.Text : Name;
    code @title       : '{i18n>ComponentId}';
    Name @title       : '{i18n>ComponentName}';
};
