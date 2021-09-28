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
                      @Common.TextArrangement : #TextFirst;
    Program           @title                  : '{i18n>Program}'
                      @Common.Text            : Program.Name
                      @Common.TextArrangement : #TextFirst;
    Component         @title                  : '{i18n>Component}'
                      @Common.Text            : Component.Name
                      @Common.TextArrangement : #TextFirst;

    Active            @title                  : '{i18n>Active}';

    ProductType       @title                  : '{i18n>ProductType}'
                      @Common.Text            : ProductType.name
                      @Common.TextArrangement : #TextFirst;
    Product           @title                  : '{i18n>Product}';
    ProductKitsNumber @title                  : '{i18n>ProductKitsNumber}';
    BusinessShare     @title                  : '{i18n>BusinessShare}';
};

annotate dm.ProductType with {
    Id   @title : '{i18n>TypeId}';
    name @title : '{i18n>TypeName}';
}

annotate dm.AirframerList with {
    Id     @title : '{i18n>AirframerId}';
    Name   @title : '{i18n>AirframerName}';
    Parent @UI.Hidden;
};

annotate dm.ProgramList with {
    Id     @title : '{i18n>ProgramId}';
    Name   @title : '{i18n>ProgramName}';
    Parent @UI.Hidden;
};

annotate dm.ComponentList with {
    Id     @title : '{i18n>ComponentId}';
    Name   @title : '{i18n>ComponentName}';
    Parent @UI.Hidden;
};

annotate dm.AirframerHierarchy with {
    Id     @title : '{i18n>HierarchyId}';
    Name   @title : '{i18n>HierarchyName}';
    Type   @title : '{i18n>HierarchyType}';
    Parent @title : '{i18n>HierarchyParent}'
           @Common.Text            : Parent.Name
           @Common.TextArrangement : #TextFirst;
};
