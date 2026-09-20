CREATE TABLE acara(
	id_acara VARCHAR (100) PRIMARY KEY,
	nama_acara VARCHAR(100) NOT NULL,
	tanggal date NOT NULL,
	deskripsi TEXT,
	kapasitas INT(100) NOT NULL,
	lokasi_acara VARCHAR(100) NOT NULL
	
);

CREATE TABLE tiket(

	id_tiket VARCHAR (100) PRIMARY KEY,
	id_acara VARCHAR(100) NOT NULL,
	jenis_tiket VARCHAR(100) NOT NULL,
	harga DECIMAL,
	jumlah INT NOT NULL,
	CONSTRAINT FK_id_acara FOREIGN KEY(id_acara) 
	REFERENCES acara(id_acara)
);
	

CREATE TABLE pelanggan(
	id_pelanggan VARCHAR (100) PRIMARY KEY,
	nama VARCHAR(100) NOT NULL,
	tanggal date NOT NULL,
	alamat TEXT,
	no_telp VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL
);


CREATE TABLE penjualan(
	id_penjualan VARCHAR (100) PRIMARY KEY, 
	id_pelanggan VARCHAR(100) NOT NULL,
	id_tiket VARCHAR(100) NOT NULL,
	tanggal date NOT NULL,
	jumlah INT NOT NULL,
	CONSTRAINT FK_id_pelanggan FOREIGN KEY(id_pelanggan) 
	REFERENCES pelanggan(id_pelanggan),
	CONSTRAINT FK_id_tiket FOREIGN KEY(id_tiket) 
	REFERENCES tiket(id_tiket)
);

INSERT INTO pelanggan VALUES
('SWM', 'Setyawan Mulia', '2024-01-15', 'Jl. Merdeka No. 10, Jakarta', '081234567890', 'swm@email.com'),
('ALP', 'Alif Putra', '2024-02-20', 'Jl. Mawar No. 5, Bandung', '082198765432', 'alif.p@email.com'),
('THR', 'Thariq Ramadan', '2024-03-10', 'Jl. Melati No. 12, Surabaya', '085711223344', 'thariq@email.com'),
('LWN', 'Lawan Wijaya', '2024-04-05', 'Jl. Dahlia No. 8, Yogyakarta', '089988776655', 'lwn.wijaya@email.com'),
('UIP', 'Utami Indah Putri', '2024-05-12', 'Jl. Anggrek No. 3, Semarang', '081344556677', 'uip.putri@email.com'),
('AKR', 'Akbar Rais', '2024-06-01', 'Jl. Kenanga No. 21, Medan', '087766554433', 'akbar.r@email.com');

SELECT * FROM acara;
INSERT INTO acara 
VALUES
('a1', 'konser bp','2025-02-02', 'konser girlgroup', 1000, 'GBK');
INSERT INTO acara 
VALUES
('a2', 'konser bmth','2025-06-08', 'konser band', 500, 'istora'),
('a3', 'konser so7', '2025-05-05', 'konser band', 550, 'istora'),
('a4', 'konser dewa','2025-03-03', 'konser band', 1000, 'GBK'),
('a5', 'konser dangdut','2025-09-08', 'konser dangdut', 500, 'GBK'),
('a6', 'konser the adams', '2025-07-05', 'konser band', 550, 'istora'),
('a7', 'konser apink','2025-04-02', 'konser girlgroup', 1000, 'GBK'),
('a8', 'konser padi','2025-04-08', 'konser band', 500, 'istora'),
('a9', 'konser wali', '2025-03-05', 'konser band', 550, 'istora'),
('a10', 'konser btc','2025-03-01', 'konser band', 1000, 'GBK'),
('a11', 'konser dangdut','2025-10-08', 'konser dangdut', 500, 'GBK'),
('a12', 'konser hivi', '2025-12-05', 'konser band', 550, 'istora'),
('a13', 'konser bp','2025-11-02', 'konser girlgroup', 1000, 'GBK'),
('a14', 'konser bmth','2025-02-08', 'konser band', 500, 'istora'),
('a15', 'konser so7', '2025-01-05', 'konser band', 550, 'istora');

SELECT nama_acara, tanggal, lokasi_acara FROM acara

SELECT * FROM acara
WHERE deskripsi = 'konser band';

INSERT INTO penjualan
VALUES
('p1', 'SWM', 't1', '2025-06-08', 10),
('p2', 'ALP', 't2','2025-07-07', 15),
('p3', 'ALP',	't3','2025-09-10', 25),
('p4', 'THR',	't4','2025-09-20', 10),
('P5', 'LWN',	't5', '2025-05-04', 6),
('P7', 'UIP','t6','2025-01-10', 17),
('P8', 'AKR','t7','2025-05-03', 21),
('p9', 'SWM', 't1', '2025-06-08', 10),
('p10', 'ALP', 't2','2025-07-07', 15),
('p11', 'ALP',	't3','2025-09-10', 25),
('p12', 'THR',	't4','2025-09-20', 10),
('P13', 'LWN',	't5', '2025-05-04', 6),
('P14', 'UIP','t6','2025-01-10', 17),
('P15', 'AKR','t7','2025-05-03', 21);

SELECT * FROM penjualan WHERE tanggal LIKE '%2025-09%'

INSERT INTO tiket VALUES
('t1', 'a1', 'VVIP', 1500000, 1000);
INSERT INTO tiket VALUES
('t2', 'a2', 'regular', 500000, 500),
('t3', 'a3', 'vip', 1000000, 550),
('t4', 'a4', 'classic', 250000, 500),
('t5', 'a5', 'VVIP', 1500000, 1000),
('t6', 'a6', 'VVIP', 1500000, 1000),
('t7', 'a7', 'regular', 500000, 500);
INSERT INTO tiket VALUES
('t8', 'a8', 'vip', 1000000, 550),
('t9', 'a9', 'classic', 250000, 500),
('t10', 'a10', 'VVIP', 1500000, 1000),
('t11', 'a11', 'VVIP', 1500000, 1000),
('t12', 'a12', 'reguler', 450000, 500),
('t13', 'a13', 'VVIP', 1500000, 1000),
('t14', 'a14', 'regular', 500000, 500),
('t15', 'a15', 'vip', 1000000, 550);

SELECT * FROM tiket WHERE jenis_tiket = "VVIP" OR jenis_tiket = "regular"

SELECT * FROM penjualan WHERE id_pelanggan = 'LWN'

SELECT nama_acara AS EVENTS
FROM acara;

SELECT jenis_tiket, COUNT(*) AS jumlah 
FROM tiket
GROUP BY jenis_tiket
HAVING COUNT(*)>2;

SELECT * FROM tiket
WHERE harga BETWEEN 50000 AND 1000000;

SELECT * FROM acara
WHERE nama_acara LIKE '%konser_btc%';

SELECT nama 
FROM pelanggan
ORDER BY nama ASC;

SELECT nama_acara FROM acara
LIMIT 10;

SELECT nama AS rajaTerakhir
FROM pelanggan;

SELECT * FROM penjualan WHERE id_pelanggan = 'ALP';

SELECT * FROM tiket
WHERE harga BETWEEN 270000 AND 1500000;

SELECT *
FROM acara
WHERE deskripsi IN ('konser girl group', 'konser dangdut');

SELECT AVG(jumlah) AS rata_tiket
FROM penjualan;

SELECT *
FROM acara
WHERE lokasi_acara = 'GBK'
AND kapasitas >='500';

SELECT *
FROM acara
WHERE lokasi_acara = 'GBK'
AND kapasitas >='500';





