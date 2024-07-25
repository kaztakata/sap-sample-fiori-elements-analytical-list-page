using UserService as service from '../../srv/user-service';

// manually maintained
annotate service.Books with @UI.Chart : 
{
    Title : 'Stock',
    ChartType : #Pie,
    AxisScaling :
    {
        ScaleBehavior : #AutoScale,
        AutoScaleBehavior :
        {
            ZeroAlwaysVisible : true,
            DataScope : #DataSet
        }
    },
    DynamicMeasures :
    [
        ![@Analytics.AggregatedProperty#totalStock]
    ],
    MeasureAttributes :
    [
        {
            DynamicMeasure : ![@Analytics.AggregatedProperty#totalStock],
            Role : #Axis1,
            UseSequentialColorLevels : false
        }
    ],
    Dimensions :
    [
        category
    ]
};

// manually maintained
annotate service.Books with @UI.PresentationVariant : 
{
    IncludeGrandTotal : false,
    InitialExpansionLevel : 1,
    Visualizations :
    [
        '@UI.Chart'
    ]
};

// manually maintained as @UI.LineItem : [] then generated via Page Map
annotate service.Books with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : 'title',
        },
        {
            $Type : 'UI.DataField',
            Value : category,
            Label : 'category',
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : 'stock',
        },
    ]
);
annotate service.Books with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Main',
            ID : 'Main',
            Target : '@UI.FieldGroup#Main',
        },
    ],
    UI.FieldGroup #Main : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : 'title',
            },{
                $Type : 'UI.DataField',
                Value : category,
                Label : 'category',
            },{
                $Type : 'UI.DataField',
                Value : stock,
                Label : 'stock',
            },],
    }
);
annotate service.Books with @(
    UI.SelectionFields : [
        title,
        category,
    ]
);
annotate service.Books with {
    category @Common.Label : 'category'
};
annotate service.Books with {
    title @Common.Label : 'title'
};
