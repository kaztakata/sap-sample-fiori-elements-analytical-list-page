namespace kaztakata;

using
{
    Currency,
    cuid,
    managed
}
from '@sap/cds/common';

entity Books : cuid, managed
{
    title : String(111);
    category1 : String(1111);
    category2 : String(1111);
    stock : Integer;
    price : Decimal;
    currency : Currency;
    publishedAt: Date;
}