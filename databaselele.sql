CREATE DATABASE lele;

CREATE TABLE `admin` (
  `AdminID` varchar(10) NOT NULL,
  `NamaAdmin` varchar(50) NOT NULL,
  `PasswordAdmin` varchar(50) NOT NULL
);

INSERT INTO `admin` (`AdminID`, `NamaAdmin`, `PasswordAdmin`) VALUES
('admin123', 'Admin 1', 'hiya1010'), ('admin456', 'Admin 2', 'hiya1111');


CREATE TABLE `beritadanpedoman` (
  `BeritaDanPedomanID` varchar(10) NOT NULL,
  `AdminID` varchar(10) NOT NULL,
  `Website` varchar(255) NOT NULL,
  `Artikel` varchar(255) NOT NULL,
  `VideoPedoman` varchar(255) NOT NULL
);

INSERT INTO `beritadanpedoman` (`BeritaDanPedomanID`, `AdminID`, `Website`, `Artikel`, `VideoPedoman`) VALUES
('berita1021', 'admin123', 'Yahoo.com', 'Hello.com', 'Tada.com'),
('berita1022', 'admin456', 'Yahoo2.com', 'Hello2.com', 'Tad3a.com');

CREATE TABLE `kolam` (
  `KolamID` varchar(10) NOT NULL,
  `PanganID` varchar(10) NOT NULL,
  `JumlahLele` varchar(5) NOT NULL,
  `TanggalAwalTebarBibit` DATE NOT NULL,
  `UmurLele` int(5) NOT NULL,
  `BeratLele` int(5) NOT NULL
);


INSERT INTO `kolam` (`KolamID`, `PanganID`, `JumlahLele`, `TanggalAwalTebarBibit`, `UmurLele`, `BeratLele`) VALUES
('kolam100', 'pangan200', 50, '2019-05-21', 10, 4),
('kolam101', 'pangan201', 50, '2020-05-21', 14, 7);


CREATE TABLE `monitoring` (
  `MonitoringID` varchar(10) NOT NULL,
  `AdminID` varchar(10) NOT NULL,
  `KolamID` varchar(10) NOT NULL,
  `PemberiPakanID` varchar(10) NOT NULL
);


INSERT INTO `monitoring` (`MonitoringID`, `AdminID`, `KolamID`, `PemberiPakanID`) VALUES
('monitor100', 'admin123', 'kolam100', 'pakan1'),
('monitor200', 'admin456', 'kolam101', 'pakan2');


CREATE TABLE `pangan` (
  `PanganID` varchar(10) NOT NULL,
  `JumlahStock` int(5) NOT NULL,
  `TakaranPangan` int(5) NOT NULL,
  `RestockPangan` int(5) NOT NULL
);

INSERT INTO `pangan` (`PanganID`, `JumlahStock`, `TakaranPangan`, `RestockPangan`) VALUES
('pangan200', 20, 50, 10),
('pangan201', 21, 51, 11);

CREATE TABLE `pemberipakan` (
  `PemberiPakanID` varchar(10) NOT NULL,
  `NamaPemberiPakan` varchar(10) NOT NULL,
  `PasswordPP` varchar(10) NOT NULL
);

INSERT INTO `pemberipakan` (`PemberiPakanID`, `NamaPemberiPakan`, `PasswordPP`) VALUES
('pakan1', 'yanto', '8181821'), ('pakan2', 'bambang', '818112');

ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`);

ALTER TABLE `pangan`
  ADD PRIMARY KEY (`PanganID`);

ALTER TABLE `pemberipakan`
  ADD PRIMARY KEY (`PemberiPakanID`);

ALTER TABLE `beritadanpedoman`
  ADD PRIMARY KEY (`BeritaDanPedomanID`),
  ADD FOREIGN KEY (AdminID) REFERENCES admin(AdminID);

ALTER TABLE `kolam`
  ADD PRIMARY KEY (`KolamID`),
  ADD FOREIGN KEY (PanganID) REFERENCES pangan(PanganID);

ALTER TABLE `monitoring`
  ADD PRIMARY KEY (`MonitoringID`),
  ADD FOREIGN KEY (KolamID) REFERENCES kolam(KolamID),
  ADD FOREIGN KEY (AdminID) REFERENCES admin(AdminID),
  ADD FOREIGN KEY (PemberiPakanID) REFERENCES pemberipakan(PemberiPakanID);
