/*Solo para inicio de la primera vez*/
CREATE DATABASE WN_db
USE Wn_db



CREATE TABLE Balance(
bal_id INT primary key identity,
bal_usuario VARCHAR(200), 
/*Direcciones del cliente o usuario*/
CREATE TABLE Direcciones(
dir_id INT PRIMARY KEY IDENTITY,
dir_calle  VARCHAR(100),
dir_numero VARCHAR(100),
dir_colonia VARCHAR(100),
dir_cp VARCHAR(100),
dir_municipio VARCHAR(100),
dir_estado VARCHAR(100),
dir_pais VARCHAR(100)
)


/*Clientes, los usuarios de la app*/
CREATE TABLE Clientes(
cli_id INT PRIMARY KEY IDENTITY,
cli_nombre  VARCHAR(100),
cli_aparterno VARCHAR(100),
cli_amaterno VARCHAR(100),
cli_direccion_id int foreign key(cli_direccion_id) references Direcciones(dir_id),
cli_telefono VARCHAR(50),
cli_email VARCHAR(70)
)


/* Afiliados, las personas que brindaran los servicios*/
CREATE TABLE Afiliados(
afi_id int primary key identity,
afi_nombre VARCHAR(100),
afi_aparterno VARCHAR(100),
afi_amaterno VARCHAR(100),
afi_direccion_id int foreign key(afi_direccion_id) references Direcciones(dir_id),
afi_telefono VARCHAR(50),
afi_email VARCHAR(70)
)

/*Usuarios, credenciales de afiliados y usuarios*/
CREATE TABLE Usuarios(
usu_id VARCHAR(50) primary key,
usu_password VARCHAR(100),
usu_af bit,
usu_cl bit,
usu_info int,
)


/*Oficios, los oficios que maneja el afiliado*/
CREATE TABLE Oficios(
ofi_id int primary key identity,
ofi_nombre VARCHAR(100),
)

/*Relaciona cada afiliado con uno o mas oficios*/
CREATE TABLE AfiliadosOficios(
afiof_afi_id int FOREIGN KEY (afiof_afi_id) REFERENCES Afiliados(afi_id),
afiof_ofi_id int FOREIGN KEY (afiof_ofi_id) REFERENCES Oficios(ofi_id),
primary key(afiof_afi_id,afiof_ofi_id),
)

/*Servicios que se ofrecen por oficio*/
CREATE TABLE Servicios(
svc_id int primary key identity,
svc_nombre VARCHAR(100),
svc_descripcion VARCHAR(100),
svc_ofi_id  INT FOREIGN KEY (svc_ofi_id) REFERENCES Oficios(ofi_id)
)



/*Tabla de balance de los afiliados*/
CREATE TABLE Transacciones(
tran_id int primary key identity,
tran_cli_id int foreign key (tran_cli_id) REFERENCES Clientes(cli_id) NULL,
tran_afi_id int foreign key (tran_afi_id) REFERENCES Afiliados(afi_id) NULL,
tran_descripcion VARCHAR(250),
tran_monto money,
tran_comision DECIMAL(4,2),
tran_iva DECIMAL(4,2),
tran_bloqueada bit
)

CREATE TABLE BALANCE(
bal_afi_if int FOREIGN KEY(bal_afi_if) REFERENCES Afiliados(afi_id),
bal_actual money
)
