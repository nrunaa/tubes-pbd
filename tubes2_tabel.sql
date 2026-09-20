
CREATE TABLE Brand (
    id_brand CHAR(5) PRIMARY KEY,
    name_brand VARCHAR(100) NOT NULL
);

CREATE TABLE Category (
    id_category CHAR(5) PRIMARY KEY,
    name_category VARCHAR(100) NOT NULL
);

CREATE TABLE Sales (
    id_sales CHAR(5) PRIMARY KEY,
    name_sales VARCHAR(100) NOT NULL
);


CREATE TABLE Outlet (
    id_outlet CHAR(5) PRIMARY KEY,
    id_sales CHAR(5) NOT NULL,
    name_outlet VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL,
    nama_PIC VARCHAR(100) NOT NULL,
    nomor_PIC VARCHAR(20) NOT NULL,
    email_PIC VARCHAR(100) NOT NULL,
    CONSTRAINT FK_outlet_sales FOREIGN KEY (id_sales) REFERENCES Sales(id_sales)
);


CREATE TABLE Product (
    id_product CHAR(5) PRIMARY KEY,
    name_product VARCHAR(100) NOT NULL,
    price INTEGER NOT NULL,
    id_brand CHAR(5) NOT NULL,
    id_category CHAR(5) NOT NULL,
    CONSTRAINT FK_product_brand FOREIGN KEY (id_brand) REFERENCES Brand(id_brand),
    CONSTRAINT FK_product_category FOREIGN KEY (id_category) REFERENCES Category(id_category)
);



CREATE TABLE Variant (
    id_variant CHAR(5) PRIMARY KEY,
    name_variant VARCHAR(100) NOT NULL,
    id_product CHAR(5) NOT NULL,
    CONSTRAINT FK_variant_product FOREIGN KEY (id_product) REFERENCES Product(id_product)
);



CREATE TABLE Packsize (
    id_packsize CHAR(5) PRIMARY KEY,
    id_product CHAR(5) NOT NULL,
    size VARCHAR(50) NOT NULL,
    CONSTRAINT FK_packsize_product FOREIGN KEY (id_product) REFERENCES Product(id_product)
);



CREATE TABLE Stock (
    id_stock CHAR(5) PRIMARY KEY,
    id_product CHAR(5) NOT NULL,
    jumlah_stock INT NOT NULL DEFAULT 0,
    id_outlet CHAR(5) NOT NULL,
    CONSTRAINT FK_stock_product FOREIGN KEY (id_product) REFERENCES Product(id_product),
    CONSTRAINT FK_stock_outlet FOREIGN KEY (id_outlet) REFERENCES Outlet(id_outlet)
);



CREATE TABLE `Order` (
    id_order CHAR(5) PRIMARY KEY,
    date_order DATE NOT NULL,
    time_order TIME NOT NULL,
    id_sales CHAR(5) NOT NULL,
    id_outlet CHAR(5) NOT NULL,
    CONSTRAINT FK_order_sales FOREIGN KEY (id_sales) REFERENCES Sales(id_sales),
    CONSTRAINT FK_order_outlet FOREIGN KEY (id_outlet) REFERENCES Outlet(id_outlet)
);


CREATE TABLE Detail_Order (
    id_detail CHAR(5) PRIMARY KEY,
    qty INT NOT NULL,
    price_pcs INT NOT NULL,
    id_stock CHAR(5) NOT NULL,
    id_order CHAR(5) NOT NULL,
    CONSTRAINT FK_detail_stock FOREIGN KEY (id_stock) REFERENCES Stock(id_stock),
    CONSTRAINT FK_detail_order FOREIGN KEY (id_order) REFERENCES `Order`(id_order)
);


CREATE TABLE Payment (
    id_payment CHAR(5) PRIMARY KEY,
    metode_payment VARCHAR(50) NOT NULL,
    date_payment DATE NOT NULL,
    total_price INT NOT NULL,
    status_payment VARCHAR(20) NOT NULL,
    id_order CHAR(5) NOT NULL,
    CONSTRAINT FK_payment_order FOREIGN KEY (id_order) REFERENCES `Order`(id_order)
);

