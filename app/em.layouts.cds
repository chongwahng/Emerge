using EmergeService as em from '../srv/EmergeService';
using AirframerService as ah from '../srv/AirframerService';

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
        ProductType_Id,
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
                },
            ]
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
                Value : Component_ID
            },
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
            },
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

// annotate ah.Airframers with @UI : {
//     HeaderInfo                        : {
//         $Type          : 'UI.HeaderInfoType',
//         TypeName       : '{i18n>Airframer}',
//         TypeNamePlural : '{i18n>Airframer}',
//         Title          : {Value : Name},
//         Description    : {Value : Type}
//     },
//     PresentationVariant               : {
//         Text           : 'Default',
//         Visualizations : ['@UI.LineItem'],
//         SortOrder      : [{
//             $Type      : 'Common.SortOrderType',
//             Property   : Id,
//             Descending : true
//         }]
//     },
//     SelectionFields                   : [
//         Name,
//         Type,
//         createdAt,
//         createdBy
//     ],
//     LineItem                          : [
//         {
//             $Type : 'UI.DataField',
//             Value : Id
//         },
//         {
//             $Type : 'UI.DataField',
//             Value : Name
//         },
//         {
//             $Type : 'UI.DataField',
//             Value : Type
//         }
//     ],
//     Facets                            : [
//         {
//             $Type  : 'UI.CollectionFacet',
//             ID     : 'ObjectInformation',
//             Label  : '{i18n>ObjectInformation}',
//             Facets : [{
//                 $Type  : 'UI.ReferenceFacet',
//                 Target : '@UI.FieldGroup#ObjectInformationFG'
//             }, ]
//         },
//         {
//             $Type  : 'UI.CollectionFacet',
//             ID     : 'AdminData',
//             Label  : '{i18n>AdminData}',
//             Facets : [
//                 {
//                     $Type  : 'UI.ReferenceFacet',
//                     Target : '@UI.FieldGroup#CreationDetailsFG',
//                     Label  : '{i18n>CreationDetails}'
//                 },
//                 {
//                     $Type  : 'UI.ReferenceFacet',
//                     Target : '@UI.FieldGroup#ModificationDetailsFG',
//                     Label  : '{i18n>ModificationDetails}'
//                 },
//             ]
//         },
//         {
//             $Type  : 'UI.ReferenceFacet',
//             Target : 'Children/@UI.LineItem',
//             Label  : '{i18n>Program}'
//         }
//     ],
//     FieldGroup #ObjectInformationFG   : {
//         $Type : 'UI.FieldGroupType',
//         Data  : [
//             {
//                 $Type : 'UI.DataField',
//                 Value : Id
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : Name
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : Type
//             }
//         ]
//     },
//     FieldGroup #CreationDetailsFG     : {
//         $Type : 'UI.FieldGroupType',
//         Data  : [
//             {
//                 $Type : 'UI.DataField',
//                 Value : createdAt
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : createdBy
//             }
//         ]
//     },
//     FieldGroup #ModificationDetailsFG : {
//         $Type : 'UI.FieldGroupType',
//         Data  : [
//             {
//                 $Type : 'UI.DataField',
//                 Value : modifiedAt
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : modifiedBy
//             }
//         ]
//     }
// };

