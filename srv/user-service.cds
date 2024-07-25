using { kaztakata as my } from '../db/schema';

service UserService
{
    annotate Books
    {
        stock
            @Aggregation.default : #sum;
    }

    annotate Books with @Aggregation.ApplySupported : 
    {
        $Type : 'Aggregation.ApplySupportedType',
        Transformations :
        [
            'aggregate'
        ],
        Rollup : #MultipleHierarchies,
        From : true,
        GroupableProperties :
        [
            title,
            category
        ],
        AggregatableProperties :
        [
            {
                Property : stock,
                SupportedAggregationMethods :
                [
                    'sum'
                ]
            }
        ]
    };

    // manually maintained
    annotate Books with @Analytics.AggregatedProperty#totalStock : 
    {
        Name : 'totalStock',
        AggregationMethod : 'sum',
        AggregatableProperty : stock
    };

    // manually maintained
    annotate Books with @Aggregation.CustomAggregate#stock : 'Edm.Integer';

    @readonly
    entity Books as
        projection on my.Books;
}
