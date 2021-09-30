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


annotate ah.Airframer with @UI : {
    HeaderInfo                        : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : '{i18n>Airframer}',
        TypeNamePlural : '{i18n>Airframers}',
        Title          : {Value : Name}
    },
    PresentationVariant               : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem'],
        SortOrder      : [{
            $Type      : 'Common.SortOrderType',
            Property   : AirframerId,
            Descending : true
        }]
    },
    SelectionFields                   : [
        Name,
        createdAt,
        createdBy
    ],
    LineItem                          : [
        {
            $Type : 'UI.DataField',
            Value : AirframerId
        },
        {
            $Type : 'UI.DataField',
            Value : Name
        }
    ],
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
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Target : 'to_Programs/@UI.LineItem',
            Label  : '{i18n>Programs}'
        }
    ],
    FieldGroup #ObjectInformationFG   : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : AirframerId
            },
            {
                $Type : 'UI.DataField',
                Value : Name
            }
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

annotate ah.Program with @UI : {
    HeaderInfo                        : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : '{i18n>Program}',
        TypeNamePlural : '{i18n>Programs}',
        Title          : {Value : Name}
    },
    PresentationVariant               : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem'],
        SortOrder      : [{
            $Type      : 'Common.SortOrderType',
            Property   : ProgramId,
            Descending : true
        }]
    },
    SelectionFields                   : [
        Name,
        Airframer_ID,
        createdAt,
        createdBy
    ],
    LineItem                          : [
        {
            $Type : 'UI.DataField',
            Value : ProgramId
        },
        {
            $Type : 'UI.DataField',
            Value : Name
        }
    ],
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
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Target : 'to_Components/@UI.LineItem',
            Label  : '{i18n>Components}'
        }
    ],
    FieldGroup #ObjectInformationFG   : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : ProgramId
            },
            {
                $Type : 'UI.DataField',
                Value : Name
            }
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

annotate ah.Component with @UI : {
    HeaderInfo                        : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : '{i18n>Component}',
        TypeNamePlural : '{i18n>Components}',
        Title          : {Value : Name}
    },
    PresentationVariant               : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem'],
        SortOrder      : [{
            $Type      : 'Common.SortOrderType',
            Property   : ComponentId,
            Descending : true
        }]
    },
    SelectionFields                   : [
        Name,
        Program_ID,
        createdAt,
        createdBy
    ],
    LineItem                          : [
        {
            $Type : 'UI.DataField',
            Value : ComponentId
        },
        {
            $Type : 'UI.DataField',
            Value : Name
        }
    ],
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
    FieldGroup #ObjectInformationFG   : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : ComponentId
            },
            {
                $Type : 'UI.DataField',
                Value : Name
            }
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
