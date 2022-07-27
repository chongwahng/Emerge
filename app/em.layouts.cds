using EmergeService as em from '../srv/EmergeService';

//
// annotatios that control the fiori layout
//

annotate em.ProductSurvey with {
    Customer       @Search.defaultSearchElement : true;
    RepresentName  @Search.defaultSearchElement : true;
    RepresentTitle @Search.defaultSearchElement : true;
    Airframer      @Search.defaultSearchElement : true;
    Program        @Search.defaultSearchElement : true;
    Component      @Search.defaultSearchElement : true;
    //    ProductType       @Search.defaultSearchElement : true;
    //    Product           @Search.defaultSearchElement : true;
    //    ProductKitsNumber @Search.defaultSearchElement : true;
    BusinessShare  @Search.defaultSearchElement : true;
}

annotate em.Change with @UI : {
    HeaderInfo : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'Change History',
        TypeNamePlural : 'Changes'
    },
    LineItem   : [
        {
            $Type : 'UI.DataField',
            Value : FieldName
        },
        {
            $Type : 'UI.DataField',
            Value : OldValue
        },
        {
            $Type : 'UI.DataField',
            Value : NewValue
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt
        }
    ],
};

annotate em.ProductSurvey_Infos with @UI : {
    HeaderInfo                  : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'Product',
        TypeNamePlural : 'Products',
        ImageUrl       : 'sap-icon://product'
    },

    LineItem                    : [
        {
            $Type : 'UI.DataField',
            Value : Active
        },
        {
            $Type : 'UI.DataField',
            Value : ProductType_Id
        },
        {
            $Type : 'UI.DataField',
            Value : Product
        },
        {
            $Type : 'UI.DataField',
            Value : ProductKitsNumber
        }
    ],

    FieldGroup #ProductDetailFG : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : Active
            },
            {
                $Type : 'UI.DataField',
                Value : ProductType_Id
            },
            {
                $Type : 'UI.DataField',
                Value : Product
            },
            {
                $Type : 'UI.DataField',
                Value : ProductKitsNumber
            }
        ]
    },

    Facets                      : [{
        $Type  : 'UI.CollectionFacet',
        ID     : 'ProductDetail',
        Label  : 'Product info',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#ProductDetailFG'
        }]
    }],
};

annotate em.ProductSurvey with @UI : {
    //CreateHidden : true,   //-- not required for sprint 1

    HeaderInfo                        : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : '{i18n>ProductSurvey}',
        TypeNamePlural : '{i18n>ProductSurvey}',
        ImageUrl       : 'https://icon-library.com/images/products-icon/products-icon-5.jpg',
        Title          : {Value : RepresentName},
        Description    : {Value : RepresentTitle}
    },

    PresentationVariant               : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem'],
        SortOrder      : [{
            $Type      : 'Common.SortOrderType',
            Property   : Customer,
            Descending : true
        }]
    },

    SelectionFields                   : [
        Customer,
        Airframer_ID,
        Program_ID,
        Component_ID,
        //        ProductType_Id,
        createdAt,
        createdBy
    ],

    LineItem                          : [
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
            Value : Airframer_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : Program_ID
        },
        {
            $Type : 'UI.DataField',
            Value : Component_ID
        },
    ],

    HeaderFacets                      : [{
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#ClientLinkCRM',
        Label  : '{i18n>ClientLinkCRM}'
    }, ],

    Facets                            : [
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'ObjectInformation',
            Label  : '{i18n>ObjectInformation}',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#ObjectInformationFG'
            }, ]
        },
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'ProductInfo',
            Label  : 'Product info',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Target : 'to_Infos/@UI.LineItem'
            }]
        },
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'AdminData',
            Label  : '{i18n>AdminData}',
            Facets : [
                {
                    $Type  : 'UI.ReferenceFacet',
                    Target : '@UI.FieldGroup#CreationDetailsFG',
                    Label  : '{i18n>CreationDetails}'
                },
                {
                    $Type  : 'UI.ReferenceFacet',
                    Target : '@UI.FieldGroup#ModificationDetailsFG',
                    Label  : '{i18n>ModificationDetails}'
                }
            ]
        },
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'ChangeLog',
            Label  : 'Change History',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Target : 'to_Changes/@UI.LineItem'
            }]
        }
    ],

    FieldGroup #ClientLinkCRM         : {
        $Type : 'UI.FieldGroupType',
        Data  : [
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
        ]
    },

    FieldGroup #ObjectInformationFG   : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            // {
            //     $Type : 'UI.DataField',
            //     Value : AccountId
            // },
            // {
            //     $Type : 'UI.DataField',
            //     Value : System
            // },
            {
                $Type : 'UI.DataField',
                Value : Airframer_ID
            },
            {
                $Type : 'UI.DataField',
                Value : Program_ID
            },
            {
                $Type : 'UI.DataField',
                Value : Component_ID,
                Label : 'Major section/component',
            },
            {
                $Type : 'UI.DataField',
                Value : TotalComponents
            },
            /*            {
                            $Type : 'UI.DataField',
                            Value : Active
                        },
                        {
                            $Type : 'UI.DataField',
                            Value : ProductType_Id
                        },
                        {
                            $Type : 'UI.DataField',
                            Value : Product
                        },
                        {
                            $Type : 'UI.DataField',
                            Value : ProductKitsNumber
                        }, */
            {
                $Type : 'UI.DataField',
                Value : BusinessShare
            },
        ]
    },

    FieldGroup #CreationDetailsFG     : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : createdAt
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy
            }
        ]
    },

    FieldGroup #ModificationDetailsFG : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : modifiedAt
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy
            }
        ]
    }
};
