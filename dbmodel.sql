/*Solo para inicio de la primera vez*/
CREATE DATABASE WN_db
USE Wn_db



/*Balance corresponde al dinero del usuario*/
CREATE TABLE Balance(
bal_id INT primary key identity,
bal_usuario VARCHAR(200), 
bal_tran_id int
)
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
cl_id INT PRIMARY KEY IDENTITY,
cl_nombre  VARCHAR(100),
cl_aparterno VARCHAR(100),
cl_amaterno VARCHAR(100),
cl_direccion_id int foreign key(cl_direccion_id) references Direcciones(dir_id),
cl_telefono VARCHAR(50),

)


/* Afiliados, las personas que brindaran los servicios*/
CREATE TABLE Afiliados(
afi_id int primary key identity,
afi_nombre VARCHAR(100),
afi_aparterno VARCHAR(100),
afi_amaterno VARCHAR(100),
afi_direccion_id int foreign key(afi_direccion_id) references Direcciones(dir_id),
afi_telefono VARCHAR(50),
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