// annotate ah.Programs with @UI : {
//     HeaderInfo                        : {
//         $Type          : 'UI.HeaderInfoType',
//         TypeName       : '{i18n>Program}',
//         TypeNamePlural : '{i18n>Program}',
//         Title          : {Value : Name},
//         Description    : {Value : Type}
//     },
//     PresentationVariant               : {
//         Text           : 'Default',
//         Visualizations : ['@UI.LineItem'],
//         SortOrder      : [{
//             $Type      : 'Common.SortOrderType',
//             Property   : Id,
//             Descending : true
//         }]
//     },
//     SelectionFields                   : [
//         Name,
//         Type,
//         Parent_Id,
//         createdAt,
//         createdBy
//     ],
//     LineItem                          : [
//         {
//             $Type : 'UI.DataField',
//             Value : Id
//         },
//         {
//             $Type : 'UI.DataField',
//             Value : Name
//         },
//         {
//             $Type : 'UI.DataField',
//             Value : Type
//         },
//         {
//             $Type : 'UI.DataField',
//             Value : Parent_Id
//         }
//     ],
//     Facets                            : [
//         {
//             $Type  : 'UI.CollectionFacet',
//             ID     : 'ObjectInformation',
//             Label  : '{i18n>ObjectInformation}',
//             Facets : [{
//                 $Type  : 'UI.ReferenceFacet',
//                 Target : '@UI.FieldGroup#ObjectInformationFG'
//             }, ]
//         },
//         {
//             $Type  : 'UI.CollectionFacet',
//             ID     : 'AdminData',
//             Label  : '{i18n>AdminData}',
//             Facets : [
//                 {
//                     $Type  : 'UI.ReferenceFacet',
//                     Target : '@UI.FieldGroup#CreationDetailsFG',
//                     Label  : '{i18n>CreationDetails}'
//                 },
//                 {
//                     $Type  : 'UI.ReferenceFacet',
//                     Target : '@UI.FieldGroup#ModificationDetailsFG',
//                     Label  : '{i18n>ModificationDetails}'
//                 },
//             ]
//         },
//         {
//             $Type  : 'UI.ReferenceFacet',
//             Target : 'Children/@UI.LineItem',
//             Label  : '{i18n>Component}'
//         }
//     ],
//     FieldGroup #ObjectInformationFG   : {
//         $Type : 'UI.FieldGroupType',
//         Data  : [
//             {
//                 $Type : 'UI.DataField',
//                 Value : Id
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : Name
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : Type
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : Parent_Id
//             }
//         ]
//     },
//     FieldGroup #CreationDetailsFG     : {
//         $Type : 'UI.FieldGroupType',
//         Data  : [
//             {
//                 $Type : 'UI.DataField',
//                 Value : createdAt
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : createdBy
//             }
//         ]
//     },
//     FieldGroup #ModificationDetailsFG : {
//         $Type : 'UI.FieldGroupType',
//         Data  : [
//             {
//                 $Type : 'UI.DataField',
//                 Value : modifiedAt
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : modifiedBy
//             }
//         ]
//     }
// };

// annotate ah.Components with @UI : {
//     HeaderInfo                        : {
//         $Type          : 'UI.HeaderInfoType',
//         TypeName       : '{i18n>Component}',
//         TypeNamePlural : '{i18n>Component}',
//         Title          : {Value : Name},
//         Description    : {Value : Type}
//     },
//     PresentationVariant               : {
//         Text           : 'Default',
//         Visualizations : ['@UI.LineItem'],
//         SortOrder      : [{
//             $Type      : 'Common.SortOrderType',
//             Property   : Id,
//             Descending : true
//         }]
//     },
//     SelectionFields                   : [
//         Name,
//         Type,
//         Parent_Id,
//         createdAt,
//         createdBy
//     ],
//     LineItem                          : [
//         {
//             $Type : 'UI.DataField',
//             Value : Id
//         },
//         {
//             $Type : 'UI.DataField',
//             Value : Name
//         },
//         {
//             $Type : 'UI.DataField',
//             Value : Type
//         },
//         {
//             $Type : 'UI.DataField',
//             Value : Parent_Id
//         }
//     ],
//     Facets                            : [
//         {
//             $Type  : 'UI.CollectionFacet',
//             ID     : 'ObjectInformation',
//             Label  : '{i18n>ObjectInformation}',
//             Facets : [{
//                 $Type  : 'UI.ReferenceFacet',
//                 Target : '@UI.FieldGroup#ObjectInformationFG'
//             }, ]
//         },
//         {
//             $Type  : 'UI.CollectionFacet',
//             ID     : 'AdminData',
//             Label  : '{i18n>AdminData}',
//             Facets : [
//                 {
//                     $Type  : 'UI.ReferenceFacet',
//                     Target : '@UI.FieldGroup#CreationDetailsFG',
//                     Label  : '{i18n>CreationDetails}'
//                 },
//                 {
//                     $Type  : 'UI.ReferenceFacet',
//                     Target : '@UI.FieldGroup#ModificationDetailsFG',
//                     Label  : '{i18n>ModificationDetails}'
//                 },
//             ]
//         }
//     ],
//     FieldGroup #ObjectInformationFG   : {
//         $Type : 'UI.FieldGroupType',
//         Data  : [
//             {
//                 $Type : 'UI.DataField',
//                 Value : Id
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : Name
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : Type
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : Parent_Id
//             }
//         ]
//     },
//     FieldGroup #CreationDetailsFG     : {
//         $Type : 'UI.FieldGroupType',
//         Data  : [
//             {
//                 $Type : 'UI.DataField',
//                 Value : createdAt
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : createdBy
//             }
//         ]
//     },
//     FieldGroup #ModificationDetailsFG : {
//         $Type : 'UI.FieldGroupType',
//         Data  : [
//             {
//                 $Type : 'UI.DataField',
//                 Value : modifiedAt
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : modifiedBy
//             }
//         ]
//     }
// };