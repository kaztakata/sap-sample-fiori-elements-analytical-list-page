using {kaztakata as my} from '../db/schema';

service UserService {
    @readonly entity Books as projection on my.Books;
}

//1. Aggregation and analytical annotations
annotate UserService.Books with @(
  Aggregation.ApplySupported: {
    Transformations: [
      'aggregate'     
    ],
    AggregatableProperties: [{ 
      $Type : 'Aggregation.AggregatablePropertyType',
      Property: stock
    }]
  },
  Analytics.AggregatedProperty #totalStock: {
    $Type : 'Analytics.AggregatedPropertyType',
    AggregatableProperty : stock,
    AggregationMethod : 'sum',
    Name : 'totalStock'
  },
);

//2. Main chart
annotate UserService.Books with @(
  UI.Chart: {
    $Type : 'UI.ChartDefinitionType',
    Title: 'Stock',
    ChartType : #Pie,
    Dimensions: [
      category1
    ],
    DimensionAttributes: [],
    DynamicMeasures: [
      ![@Analytics.AggregatedProperty#totalStock]
    ],
    MeasureAttributes: [{
      $Type: 'UI.ChartMeasureAttributeType',
      DynamicMeasure: ![@Analytics.AggregatedProperty#totalStock],
      Role: #Axis1
    }]
  },
  UI.PresentationVariant: {
    $Type : 'UI.PresentationVariantType',
    Visualizations : [
        '@UI.Chart',
    ],
  }
);

//4. Selection Fields and Line Item
annotate UserService.Books with@(
    UI: {
        LineItem: [
        ],
    }
);