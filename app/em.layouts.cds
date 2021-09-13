using EmergeService as em from '../srv/EmergeService';

//
// annotatios that control the fiori layout
//

annotate em.ProductSurvey with {
    Customer          @Search.defaultSearchElement : true;
    RepresentName     @Search.defaultSearchElement : true;
    RepresentTitle    @Search.defaultSearchElement : true;
    Airframer         @Search.defaultSearchElement : true;
    Program           @Search.defaultSearchElement : true;
    Component         @Search.defaultSearchElement : true;
    ProductType       @Search.defaultSearchElement : true;
    Product           @Search.defaultSearchElement : true;
    ProductKitsNumber @Search.defaultSearchElement : true;
    BusinessShare     @Search.defaultSearchElement : true;
}


annotate em.ProductSurvey with @UI : {

    HeaderInfo                          : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'ProductSurvey',
        TypeNamePlural : 'ProductSurvey',
        ImageUrl       : 'https://icon-library.com/images/products-icon/products-icon-5.jpg',
        Title          : {Value : RepresentName},
        Description    : {Value : RepresentTitle}
    },

    PresentationVariant                 : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem'],
        SortOrder      : [{
            $Type      : 'Common.SortOrderType',
            Property   : Customer,
            Descending : true
        }]
    },

    SelectionFields                     : [
        Customer,
        Airframer_Id,
        Program_Id,
        Component_Id,
        ProductType_Id,
        createdAt,
        createdBy
    ],

    LineItem                            : [
        {
            $Type : 'UI.DataField',
            Value : Customer
        },
        {
            $Type : 'UI.DataField',
            Value : RepresentName
        },
        {
            $Type : 'UI.DataField',
            Value : RepresentTitle
        },
        {
            $Type : 'UI.DataField',
            Value : Airframer_Id,
        },
        {
            $Type : 'UI.DataField',
            Value : Program_Id
        },
        {
            $Type : 'UI.DataField',
            Value : Component_Id
        },
    ],
};
