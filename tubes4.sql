/*tampilkan nama produk dan harganya, khusus untuk produk produk yang 
harganya berada di atas rata-rata*/
SELECT name_product, price 
FROM product
WHERE price >(
	SELECT AVG (price)
	FROM product
);

/*Tampilkan outlet yang memiliki jumlah stock lebih besar dari rata-rata seluruh stock*/
SELECT id_outlet, name_outlet
FROM Outlet
WHERE id_outlet IN (
    SELECT id_outlet
    FROM Stock
    WHERE jumlah_stock > (
        SELECT AVG(jumlah_stock)
        FROM Stock
    )
);

SELECT 
	ou.name_outlet,
   SUM(p.total_price) AS total_nilai_pembelanjaan
FROM Outlet ou
JOIN `Order` o ON ou.id_outlet = o.id_outlet
JOIN Payment p ON o.id_order = p.id_order
WHERE p.status_payment = 'Lunas'
GROUP BY ou.name_outlet;

