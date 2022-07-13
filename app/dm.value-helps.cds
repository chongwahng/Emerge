using {ppg.Emerge as dm} from '../db/data-model';

//
// annotations for value helps
//

annotate dm.ProductSurvey {
    ProductType @Common.ValueListWithFixedValues;
    
    Airframer   @Common.ValueList : {
        CollectionPath  : 'Airframer',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : Airframer_ID,
                ValueListProperty : 'ID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'code'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Name'
            }
        ],
        SearchSupported : true
    }; 

    Program     @Common.ValueList : {
        CollectionPath  : 'Program',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : Program_ID,
                ValueListProperty : 'ID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'code'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Name'
            },
            {
                $Type             : 'Common.ValueListParameterIn',
                LocalDataProperty : Airframer_ID,
                ValueListProperty : 'to_Airframer_ID',
            }
        ],
        SearchSupported : true
    };

    Component   @Common.ValueList : {
        CollectionPath  : 'Component',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : Component_ID,
                ValueListProperty : 'ID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'code'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Name'
            },
            {
                $Type             : 'Common.ValueListParameterIn',
                LocalDataProperty : Program_ID,
                ValueListProperty : 'to_Program_ID',
            }
        ],
        SearchSupported : true
    };
} 
