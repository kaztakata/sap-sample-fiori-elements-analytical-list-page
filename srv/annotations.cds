using UserService as service from './user-service';

annotate service.Books with @UI.LineItem: [];
annotate service.Books with @UI.PresentationVariant: {Visualizations: ['@UI.Chart']};
annotate service.Books with @UI.Chart: {
  Title: 'Stock',
  ChartType : #Pie,
  Dimensions: [category],
  DynamicMeasures: [@Analytics.AggregatedProperty#totalStock],
  MeasureAttributes: [{
    DynamicMeasure: @Analytics.AggregatedProperty#totalStock,
    Role: #Axis1
  }]
};
annotate service.Books with @Analytics.AggregatedProperty#totalStock: {
  AggregatableProperty : stock,
  AggregationMethod : 'sum',
  Name : 'totalStock'
};
annotate service.Books with @Aggregation.ApplySupported.AggregatableProperties: [{Property: stock}];
annotate service.Books with @Aggregation.ApplySupported.Transformations: ['aggregate'];
