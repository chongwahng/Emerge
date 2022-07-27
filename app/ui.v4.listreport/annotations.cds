using ReportService as service from '../../srv/EmergeService';

annotate service.ProductSurvey with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : AirframerName,
        },
        {
            $Type : 'UI.DataField',
            Value : ProgramName,
        },
        {
            $Type : 'UI.DataField',
            Value : ComponentName,
        },
        {
            $Type : 'UI.DataField',
            Value : TotalComponents,
        },
        {
            $Type : 'UI.DataField',
            Value : BusinessShare,
        },
    ]
);
annotate service.ProductSurvey with @(
    UI.SelectionFields: [
        AirframerName,
        ProgramName,
        ComponentName
    ],
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : AirframerName,
            },
            {
                $Type : 'UI.DataField',
                Value : ProgramName,
            },
            {
                $Type : 'UI.DataField',
                Value : ComponentName,
            },
            {
                $Type : 'UI.DataField',
                Value : TotalComponents,
            },
            {
                $Type : 'UI.DataField',
                Value : BusinessShare,
            },
            {
                $Type : 'UI.DataField',
                Value : Active,
            },
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : Product,
            },
            {
                $Type : 'UI.DataField',
                Value : ProductKitsNumber,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
