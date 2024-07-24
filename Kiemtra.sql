CREATE DATABASE newdatabase
GO 
CREATE TABLE Category(
    id int PRIMARY KEY IDENTITY,
    name VARCHAR(50),
)
GO
SELECT * FROM Category
GO          
INSERT INTO Category(name) VALUES ('dungcuhoctap')
GO

CREATE TABLE Product(
    id int PRIMARY KEY,
    cat_id int,
    name VARCHAR(50) NOT NULL,
    price bigint DEFAULT 1000,
    unit varchar(50),
    quantity int NULL,
    CONSTRAINT fk FOREIGN KEY(cat_id) REFERENCES Category(id)
)
GO

INSERT INTO Product(id, cat_id,name,price,unit,quantity)
VALUES (1,1,'but',1200,'cai',10),(2,1,'thuoc ke', 1300, 'cai',20);

UPDATE Product
set name = 'but chi'
WHERE id = 1;

DELETE FROM Product
WHERE id = 2;

SELECT * FROM Product
SELECT * FROM Category
GO

-- SELECT * FROM Product
-- WHERE name = 'but chi';

-- SELECT * FROM Product
-- WHERE price > 1000;
-- GO
