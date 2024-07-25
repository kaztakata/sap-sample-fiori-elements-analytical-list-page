namespace kaztakata;

using
{
    cuid,
    managed
}
from '@sap/cds/common';

entity Books : cuid, managed
{
    title : String;
    category : String;
    stock : Integer;
}