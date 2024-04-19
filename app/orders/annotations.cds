using NorthwindSrv as service from '../../srv/service';


annotate service.Orders with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : OrderID,
            Label : '{i18n>OrderId}',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>OrderCreated}',
            Value : OrderDate,
        },
        {
            $Type : 'UI.DataField',
            Value : ShipCity,
            Label : '{i18n>ShipCity}',
        },
        {
            $Type : 'UI.DataField',
            Value : ShipCountry,
            Label : '{i18n>ShipCountry}',
        },
        {
            $Type : 'UI.DataField',
            Value : ShipName,
            Label : '{i18n>ShipName}',
        },
        {
            $Type : 'UI.DataField',
            Value : ShipStatus,
            Label : '{i18n>ShipStatus}',
            Criticality : criticality,
        },
    ]
);
annotate service.Orders with {
    customer @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Customers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : customer_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'CustomerID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'CompanyName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'ContactName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'ContactTitle',
            },
        ],
    }
};
annotate service.Orders with {
    employee @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Employees',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : employee_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'EmployeeID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'LastName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'FirstName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Title',
            },
        ],
    }
};
annotate service.Orders with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>OrderId}',
                Value : OrderID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>OrderCreated}',
                Value : OrderDate,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>OrderRequired}',
                Value : RequiredDate,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>OrderShipped}',
                Value : ShippedDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Ship Via',
                Value : ShipVia,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Freight',
                Value : Freight,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>ShipName}',
                Value : ShipName,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>ShipAddress}',
                Value : ShipAddress,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>ShipCity}',
                Value : ShipCity,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>ShipRegion}',
                Value : ShipRegion,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>ShipPostalCode}',
                Value : ShipPostalCode,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>ShipCountry}',
                Value : ShipCountry,
            },
            {
                $Type : 'UI.DataFieldForAction',
                Action : 'NorthwindSrv.Action1',
                Label : '{i18n>Loyalty}',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Order header',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>OrderItems}',
            ID : 'i18nOrderItems',
            Target : 'orderDetails/@UI.LineItem#i18nOrderItems',
        },
    ]
);
annotate service.OrderDetails with @(
    UI.LineItem #OrderItems : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : order_ID,
            Label : 'order_ID',
        },
        {
            $Type : 'UI.DataField',
            Value : product_ID,
            Label : 'Product',
        },{
            $Type : 'UI.DataField',
            Value : Quantity,
            Label : 'Quantity',
        },
        {
            $Type : 'UI.DataField',
            Value : Discount,
            Label : 'Discount',
        },
        {
            $Type : 'UI.DataField',
            Value : UnitPrice,
            Label : '{i18n>UnitPrice}',
        },
        {
            $Type : 'UI.DataField',
            Value : product.ProductStatus,
            Label : '{i18n>ProductStatus}',
            Criticality : product.criticality,
            ![@Common.FieldControl] : #ReadOnly,
        },]
);
annotate service.OrderDetails with {
    product @Common.Text : {
            $value : product.ProductName,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.Products with {
    ID @Common.Text : {
        $value : ProductName,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.OrderDetails with {
    product @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Products',
            Parameters : [
                    {
                        $Type : 'Common.ValueListParameterInOut',
                        LocalDataProperty : product_ID,
                        ValueListProperty : 'ID',
                    },
                    {
                        $Type : 'Common.ValueListParameterOut',
                        ValueListProperty : 'UnitPrice',
                        LocalDataProperty : UnitPrice,
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'Discontinued',
                    },
                ],
            Label : 'Products',
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.Products with {
    ProductStatus @Common.FieldControl : #ReadOnly
};

annotate service.OrderDetails with @(
    UI.LineItem #i18nOrderItems : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
            ![@UI.Hidden],
        },{
            $Type : 'UI.DataField',
            Value : order_ID,
            Label : 'order_ID',
            ![@UI.Hidden],
        },{
            $Type : 'UI.DataField',
            Value : product_ID,
            Label : '{i18n>Product}',
        },{
            $Type : 'UI.DataField',
            Value : Quantity,
            Label : 'Quantity',
        },
        {
            $Type : 'UI.DataField',
            Value : UnitPrice,
            Label : '{i18n>UnitPrice}',
        },{
            $Type : 'UI.DataField',
            Value : Discount,
            Label : 'Discount',
        },
        {
            $Type : 'UI.DataField',
            Value : cost,
            Label : '{i18n>Cost}',
        },
        {
            $Type : 'UI.DataField',
            Value : product.ProductStatus,
            Label : '{i18n>ProductStatus}',
            Criticality : product.criticality,
        },]
);
annotate service.OrderDetails with {
    product @Common.FieldControl : #Mandatory
};
annotate service.OrderDetails with {
    UnitPrice @Common.FieldControl : #ReadOnly
};
annotate service.OrderDetails with {
    Quantity @Common.FieldControl : #Mandatory
};
annotate service.OrderDetails with {
    cost @Common.FieldControl : #ReadOnly
};
