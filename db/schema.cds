namespace Northwind;

entity Categories {
  key ID: UUID;
  CategoryID: Integer @assert.unique @mandatory;
  CategoryName: String(15);
  Description: String(200);
  Picture: String(255);
  products: Association to many Products on products.category = $self;
  suppliers: Association to many Suppliers on suppliers.categories = $self;
}

entity Products {
  key ID: UUID;
  ProductID: Integer @assert.unique @mandatory;
  ProductName: String(40);
  QuantityPerUnit: String(20);
  UnitPrice: Decimal(10,4);
  UnitsInStock: Integer;
  Discontinued: Boolean;
  category: Association to Categories;
  supplier: Association to Suppliers;
  orderdetails: Association to many OrderDetails on orderdetails.product = $self;
}

entity Suppliers {
  key ID: UUID;
  SupplierID: Integer @assert.unique @mandatory;
  CompanyName: String(40);
  ContactName: String(30);
  ContactTitle: String(30);
  Address: String(60);
  City: String(15);
  Region: String(15);
  PostalCode: String(10);
  Country: String(15);
  Phone: String(24);
  Fax: String(24);
  HomePage: String(255);
  products: Association to many Products on products.supplier = $self;
  categories: Association to Categories;
}

entity Employees {
  key ID: UUID;
  EmployeeID: Integer @assert.unique @mandatory;
  LastName: String(20);
  FirstName: String(10);
  Title: String(30);
  TitleOfCourtesy: String(25);
  BirthDate: Date;
  HireDate: Date;
  Address: String(60);
  City: String(15);
  Region: String(15);
  PostalCode: String(10);
  Country: String(15);
  HomePhone: String(24);
  Extension: String(4);
  Photo: String(255);
  Notes: String(255);
  ReportsTo: Integer;
  PhotoPath: String(255);
  orders: Association to many Orders on orders.employee = $self;
}

entity Orders {
  key ID: UUID;
  OrderID: Integer @assert.unique @mandatory;
  OrderDate: DateTime;
  RequiredDate: DateTime;
  ShippedDate: DateTime;
  ShipVia: Integer;
  Freight: Decimal(10,4);
  ShipName: String(40);
  ShipAddress: String(60);
  ShipCity: String(15);
  ShipRegion: String(15);
  ShipPostalCode: String(10);
  ShipCountry: String(15);
  customer: Association to Customers;
  employee: Association to Employees;
  orderDetails: Composition of many OrderDetails on orderDetails.order = $self;

}

entity Customers {
  key ID: UUID;
  CustomerID: String(5) @assert.unique @mandatory;
  CompanyName: String(40);
  ContactName: String(30);
  ContactTitle: String(30);
  Address: String(60);
  City: String(15);
  Region: String(15);
  PostalCode: String(10);
  Country: String(15);
  Phone: String(24);
  Fax: String(24);
  orders: Association to many Orders on orders.customer = $self;
}

entity OrderDetails {
  key ID: UUID;
  UnitPrice: Decimal(10,4);
  Quantity: Integer;
  Discount: Double;
  order: Association to Orders;
  product: Association to Products;
}

/**
 * 
 * Products has crtiticality positive if it is not discontinued
 */
extend Products with {
    criticality : Integer = (case when Discontinued = False then 3 else 2 end ) stored;
    ProductStatus : String(15) = (case when Discontinued = False then 'Active' else 'Discontinued' end ) stored;
}
/**
 * 
 * Orders has crtiticality positive if it is shipped
 */	
extend Orders with {
    criticality : Integer = (case when ShippedDate is not null then 3 else 2 end ) stored;
    ShipStatus : String(15) = (case when ShippedDate is not null then 'Shipped' else 'Not' end ) stored;
 }

/**
 * Cost per each element is needing to easily calculate total price
 */
extend OrderDetails with {
    cost : Decimal(10,4) = ( UnitPrice * Quantity - Discount ) stored;
}
