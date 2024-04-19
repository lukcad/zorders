using { Northwind } from '../db/schema.cds';

@path : '/service/Northwind'
service NorthwindSrv
{
    @odata.draft.enabled
    entity Categories as
        projection on Northwind.Categories;

    @odata.draft.enabled
    entity Products as
        projection on Northwind.Products;

    @odata.draft.enabled
    entity Suppliers as
        projection on Northwind.Suppliers;

    @odata.draft.enabled
    entity Employees as
        projection on Northwind.Employees;

    @odata.draft.enabled
    entity Orders as
        projection on Northwind.Orders
        actions
        {
            action Action1
            (
            )
            returns LargeString;
        };

    @odata.draft.enabled
    entity Customers as
        projection on Northwind.Customers;

    entity OrderDetails as
        projection on Northwind.OrderDetails;

}

annotate NorthwindSrv with @requires :
[
    'authenticated-user'
];
