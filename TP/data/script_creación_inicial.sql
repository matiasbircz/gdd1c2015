USE GD1C2015
GO

SET LANGUAGE Spanish

/*	****************************************	CREACION DEL SCHENMA	*********************************************** */

IF NOT EXISTS (SELECT 1 FROM [sys].[schemas] WHERE [name] = 'GEM4')
	EXECUTE ('CREATE SCHEMA GEM4 AUTHORIZATION gd;');
GO

/*	****************************************	FECHA DEL SISTEMA	*************************************************** */

IF EXISTS (SELECT 1 AS existe FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'fechaSistema')
	DROP TABLE GEM4.fechaSistema;

CREATE TABLE GEM4.fechaSistema (
		fechaSistema	DATETIME NOT NULL
	);

IF EXISTS (SELECT id FROM sys.sysobjects WHERE name='spRegistrarFechaDelSistema')
	DROP PROCEDURE GEM4.spRegistrarFechaDelSistema
GO
CREATE PROCEDURE GEM4.spRegistrarFechaDelSistema
	@fecha DATETIME
AS
BEGIN
	IF @fecha is NULL
			INSERT GEM4.fechaSistema (fechaSistema) VALUES (GETDATE())
	ELSE
			INSERT GEM4.fechaSistema (fechaSistema) VALUES (@fecha)
END;
GO

IF EXISTS (SELECT id FROM sys.sysobjects WHERE name='fnDevolverFechaSistema')
	DROP FUNCTION GEM4.fnDevolverFechaSistema
GO
CREATE FUNCTION GEM4.fnDevolverFechaSistema()
RETURNS DATETIME
AS
	BEGIN
	DECLARE @fecha DATETIME
	SELECT TOP 1 @fecha = fechaSistema FROM GEM4.fechaSistema
	RETURN @fecha
	END
GO

EXEC GEM4.spRegistrarFechaDelSistema '2015-01-01 00:00:00.000' --NULL

IF EXISTS (SELECT id FROM sys.sysobjects WHERE name='spInsertarFechaFuncionamiento')
	DROP PROCEDURE GEM4.spInsertarFechaFuncionamiento
GO
CREATE PROCEDURE GEM4.spInsertarFechaFuncionamiento
	@fecha DATETIME
AS
BEGIN
	UPDATE GEM4.fechaSistema
	SET fechaSistema = @fecha
END;
GO

IF EXISTS (SELECT id FROM sys.sysobjects WHERE name='fnValidarFecha')
	DROP FUNCTION GEM4.fnValidarFecha
GO
CREATE FUNCTION GEM4.fnValidarFecha(@unaFecha DATETIME)
RETURNS DATETIME
AS
	BEGIN
		IF((@unaFecha IS NULL)OR(@unaFecha > GETDATE()))
			BEGIN
				RETURN GEM4.fnDevolverFechaSistema();
			END
		RETURN @unaFecha;
	END
GO

IF EXISTS (SELECT id FROM sys.sysobjects WHERE name='fnValidarSaldoCuenta')
	DROP FUNCTION GEM4.fnValidarSaldoCuenta
GO
CREATE FUNCTION GEM4.fnValidarSaldoCuenta(@saldo NUMERIC(18,2))
RETURNS NUMERIC(18,2)
AS
	BEGIN
		IF(@saldo <1)
			BEGIN
				RETURN 1000;
			END
		RETURN @saldo;
	END
GO


/*	****************************************	BORRADO DE OBJETOS	*************************************************** */
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Deposito')
	DROP TABLE GEM4.Deposito;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Transferencia')
	DROP TABLE GEM4.Transferencia;	
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Retiro')
	DROP TABLE GEM4.Retiro;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Operacion_Por_Factura')
	DROP TABLE GEM4.Operacion_Por_Factura;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND TABLE_NAME = 'Operacion')
	DROP TABLE GEM4.Operacion
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Log_Operacion')
	DROP TABLE GEM4.Log_Operacion;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Tipo_Operacion')
	DROP TABLE GEM4.Tipo_Operacion;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Log_Login')
	DROP TABLE GEM4.Log_Login;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Item_Por_Factura')
	DROP TABLE GEM4.Item_Por_Factura;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Factura')
	DROP TABLE GEM4.Factura;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Item')
	DROP TABLE GEM4.Item;

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Cheque')
	DROP TABLE GEM4.Cheque;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Banco')
	DROP TABLE GEM4.Banco;


IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Tarjeta')
	DROP TABLE GEM4.Tarjeta;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Cuenta')
	DROP TABLE GEM4.Cuenta;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Tipo_Cuenta')
	DROP TABLE GEM4.Tipo_Cuenta;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Estado_Cuenta')
	DROP TABLE GEM4.Estado_Cuenta;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Usuario_Por_Rol')
	DROP TABLE GEM4.Usuario_Por_Rol;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Usuario')
	DROP TABLE GEM4.Usuario;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Cliente')
	DROP TABLE GEM4.Cliente;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Persona')
	DROP TABLE GEM4.Persona;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Documento')
	DROP TABLE GEM4.Documento;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND TABLE_NAME = 'Pais')
	DROP TABLE GEM4.Pais;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND TABLE_NAME = 'Rol_Por_Funcionalidad')
	DROP TABLE GEM4.Rol_Por_Funcionalidad;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Rol')
	DROP TABLE GEM4.Rol;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Funcionalidad')
	DROP TABLE GEM4.Funcionalidad;
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'GEM4' AND  TABLE_NAME = 'Moneda')
	DROP TABLE GEM4.Moneda;
/*	****************************************	CREACION DE LAS TABLAS	*********************************************** */

CREATE TABLE GEM4.Pais(
	Pais_Cod					NUMERIC(18,0) IDENTITY(1,1),
	Pais_Descripcion			NVARCHAR(250),
	PRIMARY KEY(Pais_Cod)
	);

CREATE TABLE GEM4.Rol(
	Rol_Cod 					INT IDENTITY(1,1),
	Rol_Nombre					NVARCHAR(50) NOT NULL,					
	Rol_Habilitado				BIT NOT NULL DEFAULT 1,
	PRIMARY KEY(Rol_Cod)
	);
	
CREATE TABLE GEM4.Funcionalidad(
	Funcionalidad_Cod			TINYINT ,
	Funcionalidad_Descripcion	NVARCHAR(50) NOT NULL,
	Funcionalidad_Habilitada	BIT DEFAULT 1 NOT NULL,
	PRIMARY KEY(Funcionalidad_Cod)
	);

CREATE TABLE GEM4.Rol_Por_Funcionalidad(
	Rol_Cod								INT,
	Funcionalidad_Cod					TINYINT,
	Rol_Por_Funcionalidad_Habilitado	BIT DEFAULT 1,	
	PRIMARY KEY(Rol_Cod, Funcionalidad_Cod),
	FOREIGN KEY(Rol_Cod) REFERENCES GEM4.Rol(Rol_Cod),
	FOREIGN KEY(Funcionalidad_Cod) REFERENCES GEM4.Funcionalidad(Funcionalidad_Cod)
	);
	
CREATE TABLE GEM4.Documento(
	Documento_Tipo_Codigo					NUMERIC(18,0) IDENTITY(10001,1),
	Documento_Tipo_Descripcion				NVARCHAR(255),
	PRIMARY KEY(Documento_Tipo_Codigo)
	)
	
CREATE TABLE GEM4.Persona(
	Persona_ID					INT IDENTITY(1,1),					
	Persona_Nombre				NVARCHAR(255),
	Persona_Apellido			NVARCHAR(255),
	Persona_Tipo_Doc			NUMERIC(18,0),
	Persona_Numero_Documento	NUMERIC(18,0),					
	Persona_Mail				NVARCHAR(255) UNIQUE,
	Persona_Pais				NUMERIC(18,0),
	Persona_Dom_Calle			NVARCHAR(255),
	Persona_Dom_Numero			NUMERIC(18,0),
	Persona_Dom_Piso			NUMERIC(18,0),
	Persona_Dom_Depto			NVARCHAR(10),
	Persona_Localidad			NVARCHAR(60),				
	Persona_Nacionalidad		NVARCHAR(60),				
	Persona_Fecha_Nacimiento	DATETIME,
	Persona_Habilitado			BIT DEFAULT 1,
	PRIMARY KEY(Persona_ID),
	FOREIGN KEY(Persona_Tipo_Doc) REFERENCES GEM4.Documento(Documento_Tipo_Codigo),
	FOREIGN KEY(Persona_Pais) REFERENCES GEM4.Pais(Pais_Cod)
	)	
	
CREATE TABLE GEM4.Usuario(
	Usuario_ID 								INT IDENTITY(0,1),
	Usuario_Username						NVARCHAR(30) UNIQUE NOT NULL,
	Usuario_Contrasena						CHAR(44) NOT NULL,
	Usuario_Fecha_Creacion 					DATETIME,
	Usuario_Fecha_Ultima_Modificacion 		DATETIME,
	Usuario_Pregunta_Secreta 				NVARCHAR(60),
	Usuario_Respuesta_Secreta 				NVARCHAR(60),
	Persona_ID								INT,
	Usuario_Habilitado						BIT NOT NULL DEFAULT 1,
	PRIMARY KEY(Usuario_ID),
	FOREIGN KEY(Persona_ID) REFERENCES GEM4.Persona(Persona_ID),
	UNIQUE(Usuario_Username)
	);
	
CREATE TABLE GEM4.Usuario_Por_Rol(
	Usuario_ID								INT,
	Rol_Cod									INT,
	Habilitado								BIT DEFAULT 1,
	PRIMARY KEY(Usuario_ID, Rol_Cod),
	FOREIGN KEY(Usuario_ID) REFERENCES GEM4.Usuario(Usuario_ID),
	FOREIGN KEY(Rol_Cod) REFERENCES GEM4.Rol(Rol_Cod)
	);
	
CREATE TABLE GEM4.Moneda(
	Moneda_Codigo							INT IDENTITY(1,1),
	Moneda_Descripcion						NVARCHAR(60),
	PRIMARY KEY(Moneda_Codigo)
	)

CREATE TABLE GEM4.Estado_Cuenta(
	Estado_Codigo							INT IDENTITY(1,1),
	Estado_Descripcion						NVARCHAR(255),
	PRIMARY KEY(Estado_Codigo)
	)
	
CREATE TABLE GEM4.Tipo_Cuenta(
	Tipo_Cuenta_ID						INT IDENTITY(1,1),
	Tipo_Cuenta_Descripcion				NVARCHAR(60),
	Tipo_Cuenta_Costo_Creacion			NUMERIC(18,2),
	Tipo_Cuenta_Costo_Modificacion		NUMERIC(18,2),
	Tipo_Cuenta_Costo_Transf			NUMERIC(18,2), 
	Tipo_Cuenta_Duracion				INT,
	Habilitado							BIT DEFAULT 1
	PRIMARY KEY (Tipo_Cuenta_ID)
	)	
	
CREATE TABLE GEM4.Cuenta(
	Cuenta_Numero							NUMERIC(18,0) IDENTITY(1,1),
	Cuenta_Fecha_Creacion					DATETIME,
	Cuenta_Estado							INT	DEFAULT 1,
	Cuenta_Pais								NUMERIC(18,0),
	Cuenta_Fecha_Cierre						DATETIME,
	Cuenta_Moneda							INT	DEFAULT 1,
	Cuenta_Tipo								INT	DEFAULT 4,
	Cuenta_Persona_ID						INT,
	Cuenta_Saldo							NUMERIC(18,2) DEFAULT 0,-- LO INICIALIZO EN CERO A VER SI FUNCA LO QUE NOS DIJERON LOS AYUDANTES
	PRIMARY KEY(Cuenta_Numero),
	FOREIGN KEY(Cuenta_Estado) REFERENCES GEM4.Estado_Cuenta(Estado_Codigo),
	FOREIGN KEY(Cuenta_Moneda) REFERENCES GEM4.Moneda(Moneda_Codigo),
	FOREIGN KEY(Cuenta_Tipo) REFERENCES GEM4.Tipo_Cuenta(Tipo_Cuenta_ID),
	FOREIGN KEY(Cuenta_Persona_ID) REFERENCES GEM4.Persona(Persona_ID) 
	)

CREATE TABLE GEM4.Tarjeta(
	Tarjeta_Numero							NVARCHAR(16),
	Tarjeta_Fecha_Emision					DATETIME,
	Tarjeta_Fecha_Vencimiento				DATETIME,
	Tarjeta_Codigo_Seg						NVARCHAR(3),
	Tarjeta_Emisor_Descripcion				NVARCHAR(255),
	Tarjeta_Persona_ID						INT,
	Tarjeta_Habilitado						BIT DEFAULT 1
	PRIMARY KEY(Tarjeta_Numero),
	FOREIGN KEY(Tarjeta_Persona_ID) REFERENCES GEM4.Persona(Persona_ID)		
	)
CREATE TABLE GEM4.Factura(
	Factura_Numero							NUMERIC(18,0) IDENTITY(1,1),
	Factura_Fecha							DATETIME,
	PRIMARY KEY(Factura_Numero),
	
	)


CREATE TABLE GEM4.Tipo_Operacion(
	Tipo_Operacion_ID						INT IDENTITY(1,1),
	Tipo_Operacion_Descripcion				NVARCHAR(255),
	
	PRIMARY KEY(Tipo_Operacion_ID)
	)

CREATE TABLE GEM4.Operacion(
	Operacion_ID						INT IDENTITY(1,1),
	Operacion_Tipo						INT,
	Operacion_Fecha						DATETIME,
	Operacion_Usuario_ID				INT,
	Operacion_Costo						NUMERIC(18,2),
	Factura_Numero						NUMERIC(18,0),
	PRIMARY KEY(Operacion_ID),
	FOREIGN KEY(Operacion_Tipo) REFERENCES GEM4.Tipo_Operacion(Tipo_Operacion_ID),
	FOREIGN KEY(Operacion_Usuario_ID) REFERENCES GEM4.Usuario(Usuario_ID),
	FOREIGN KEY (Factura_Numero) REFERENCES GEM4.Factura(Factura_Numero)
	)
	

CREATE TABLE GEM4.Deposito(
	Deposito_Codigo							NUMERIC(18,0) IDENTITY(1,1),
	Deposito_Fecha							DATETIME,
	Deposito_Importe						NUMERIC(18,2),
	Deposito_Persona						INT,
	Deposito_Tarjeta						NVARCHAR(16),
	Deposito_Moneda							INT DEFAULT 1,
	Deposito_Cuenta							NUMERIC(18,0),
	Deposito_Operacion_ID							INT,
	PRIMARY KEY(Deposito_Codigo),
	FOREIGN KEY(Deposito_Persona) REFERENCES GEM4.Persona(Persona_ID),
	FOREIGN KEY(Deposito_Tarjeta) REFERENCES GEM4.Tarjeta(Tarjeta_Numero),
	FOREIGN KEY(Deposito_Cuenta) REFERENCES GEM4.Cuenta(Cuenta_Numero),
	FOREIGN KEY(Deposito_Operacion_ID)	REFERENCES GEM4.Operacion(Operacion_ID)
	)




CREATE TABLE GEM4.Transferencia( 
	Transferencia_Codigo					INT IDENTITY(1,1),
	Transferencia_Fecha						DATETIME,
	Transferencia_Importe					NUMERIC(18,2),
	Transferencia_Costo_Trans				NUMERIC(18,2),
	Transferencia_Cuenta_Origen				NUMERIC(18,0),
	Transferencia_Cuenta_Destino			NUMERIC(18,0),
	Transferencia_Operacion_ID				INT,
	PRIMARY KEY(Transferencia_Codigo),
	FOREIGN KEY(Transferencia_Cuenta_Origen) REFERENCES GEM4.Cuenta(Cuenta_Numero),
	FOREIGN KEY(Transferencia_Cuenta_Destino) REFERENCES GEM4.Cuenta(Cuenta_Numero),
	FOREIGN KEY(Transferencia_Operacion_ID)	REFERENCES	GEM4.Operacion(Operacion_ID)
	)

CREATE TABLE GEM4.Banco(
	Banco_Codigo							NUMERIC(18,0) IDENTITY(1,1),
	Banco_Nombre							NVARCHAR(255),
	Banco_Direccion							NVARCHAR(255),
	PRIMARY KEY(Banco_Codigo)
	)

CREATE TABLE GEM4.Cheque(
	Cheque_Numero							NUMERIC(18,0) IDENTITY(1,1),
	Cheque_Fecha							DATETIME,
	Cheque_Importe							NUMERIC(18,2),
	Cheque_Persona_ID						INT,
	Cheque_Banco							NUMERIC(18,0),
	PRIMARY KEY(Cheque_Numero),
	FOREIGN KEY(Cheque_Persona_ID) REFERENCES GEM4.Persona(Persona_ID),
	FOREIGN KEY(Cheque_Banco) REFERENCES GEM4.Banco(Banco_Codigo)							
	)

CREATE TABLE GEM4.Retiro(
	Retiro_Codigo							NUMERIC(18,0) IDENTITY(1,1),
	Retiro_Importe							NUMERIC(18,2),
	Retiro_Fecha							DATETIME,
	Retiro_Cuenta							NUMERIC(18,0),
	Retiro_Cheque							NUMERIC(18,0),
	Operacion_ID							INT,
	PRIMARY KEY(Retiro_Codigo),
	FOREIGN KEY(Retiro_Cuenta) REFERENCES GEM4.Cuenta(Cuenta_Numero),
	FOREIGN KEY(Retiro_Cheque) REFERENCES GEM4.Cheque(Cheque_Numero),
	FOREIGN KEY(Operacion_ID)	REFERENCES GEM4.Operacion(Operacion_ID)
	)

CREATE TABLE GEM4.Log_Login(
	Log_Login_Numero						INT IDENTITY(1,1),
	Log_Login_Usuario_ID					INT,
	Log_Login_Fecha							DATETIME,
	Log_Login_Incorrecto					BIT, --Si es TRUE -----> LOGIN FUE INCORRECTO
	Log_Login_NIntento						INT,
	PRIMARY KEY(Log_Login_Numero),
	FOREIGN KEY(Log_Login_Usuario_ID) REFERENCES GEM4.Usuario(Usuario_ID)
	)
GO
	
/*	*******************************************	    VIEWS   	********************************************************** */

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE  TABLE_NAME  = 'Cuenta_ABM')
	DROP VIEW GEM4.Cuenta_ABM;
GO
CREATE VIEW GEM4.Cuenta_ABM(Cuenta_Numero, Cuenta_Persona_ID, Cuenta_Fecha_Creacion, Cuenta_Fecha_Cierre, Cuenta_Saldo, Cuenta_Tipo, Cuenta_Estado, Cuenta_Moneda, Cuenta_Pais) AS
SELECT Cuenta_Numero, Cuenta_Persona_ID, Cuenta_Fecha_Creacion, Cuenta_Fecha_Cierre, Cuenta_Saldo, Tipo_Cuenta_Descripcion, Estado_Descripcion, Moneda_Descripcion, Pais_Descripcion  		
FROM GEM4.Cuenta JOIN GEM4.Tipo_Cuenta ON (Cuenta.Cuenta_Tipo = Tipo_Cuenta.Tipo_Cuenta_ID)
					JOIN GEM4.Estado_Cuenta ON (Cuenta.Cuenta_Estado = Estado_Cuenta.Estado_Codigo)
					JOIN GEM4.Moneda ON (Cuenta.Cuenta_Moneda = Moneda.Moneda_Codigo)
					JOIN GEM4.Pais ON (Cuenta.Cuenta_Pais = Pais.Pais_Cod)
GO

/* *****************************************     CREACION DE TRIGGERS    ********************************************** */
/* *****************************************	PROCEDIMIENTOS DE MIGRACION *******************************************/

/* ***************************************** INICIALIZACION DE DATOS ************************************************** */
IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spInsertaOperaciones')
	DROP PROCEDURE GEM4.spInsertaOperaciones
GO

SET IDENTITY_INSERT GEM4.Rol ON;
INSERT INTO GEM4.Rol (Rol_Cod,Rol_Nombre) VALUES 
	(1,'Administrador'),
	(2,'Cliente');
SET IDENTITY_INSERT GEM4.Rol OFF;

INSERT INTO GEM4.Funcionalidad(Funcionalidad_Cod,Funcionalidad_Descripcion) VALUES 
	(1,'ABM de Rol'),
	(2,'ABM de Usuario'),
	(3,'ABM de Clientes'),
	(4,'ABM de Cuenta'),
	(5,'Asociar/Desasociar Tarjetas de Credito'),
	(6,'Depositos'),
	(7,'Retiros'),
	(8,'Transferencias'),
	(9,'Facturacion'),
	(10,'Consulta Saldos'),
	(11,'Listados Estadisticos');
	
INSERT INTO GEM4.Rol_Por_Funcionalidad (Rol_Cod, Funcionalidad_Cod) VALUES
	(1,1),
	(1,2),
	(1,3),
	(1,4),
	(2,4),
	(2,5),
	(2,6),
	(2,7),
	(2,8),
	(1,9),
	(2,9),
	(1,10),
	(2,10),
	(1,11);
	
--Completa las funcionalidades deshabilitadas--

INSERT INTO GEM4.Rol_Por_Funcionalidad (Funcionalidad_Cod,Rol_Cod,Rol_Por_Funcionalidad_Habilitado)
		SELECT F.Funcionalidad_Cod,R.Rol_Cod,0
			FROM GEM4.Funcionalidad F,GEM4.Rol R
			WHERE F.Funcionalidad_Cod not in (SELECT Q.Funcionalidad_Cod  FROM GEM4.Rol_Por_Funcionalidad Q
			WHERE Q.Rol_Cod =R.Rol_Cod)
;
	
SET IDENTITY_INSERT GEM4.Usuario ON;
INSERT INTO GEM4.Usuario (Usuario_ID,Usuario_Username,Usuario_Contrasena) VALUES 
	(1,'admin','5rhwUL/LgUP8uNsBcKTcntANkE3dPipK0bHo3A/cm+c='), --contrasena w23e
	(2,'admin2','5rhwUL/LgUP8uNsBcKTcntANkE3dPipK0bHo3A/cm+c='), --contrasena w23e
	(3,'admin3','5rhwUL/LgUP8uNsBcKTcntANkE3dPipK0bHo3A/cm+c='); --contrasena w23e
SET IDENTITY_INSERT GEM4.Usuario OFF;

INSERT INTO GEM4.Usuario_Por_Rol (Usuario_ID, Rol_Cod) VALUES
	(1,1),
	(2,1),
	(3,1);

SET IDENTITY_INSERT GEM4.Moneda ON;	
INSERT INTO GEM4.Moneda(Moneda_Codigo, Moneda_Descripcion) VALUES
	(1,'Dólar estadounidense');
SET IDENTITY_INSERT GEM4.Moneda OFF;


INSERT INTO GEM4.Tipo_Operacion(Tipo_Operacion_Descripcion)
VALUES('Deposito'),('Retiro'),('Transferencia'),('Apertura Cuenta'),('Cierre Cuenta');

SET IDENTITY_INSERT GEM4.Tipo_Cuenta ON;
INSERT INTO GEM4.Tipo_Cuenta(Tipo_Cuenta_ID,Tipo_Cuenta_Descripcion,Tipo_Cuenta_Costo_Creacion,Tipo_Cuenta_Costo_Modificacion,Tipo_Cuenta_Costo_Transf,Tipo_Cuenta_Duracion)
VALUES(1,'Oro',500,500,20,360),(2,'Plata',400,400,10,160),
		(3,'BRONCE',300,300,5,80),(4,'Gratuita',0,0,0,80);

SET IDENTITY_INSERT GEM4.Tipo_Cuenta OFF;


SET IDENTITY_INSERT GEM4.Estado_Cuenta ON;
INSERT INTO GEM4.Estado_Cuenta(Estado_Codigo,Estado_Descripcion)
VALUES(1,'HABILITADA'),(2,'INHABILITADA'),(3,'CERRADA'),(4,'PENDIENTE ACTIVACION');
SET IDENTITY_INSERT GEM4.Estado_Cuenta OFF;

GO
CREATE PROCEDURE GEM4.spInsertaOperaciones 
AS
BEGIN
	DECLARE @nFactura NUMERIC(18,0), @nOperacion INT,@personaID INT,
			@personaMail NVARCHAR(255),@depositoCodigo NUMERIC(18,0),
			@depositoFecha DATETIME,@depositoImporte NUMERIC(18,2),
			@tarjeta NVARCHAR(16),@cuentaNumero NUMERIC(18,0),@usuarioID INT,
			@retiroCodigo NUMERIC(18,0),@retiroFecha DATETIME,@retiroImporte NUMERIC(18,2),
			@chequeNumero NUMERIC(18,0),@chequeFecha DATETIME,@chequeImporte NUMERIC(18,2),@banco NUMERIC(18,0),
			@transfFecha DATETIME,@transfImporte NUMERIC(18,2),@transfCosto NUMERIC(18,2),
			@cuentaDestino NUMERIC(18,0);
	
	

	DECLARE Cursor1 CURSOR FOR
	SELECT DISTINCT Factura_Numero,Cli_Mail,Retiro_Codigo,Retiro_Fecha,Retiro_Importe,
					Cuenta_Numero,Cheque_Numero,Cheque_Fecha,Cheque_Importe,Banco_Cogido,
					Deposito_Codigo,Deposito_Fecha,Deposito_Importe,Tarjeta_Numero,
					Transf_Fecha,Trans_Importe,Trans_Costo_Trans,Cuenta_Dest_Numero
	FROM gd_esquema.Maestra
	ORDER BY Deposito_Fecha asc,Retiro_Fecha asc,Transf_Fecha asc ;

	    OPEN Cursor1;
	FETCH NEXT FROM Cursor1 INTO @nFactura,@personaMail,@retiroCodigo,@retiroFecha,@retiroImporte,@cuentaNumero,
								@chequeNumero,@chequeFecha,@chequeImporte,@banco,@depositoCodigo,@depositoFecha,
								 @depositoImporte,@tarjeta,@transfFecha,@transfImporte,@transfCosto,@cuentaDestino;
	SET @nOperacion=1;
    
    BEGIN TRANSACTION;
    WHILE @@FETCH_STATUS = 0
		BEGIN
		
			SELECT @personaID=p.Persona_ID
			FROM Persona p
			WHERE p.Persona_Mail=@personaMail;
		
			SELECT @usuarioID=u.Usuario_ID
			FROM GEM4.Usuario u
			WHERE Persona_ID=@personaID;  --si hay un error es aca...
	
		IF(@depositoCodigo IS NOT NULL)
			BEGIN
				SET IDENTITY_INSERT GEM4.Operacion ON;
				INSERT INTO GEM4.Operacion(Operacion_ID,Operacion_Tipo,Operacion_Fecha,Operacion_Usuario_ID,
											Operacion_Costo,Factura_Numero)
				VALUES(@nOperacion,1,GEM4.fnValidarFecha(@depositoFecha),@usuarioID,0,@nFactura);
				SET IDENTITY_INSERT GEM4.Operacion OFF;
				
				SET IDENTITY_INSERT GEM4.Deposito ON;
				INSERT INTO GEM4.Deposito(Deposito_Codigo,Deposito_Fecha,Deposito_Importe,
									  Deposito_Persona,Deposito_Tarjeta,
									  Deposito_Cuenta,Deposito_Operacion_ID)
				VALUES(@depositoCodigo,GEM4.fnValidarFecha(@depositoFecha),@depositoImporte,@personaID,@tarjeta,@cuentaNumero,@nOperacion);
				SET IDENTITY_INSERT GEM4.Deposito OFF;
				
				UPDATE GEM4.Cuenta
				SET Cuenta_Saldo=Cuenta_Saldo + @depositoImporte
				WHERE Cuenta_Numero=@cuentaNumero
				
				
			END;	
		IF(@retiroCodigo IS NOT NULL)
			BEGIN
				
				SET IDENTITY_INSERT GEM4.Operacion ON;
				INSERT INTO GEM4.Operacion(Operacion_ID,Operacion_Tipo,Operacion_Fecha,Operacion_Usuario_ID,
											Operacion_Costo,Factura_Numero)
				VALUES(@nOperacion,2,GEM4.fnValidarFecha(@retiroFecha),@usuarioID,0,@nFactura);
				SET IDENTITY_INSERT GEM4.Operacion OFF;
				
				SET IDENTITY_INSERT GEM4.Cheque ON; 
				INSERT INTO GEM4.Cheque(Cheque_Numero,Cheque_Fecha,Cheque_Importe,Cheque_Persona_ID,Cheque_Banco)
				VALUES(@chequeNumero,GEM4.fnValidarFecha(@chequeFecha),@chequeImporte,@personaID,@banco);
				SET IDENTITY_INSERT GEM4.Cheque OFF;
				
				SET IDENTITY_INSERT GEM4.Retiro ON;
				INSERT INTO GEM4.Retiro(Retiro_Codigo,Retiro_Importe,Retiro_Fecha,Retiro_Cheque,Operacion_ID,Retiro_Cuenta)
				VALUES(@retiroCodigo,@retiroImporte,GEM4.fnValidarFecha(@retiroFecha),@chequeNumero,@nOperacion,@cuentaNumero);
				SET IDENTITY_INSERT GEM4.Retiro OFF;
				
				UPDATE GEM4.Cuenta
				SET Cuenta_Saldo=Cuenta_Saldo - @retiroImporte
				WHERE Cuenta_Numero=@cuentaNumero
				 
			END;
		IF(@cuentaDestino IS NOT NULL)
			BEGIN
				IF(@cuentaDestino=@cuentaNumero)
					BEGIN
							SET @transfCosto=0
					END
				ELSE
					BEGIN
						SELECT @transfCosto=c.Tipo_Cuenta_Costo_Transf
						FROM GEM4.Tipo_Cuenta c
						WHERE c.Tipo_Cuenta_ID=1;
					END;
				
				SET IDENTITY_INSERT GEM4.Operacion ON;
				INSERT INTO GEM4.Operacion(Operacion_ID,Operacion_Tipo,Operacion_Fecha,Operacion_Usuario_ID,
											Operacion_Costo,Factura_Numero)
				VALUES(@nOperacion,3,GEM4.fnValidarFecha(@retiroFecha),@usuarioID,0,@nFactura);
				SET IDENTITY_INSERT GEM4.Operacion OFF;
				
				INSERT INTO GEM4.Transferencia(Transferencia_Fecha,Transferencia_Importe,Transferencia_Costo_Trans
											,Transferencia_Cuenta_Origen,Transferencia_Cuenta_Destino,Transferencia_Operacion_ID)
				VALUES(GEM4.fnValidarFecha(@transfFecha),@transfImporte,@transfCosto,@cuentaNumero,@cuentaDestino,@nOperacion);
				
				UPDATE GEM4.Cuenta
				SET Cuenta_Saldo=Cuenta_Saldo - @transfImporte -- -@transfCosto
				WHERE Cuenta_Numero=@cuentaNumero;
				
				UPDATE GEM4.Cuenta
				SET Cuenta_Saldo=Cuenta_Saldo + @transfImporte 
				WHERE Cuenta_Numero=@cuentaDestino;
				
			END;	
		SET @nOperacion=@nOperacion+1;				
		FETCH NEXT FROM Cursor1 INTO @nFactura,@personaMail,@retiroCodigo,@retiroFecha,@retiroImporte,@cuentaNumero,
								@chequeNumero,@chequeFecha,@chequeImporte,@banco,@depositoCodigo,@depositoFecha,
								 @depositoImporte,@tarjeta,@transfFecha,@transfImporte,@transfCosto,@cuentaDestino;
	END;
	CLOSE Cursor1;
DEALLOCATE Cursor1;
	IF @@ERROR=0
		BEGIN
			COMMIT TRANSACTION;
		END
	ELSE
		BEGIN
			ROLLBACK TRANSACTION;
		END;
END;
GO


/*	****************************************	MIGRACION 	******************************************* */

SET IDENTITY_INSERT GEM4.Pais ON;
INSERT INTO GEM4.Pais(Pais_Cod, Pais_Descripcion)
(SELECT DISTINCT Cuenta_Dest_Pais_Codigo, Cuenta_Dest_Pais_Desc
FROM gd_esquema.Maestra 
WHERE Cuenta_Dest_Pais_Codigo IS NOT NULL

UNION
SELECT DISTINCT Cli_Pais_Codigo, Cli_Pais_Desc
FROM gd_esquema.Maestra
WHERE Cli_Pais_Codigo IS NOT NULL);
SET IDENTITY_INSERT GEM4.Pais OFF;

SET IDENTITY_INSERT GEM4.Documento ON;
INSERT INTO GEM4.Documento(Documento_Tipo_Codigo,Documento_Tipo_Descripcion)
SELECT DISTINCT Cli_Tipo_Doc_Cod, Cli_Tipo_Doc_Desc
FROM gd_esquema.Maestra;
SET IDENTITY_INSERT GEM4.Documento OFF;

INSERT INTO GEM4.Persona(Persona_Pais, Persona_Nombre, Persona_Apellido, Persona_Tipo_Doc,Persona_Numero_Documento ,Persona_Dom_Calle, Persona_Dom_Numero, Persona_Dom_Piso, Persona_Dom_Depto, Persona_Fecha_Nacimiento, Persona_Mail)
SELECT DISTINCT Cli_Pais_Codigo, Cli_Nombre, Cli_Apellido, Cli_Tipo_Doc_Cod,Cli_Nro_Doc ,Cli_Dom_Calle, Cli_Dom_Nro, Cli_Dom_Piso, Cli_Dom_Depto, Cli_Fecha_Nac, Cli_Mail
FROM gd_esquema.Maestra

INSERT INTO GEM4.Usuario(Usuario_Username, Usuario_Contrasena, Usuario_Fecha_Creacion, Usuario_Fecha_Ultima_Modificacion, Persona_ID)
SELECT Persona_Nombre +'.'+ Persona_Apellido, '5rhwUL/LgUP8uNsBcKTcntANkE3dPipK0bHo3A/cm+c=', GEM4.fnDevolverFechaSistema(), GEM4.fnDevolverFechaSistema(), Persona_ID
FROM GEM4.Persona

INSERT INTO GEM4.Usuario_Por_Rol(Usuario_ID,Rol_Cod)
SELECT Usuario_ID, 2
FROM GEM4.Usuario
WHERE Usuario_ID > 3

INSERT INTO GEM4.Tarjeta(Tarjeta_Numero,Tarjeta_Fecha_Emision,Tarjeta_Fecha_Vencimiento,Tarjeta_Codigo_Seg,
						 Tarjeta_Emisor_Descripcion,Tarjeta_Persona_ID)
SELECT DISTINCT m.Tarjeta_Numero,GEM4.fnValidarFecha(m.Tarjeta_Fecha_Emision),m.Tarjeta_Fecha_Vencimiento,m.Tarjeta_Codigo_Seg,
	   m.Tarjeta_Emisor_Descripcion,p.Persona_ID
FROM gd_esquema.Maestra m JOIN  GEM4.Persona p ON (m.Cli_Mail=p.Persona_Mail AND m.Cli_Apellido=p.Persona_Apellido)
WHERE m.Tarjeta_Numero IS NOT NULL



SET IDENTITY_INSERT GEM4.Banco ON;
INSERT INTO GEM4.Banco(Banco_Codigo,Banco_Direccion,Banco_Nombre)
SELECT DISTINCT m.Banco_Cogido,m.Banco_Direccion,m.Banco_Nombre
FROM gd_esquema.Maestra m
WHERE m.Banco_Cogido IS NOT NULL;
SET IDENTITY_INSERT GEM4.Banco OFF;


SET IDENTITY_INSERT GEM4.Factura ON;
INSERT INTO GEM4.Factura(Factura_Numero,Factura_Fecha)
SELECT DISTINCT m.Factura_Numero,GEM4.fnValidarFecha(m.Factura_Fecha)
FROM gd_esquema.Maestra m
WHERE M.Factura_Numero IS NOT NULL;
SET IDENTITY_INSERT GEM4.Factura OFF;

SET IDENTITY_INSERT GEM4.Cuenta ON;
INSERT INTO GEM4.Cuenta(Cuenta_Numero,Cuenta_Fecha_Creacion,Cuenta_Fecha_Cierre,Cuenta_Pais,Cuenta_Persona_ID)
SELECT	DISTINCT m.Cuenta_Numero,GEM4.fnValidarFecha(m.Cuenta_Fecha_Creacion),m.Cuenta_Fecha_Cierre,m.Cuenta_Pais_Codigo,p.Persona_ID
FROM gd_esquema.Maestra m JOIN GEM4.Persona p ON (m.Cli_Mail=p.Persona_Mail)
WHERE M.Cuenta_Numero IS NOT NULL
SET IDENTITY_INSERT GEM4.Cuenta OFF;


EXEC GEM4.spInsertaOperaciones
GO
/* ******************************************TRIGGERS************************************************************ */
IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'tgModificacionUsuario')
	DROP PROCEDURE GEM4.tgModificacionUsuario;
GO

CREATE TRIGGER GEM4.tgModificacionUsuario
ON  GEM4.Usuario 
FOR UPDATE
AS
	BEGIN
		DECLARE @usuarioID INT,@usuarioHab BIT,@persona INT,
				@username NVARCHAR(30),@pass CHAR(44),
				@fechaCreacion	DATETIME,@pregSecreta NVARCHAR(60),
				@respSecreta NVARCHAR(60),@habilitado BIT,@cuentaEstado TINYINT;
		
		SELECT @usuarioID=Usuario_ID,@usuarioHab=Usuario_Habilitado,
				@persona=Persona_ID,@habilitado=Usuario_Habilitado
		FROM inserted;
		
		UPDATE GEM4.Persona
		SET	Persona_Habilitado=@habilitado
		WHERE Persona_ID=@persona;
		
		IF(@habilitado=0)
		BEGIN
			SET	@cuentaEstado=2;
		UPDATE GEM4.Cuenta
			SET	Cuenta_Estado=@cuentaEstado
		WHERE Cuenta_Persona_ID=@persona;
		
		END;
		
		
		
	END
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'tgActualizaRol')
	DROP TRIGGER GEM4.tgActualizaRol;
GO

-- Creo que no lo necesito
/*
CREATE TRIGGER GEM4.tgActualizaRol
ON GEM4.Rol
FOR UPDATE
AS
	BEGIN
		DECLARE @rolCod INT	,@habilitado BIT;
		
		SELECT @rolCod=Rol_Cod,@habilitado=Rol_Habilitado
		FROM inserted;
		
		UPDATE GEM4.Rol_Por_Funcionalidad
		SET Rol_Por_Funcionalidad_Habilitado=@habilitado
		WHERE Rol_Cod=@rolCod;
		
	END		
GO
*/

/* ***************************************** STORED PROCEDURES ************************************************** */

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spLoginUsuario')
	DROP PROCEDURE GEM4.spLoginUsuario;
GO
CREATE PROCEDURE GEM4.spLoginUsuario
    @usuario nvarchar(30), 
    @pass char(44) 
AS 
    SELECT Rol_Cod
		FROM GEM4.Usuario JOIN GEM4.Usuario_Por_Rol ON (Usuario.Usuario_ID = Usuario_Por_Rol.Usuario_ID)
		WHERE Usuario_Username = @usuario AND Usuario_Contrasena = @pass AND Usuario_Habilitado = 1;
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spCantidadRoles')
	DROP PROCEDURE GEM4.spCantidadRoles;
GO
CREATE PROCEDURE GEM4.spCantidadRoles
	@usuario NVARCHAR(30)
AS
	SELECT COUNT(Usuario_Por_Rol.Usuario_ID) CantidadRoles
	FROM GEM4.Usuario_Por_Rol JOIN GEM4.Usuario ON (Usuario.Usuario_ID = Usuario_Por_Rol.Usuario_ID)
	WHERE Usuario.Usuario_Username = @usuario AND Habilitado = 1
	GROUP BY Usuario_Por_Rol.Usuario_ID
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spObtenerRoles')
	DROP PROCEDURE GEM4.spObtenerRoles;
GO
CREATE PROCEDURE GEM4.spObtenerRoles
AS
	SELECT Rol_Nombre, Rol_Cod
	FROM GEM4.Rol
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spObtenerFuncionalidades')
	DROP PROCEDURE GEM4.spObtenerFuncionalidades;
GO
CREATE PROCEDURE GEM4.spObtenerFuncionalidades
	@rol_cod	TINYINT
AS
	SELECT Funcionalidad_Descripcion
	FROM GEM4.Funcionalidad JOIN GEM4.Rol_Por_Funcionalidad ON (Funcionalidad.Funcionalidad_Cod = Rol_Por_Funcionalidad.Funcionalidad_Cod)
	WHERE Rol_Por_Funcionalidad.Rol_Cod = @rol_cod AND Rol_Por_Funcionalidad_Habilitado=1
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spInhabilitarUsuario')
	DROP PROCEDURE GEM4.spInhabilitarUsuario;
GO
CREATE PROCEDURE GEM4.spInhabilitarUsuario
	@username	NVARCHAR(30)
AS
	UPDATE GEM4.Usuario
	SET Usuario_Habilitado = 0,
		Usuario_Fecha_Ultima_Modificacion=GETDATE()
	WHERE Usuario_Username = @username
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spLogLogin')
	DROP PROCEDURE GEM4.spLogLogin
GO
CREATE PROCEDURE GEM4.spLogLogin
	@username	NVARCHAR(30),
	@incorrecto	BIT,
	@nIntento	TINYINT
AS
	DECLARE @usuarioID INT
	SET @usuarioID = (SELECT Usuario_ID FROM Usuario WHERE Usuario_Username = @username)
	INSERT INTO GEM4.Log_Login (Log_Login_Usuario_ID, Log_Login_Fecha, Log_Login_Incorrecto, Log_Login_NIntento) VALUES
		(@usuarioID, GETDATE(), @incorrecto, @nIntento)
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spObtenerDatosUsuario')
	DROP PROCEDURE GEM4.spObtenerDatosUsuario
GO
CREATE PROCEDURE GEM4.spObtenerDatosUsuario
	@username	NVARCHAR(30)
AS
	SELECT Usuario_ID, Usuario_Username, Usuario_Fecha_Creacion, Usuario_Fecha_Ultima_Modificacion, Usuario_Habilitado, Usuario_Contrasena, Usuario_Pregunta_Secreta, Usuario_Respuesta_Secreta
	FROM GEM4.Usuario
	WHERE Usuario_Username LIKE '%'+@username+'%'
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spBajaLogicaUsuario')
	DROP PROCEDURE GEM4.spBajaLogicaUsuario
GO
CREATE PROCEDURE GEM4.spBajaLogicaUsuario
	@usuarioID	INT
AS
	UPDATE GEM4.Usuario
	SET Usuario_Habilitado = 0,
		Usuario_Fecha_Ultima_Modificacion=GETDATE() 
	WHERE Usuario_ID = @usuarioID
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spBuscarRoles')
	DROP PROCEDURE GEM4.spBuscarRoles
GO

CREATE PROCEDURE GEM4.spBuscarRoles
	@rol_cod	INT,
	@rol_nombre NVARCHAR(50)
AS
	SELECT r.Rol_Cod,r.Rol_Nombre,r.Rol_Habilitado	
	FROM GEM4.Rol r
	WHERE (@Rol_Cod ='' OR @Rol_Cod =r.Rol_Cod)
	AND (@Rol_Nombre='' OR r.Rol_Nombre like @Rol_Nombre+'%' )
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spObtenerFuncionalidadesAsignables')
	DROP PROCEDURE GEM4.spObtenerFuncionalidadesAsignables
GO

CREATE PROCEDURE GEM4.spObtenerFuncionalidadesAsignables
AS
	SELECT F.Funcionalidad_Descripcion,F.Funcionalidad_Cod
	FROM GEM4.Funcionalidad F
	WHERE F.Funcionalidad_Habilitada= 1
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spCambiarHabilitacionUsuario')
	DROP PROCEDURE GEM4.spCambiarHabilitacionUsuario
GO

CREATE PROCEDURE GEM4.spCambiarHabilitacionUsuario
	@estado BIT,
	@usuarioID INT
AS
	UPDATE GEM4.Usuario
	SET Usuario_Habilitado = @estado,
		Usuario_Fecha_Ultima_Modificacion=GETDATE() 
	WHERE Usuario_ID = @usuarioID
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spAgregarFuncionalidadARol')
	DROP PROCEDURE GEM4.spAgregarFuncionalidadARol;
go
CREATE PROCEDURE GEM4.spAgregarFuncionalidadARol
    @Rol_Nombre			NVARCHAR(50),
    @Funcionalidad_Cod	TINYINT,
    @Funcionalidad_Hab	BIT
AS 
	UPDATE GEM4.Rol_Por_Funcionalidad
		SET Rol_Por_Funcionalidad_Habilitado = @Funcionalidad_Hab
		WHERE Rol_Cod = (SELECT Rol_Cod FROM GEM4.ROL WHERE Rol_Nombre =@Rol_Nombre)
			AND Funcionalidad_Cod = @Funcionalidad_Cod;
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spCrearRol')
	DROP PROCEDURE GEM4.spCrearRol;
GO

CREATE PROCEDURE GEM4.spCrearRol
    @Rol_Nombre			NVARCHAR(50),
    @Rol_Habilitado			BIT
AS 
	INSERT INTO GEM4.Rol(Rol_Nombre,Rol_Habilitado)
		VALUES (@Rol_Nombre,@Rol_Habilitado);
	
	INSERT INTO GEM4.Rol_Por_Funcionalidad (Funcionalidad_Cod,Rol_Cod,Rol_Por_Funcionalidad_Habilitado)
		SELECT Funcionalidad_Cod,Rol_Cod,0
			FROM GEM4.Rol,GEM4.Funcionalidad
			WHERE Rol_Nombre=@Rol_Nombre;
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spCambiarContraseña')
	DROP PROCEDURE GEM4.spCambiarContraseña;
GO

CREATE PROCEDURE GEM4.spCambiarContraseña
	@usuarioID		INT,
	@nuevaPass		CHAR(44)
AS
	UPDATE GEM4.Usuario
	SET Usuario_Contrasena = @nuevaPass,
	Usuario_Fecha_Ultima_Modificacion=GETDATE()
	WHERE Usuario_ID = @usuarioID
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spCambiarPreguntaSecreta')
	DROP PROCEDURE GEM4.spCambiarPreguntaSecreta;
GO

CREATE PROCEDURE GEM4.spCambiarPreguntaSecreta
	@usuarioID		INT,
	@nuevaPreg		NVARCHAR(60),
	@nuevaResp		NVARCHAR(60)
AS
	UPDATE GEM4.Usuario
	SET Usuario_Pregunta_Secreta = @nuevaPreg,
		Usuario_Respuesta_Secreta = @nuevaResp,
		Usuario_Fecha_Ultima_Modificacion=GETDATE()
	WHERE Usuario_ID = @usuarioID
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spObtenerRolesParaUsuario')
	DROP PROCEDURE GEM4.spObtenerRolesParaUsuario;
GO
CREATE PROCEDURE GEM4.spObtenerRolesParaUsuario
	@usuarioID		INT
AS
	SELECT Rol.Rol_Nombre, Rol.Rol_Cod
	FROM GEM4.Rol JOIN GEM4.Usuario_Por_Rol ON (Rol.Rol_Cod = Usuario_Por_Rol.Rol_Cod)
	WHERE Usuario_ID = @usuarioID AND Habilitado = 1
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spAgregarRolAUsuario')
	DROP PROCEDURE GEM4.spAgregarRolAUsuario;
GO
CREATE PROCEDURE GEM4.spAgregarRolAUsuario
	@usuarioID		INT,
	@rolCod			INT
AS
	INSERT INTO GEM4.Usuario_Por_Rol(Usuario_ID, Rol_Cod, Habilitado) VALUES
		(@usuarioID, @rolCod, 1)
GO	

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spModificarRolAUsuario')
	DROP PROCEDURE GEM4.spModificarRolAUsuario;
GO
CREATE PROCEDURE GEM4.spModificarRolAUsuario
	@usuarioID		INT,
	@viejoRolCod	INT,
	@nuevoRolCod	INT
AS
	UPDATE GEM4.Usuario_Por_Rol
	SET Rol_Cod = @nuevoRolCod
	WHERE Usuario_ID = @usuarioID AND Rol_Cod = @viejoRolCod
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spEliminarRolAUsuario')
	DROP PROCEDURE GEM4.spEliminarRolAUsuario;
GO
CREATE PROCEDURE GEM4.spEliminarRolAUsuario
	@usuarioID		INT,
	@rolCod			INT
AS
	UPDATE GEM4.Usuario_Por_Rol
	SET Habilitado = 0
	WHERE Usuario_ID = @usuarioID AND Rol_Cod = @rolCod
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spAltaUsuario')
	DROP PROCEDURE GEM4.spAltaUsuario;
GO
CREATE PROCEDURE GEM4.spAltaUsuario
	@username		NVARCHAR(30),
	@contraseña		CHAR(44),
	@rolCod			INT,
	@pregSec		NVARCHAR(60),
	@respSec		NVARCHAR(60)
AS
	INSERT INTO GEM4.Usuario(Usuario_Username, Usuario_Contrasena, Usuario_Pregunta_Secreta, Usuario_Respuesta_Secreta, Usuario_Fecha_Creacion, Usuario_Fecha_Ultima_Modificacion) VALUES
		(@username, @contraseña, @pregSec, @respSec, SYSDATETIME(), SYSDATETIME());
	DECLARE @usuarioID INT
	SET @usuarioID = (SELECT Usuario_ID FROM GEM4.Usuario WHERE Usuario_Username = @username)
	INSERT INTO GEM4.Usuario_Por_Rol(Usuario_ID, Rol_Cod, Habilitado) VALUES
		(@usuarioID, @rolCod, 1);
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spUsuarioExiste')
	DROP PROCEDURE GEM4.spUsuarioExiste;
GO
CREATE PROCEDURE GEM4.spUsuarioExiste
	@username		NVARCHAR(30)
AS
	SELECT COUNT(Usuario_Username) FROM GEM4.Usuario WHERE Usuario_Username = @username
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spObtenerDatosCuenta')
	DROP PROCEDURE GEM4.spObtenerDatosCuenta
GO
CREATE PROCEDURE GEM4.spObtenerDatosCuenta
	@numeroCuenta	BIGINT,
	@personaID		INT
AS
	SELECT Cuenta_Numero, Cuenta_Persona_ID, Cuenta_Fecha_Creacion, Cuenta_Fecha_Cierre, Cuenta_Saldo, Cuenta_Tipo, Cuenta_Estado, Cuenta_Moneda, Cuenta_Pais
	FROM GEM4.Cuenta_ABM
	WHERE Cuenta_Persona_ID = @personaID OR Cuenta_Numero = @numeroCuenta
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'sphabilitarODeshabilitarRol')
	DROP PROCEDURE GEM4.sphabilitarODeshabilitarRol;
go
CREATE PROCEDURE GEM4.sphabilitarODeshabilitarRol
    @Rol_Cod			INT,
    @Rol_Habilitado		BIT
AS 
	UPDATE GEM4.Rol
		SET Rol_Habilitado=@Rol_Habilitado
		WHERE @Rol_Cod  = Rol_Cod
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spObtenerNumeroCliente')
	DROP PROCEDURE GEM4.spObtenerNumeroCliente;
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spObtenerNumeroPersona')
	DROP PROCEDURE GEM4.spObtenerNumeroPersona;
GO

CREATE PROCEDURE GEM4.spObtenerNumeroPersona
	@username			NVARCHAR(30)
AS
	SELECT Persona_ID
	FROM GEM4.Usuario
	WHERE Usuario_Username = @username
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spObtenerPaises')
	DROP PROCEDURE GEM4.spObtenerPaises;
GO
CREATE PROCEDURE GEM4.spObtenerPaises
AS
	SELECT Pais_Descripcion, Pais_Cod
	FROM GEM4.Pais
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spObtenerMonedas')
	DROP PROCEDURE GEM4.spObtenerMonedas;
GO
CREATE PROCEDURE GEM4.spObtenerMonedas
AS
	SELECT Moneda_Descripcion, Moneda_Codigo
	FROM GEM4.Moneda
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spObtenerTipoCuentas')
	DROP PROCEDURE GEM4.spObtenerTipoCuentas;
GO
CREATE PROCEDURE GEM4.spObtenerTipoCuentas
AS
	SELECT Tipo_Cuenta_Descripcion, Tipo_Cuenta_ID
	FROM GEM4.Tipo_Cuenta
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spAltaCuenta')
	DROP PROCEDURE GEM4.spAltaCuenta;
GO
CREATE PROCEDURE GEM4.spAltaCuenta
	@personaID		INT,
	@codPais		INT,
	@codMoneda		INT,
	@tipoCuenta		INT
AS
	INSERT INTO GEM4.Cuenta(Cuenta_Persona_ID, Cuenta_Pais, Cuenta_Moneda, Cuenta_Tipo, Cuenta_Fecha_Creacion, Cuenta_Estado, Cuenta_Saldo) VALUES
		(@personaID, @codPais, @codMoneda, @tipoCuenta, SYSDATETIME(), 4, 0)
	
	 
		
		SELECT TOP 1 Cuenta_Numero 
		FROM GEM4.Cuenta 
		WHERE Cuenta_Persona_ID = @personaID 
		ORDER BY Cuenta_Fecha_Creacion DESC
	
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spBuscarClientes')
	DROP PROCEDURE GEM4.spBuscarClientes;
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spBuscarPersonas')
	DROP PROCEDURE GEM4.spBuscarPersonas;
GO

CREATE PROCEDURE GEM4.spBuscarPersonas
	@nombrePersona		NVARCHAR(255),
	@apellidoPersona	NVARCHAR(255),
	@tipoDoc			NVARCHAR(255),
	@nroDoc				VARCHAR(255),
	@mail				NVARCHAR(255)
AS
	

	
	SELECT *
	FROM GEM4.Persona p
	WHERE (@nombrePersona='' OR p.Persona_Nombre LIKE @nombrePersona+'%')
		   AND(@apellidoPersona='' OR p.Persona_Apellido LIKE @apellidoPersona+'%')
		   AND (@tipoDoc='' OR CONVERT(numeric(18, 2),@tipoDoc)=p.Persona_Tipo_Doc)
		   AND (@nroDoc=''OR p.Persona_Numero_Documento LIKE @nroDoc+'%')
		   AND (@mail='' OR p.Persona_Mail LIKE @mail+'%');
			

GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spObtenerTiposDoc')
	DROP PROCEDURE GEM4.spObtenerTiposDoc;
GO

CREATE PROCEDURE GEM4.spObtenerTiposDoc

AS
	
	SELECT Documento_Tipo_Codigo,Documento_Tipo_Descripcion
	FROM GEM4.Documento;
	
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spObtenerFuncionesHabilitadasPorRol')
	DROP PROCEDURE GEM4.spObtenerFuncionesHabilitadasPorRol;
GO
CREATE PROCEDURE GEM4.spObtenerFuncionesHabilitadasPorRol
	@rol_cod	TINYINT
AS
	SELECT Funcionalidad.Funcionalidad_Cod
	FROM GEM4.Funcionalidad JOIN GEM4.Rol_Por_Funcionalidad ON (Funcionalidad.Funcionalidad_Cod = Rol_Por_Funcionalidad.Funcionalidad_Cod)
	WHERE Rol_Por_Funcionalidad.Rol_Cod = @rol_cod AND Rol_Por_Funcionalidad.Rol_Por_Funcionalidad_Habilitado=1
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spObtenerTarjetasCliente')
	DROP PROCEDURE GEM4.spObtenerTarjetasCliente;
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spObtenerTarjetasPersona')
	DROP PROCEDURE GEM4.spObtenerTarjetasPersona;
GO

CREATE PROCEDURE GEM4.spObtenerTarjetasPersona
	@personaID	INT
AS
	SELECT t.Tarjeta_Numero,t.Tarjeta_Codigo_Seg,t.Tarjeta_Emisor_Descripcion,t.Tarjeta_Fecha_Emision,Tarjeta_Fecha_Vencimiento,Tarjeta_Habilitado
	FROM GEM4.Tarjeta t
	WHERE t.Tarjeta_Persona_ID=@personaID
GO				

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spModificarNombreRol')
	DROP PROCEDURE GEM4.spModificarNombreRol;
GO

CREATE PROCEDURE GEM4.spModificarNombreRol
	@Rol_Cod INT,
	@Rol_Nombre	NVARCHAR(255)
	
AS
	UPDATE GEM4.Rol
	SET Rol_Nombre =@Rol_Nombre
	WHERE Rol_Cod =@Rol_Cod
GO	


IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spDarBajaCliente')
	DROP PROCEDURE GEM4.spDarBajaCliente;
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spDarBajaPersona')
	DROP PROCEDURE GEM4.spDarBajaPersona;
GO


CREATE PROCEDURE GEM4.spDarBajaPersona
	@personaID INT
AS
	UPDATE GEM4.Persona
	SET Persona_Habilitado=0
	WHERE Persona_ID=@personaID;
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spCrearCliente')
	DROP PROCEDURE GEM4.spCrearCliente;
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spCrearPersona')
	DROP PROCEDURE GEM4.spCrearPersona;
GO


CREATE PROCEDURE GEM4.spCrearPersona
	@nombre				NVARCHAR(255),
	@apellido			NVARCHAR(255),
	@tipoDoc			NUMERIC(18,0),
	@nroDoc				NUMERIC(18,0),
	@mail				NVARCHAR(255),
	@pais				NUMERIC(18,0),
	@domicilio			NVARCHAR(255),
	@domicilioNumero	NVARCHAR(255),
	@domicilioPiso		NVARCHAR(255),
	@domicilioDepto		NVARCHAR(10),
	@localidad			NVARCHAR(60),
	@nacionalidad		NVARCHAR(60),
	@fechaNac			DATETIME
AS
	
	IF(@domicilioNumero='')
	BEGIN
		SET @domicilioNumero=null;
	END

	
	IF(@domicilioPiso='')
	BEGIN
		SET @domicilioPiso=null;
	END
	
	INSERT INTO GEM4.Persona(Persona_Nombre,Persona_Apellido,Persona_Tipo_Doc,Persona_Numero_Documento,Persona_Mail,Persona_Pais,
				Persona_Dom_Calle,Persona_Dom_Numero,Persona_Dom_Piso,Persona_Dom_Depto,Persona_Localidad,Persona_Nacionalidad,Persona_Fecha_Nacimiento,Persona_Habilitado)
	VALUES (@nombre,@apellido,@tipoDoc,@nroDoc,@mail,@pais,@domicilio,
			@domicilioNumero,@domicilioPiso,@domicilioDepto,@localidad,@nacionalidad,@fechaNac,1)
			
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spObtenerCuentasDeUsuario')
	DROP PROCEDURE GEM4.spObtenerCuentasDeUsuario
GO
CREATE PROCEDURE GEM4.spObtenerCuentasDeUsuario
	@Username	NVARCHAR(30)
AS
	SELECT C.Cuenta_Numero
	FROM GEM4.Cuenta C, GEM4.Usuario U
	WHERE U.Usuario_Username = @Username and U.Persona_ID = C.Cuenta_Persona_ID
GO


IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spModificarCliente')
	DROP PROCEDURE GEM4.spModificarCliente
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spModificarPersona')
	DROP PROCEDURE GEM4.spModificarPersona
GO



CREATE PROCEDURE GEM4.spModificarPersona
	@personaID	INT,
	@nombre NVARCHAR(255),
	@apellido NVARCHAR(255),
	@tipoDoc  NUMERIC(18,0),
	@nroDoc	  NUMERIC(18,0),
	@mail	  NVARCHAR(255),
	@pais	  NUMERIC(18,0),
	@domicilio NVARCHAR(255),
	@domicilioNumero NUMERIC(18,0),
	@domicilioPiso	 NUMERIC(18,0),
	@domicilioDepto	 NVARCHAR(10),
	@localidad		 NVARCHAR(60),
	@nacionalidad	 NVARCHAR(60),
	@fechaNac		 DATETIME,
	@habilitado		BIT
AS
	UPDATE GEM4.Persona
	SET  Persona_Nombre=@nombre,Persona_Apellido=@apellido,Persona_Tipo_Doc=@tipoDoc,
		 Persona_Numero_Documento=@nroDoc,Persona_Mail=@mail,Persona_Pais=@pais,
		 Persona_Dom_Calle=@domicilio,Persona_Dom_Numero=@domicilioNumero,Persona_Dom_Piso=@domicilioPiso,
		 Persona_Dom_Depto=@domicilioDepto,Persona_Localidad=@localidad,Persona_Nacionalidad=@nacionalidad,
		 Persona_Fecha_Nacimiento=@fechaNac,Persona_Habilitado=@habilitado
	WHERE Persona_ID=@personaID
	
	
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spModificarPaisCuenta')
	DROP PROCEDURE GEM4.spModificarPaisCuenta;
GO
CREATE PROCEDURE GEM4.spModificarPaisCuenta
	@codPais		INT,
	@personaID		INT,
	@numeroCuenta	NUMERIC(18,0)
AS
	UPDATE GEM4.Cuenta
	SET Cuenta_Pais = @codPais
	WHERE Cuenta_Persona_ID = @personaID AND Cuenta_Numero = @numeroCuenta
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spModificarTipoCuenta')
	DROP PROCEDURE GEM4.spModificarTipoCuenta;
GO
CREATE PROCEDURE GEM4.spModificarTipoCuenta
	@codTipo		INT,
	@personaID		INT,
	@numeroCuenta	NUMERIC(18,0)
AS
	UPDATE GEM4.Cuenta
	SET Cuenta_Tipo = @codTipo
	WHERE Cuenta_Persona_ID = @personaID AND Cuenta_Numero = @numeroCuenta
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spInhabilitarCuenta')
	DROP PROCEDURE GEM4.spInhabilitarCuenta;
GO
CREATE PROCEDURE GEM4.spInhabilitarCuenta
	@personaID		INT,
	@numeroCuenta	NUMERIC(18,0)
AS
	UPDATE GEM4.Cuenta
	SET Cuenta_Estado = 2
	WHERE Cuenta_Persona_ID = @personaID AND Cuenta_Numero = @numeroCuenta
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spCerrarCuenta')
	DROP PROCEDURE GEM4.spCerrarCuenta;
GO
CREATE PROCEDURE GEM4.spCerrarCuenta
	@personaID		INT,
	@numeroCuenta	NUMERIC(18,0)
AS

--TIENE QUE HABER ALGUN PROCEDURE DE FATUCTURACION PARA VERIFICAR SI ESTA TDO PAGO ANTES DE CERRARLA
	UPDATE GEM4.Cuenta
	SET Cuenta_Estado = 3, Cuenta_Fecha_Cierre = SYSDATETIME()
	WHERE Cuenta_Persona_ID = @personaID AND Cuenta_Numero = @numeroCuenta
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spObtenerTarjetasUsuario')
	DROP PROCEDURE GEM4.spObtenerTarjetasUsuario;
GO
CREATE PROCEDURE GEM4.spObtenerTarjetasUsuario
	@usuarioNombre	NVARCHAR(30)
AS
	DECLARE @Persona INT;
	SET @Persona = (SELECT u.Persona_ID	FROM Usuario u WHERE u.Usuario_Username= @usuarioNombre);
	EXEC GEM4.spObtenerTarjetasPersona @Persona;
GO

IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spDesvincularTarjeta')
	DROP PROCEDURE GEM4.spDesvincularTarjeta;

GO

	
CREATE PROCEDURE GEM4.spDesvincularTarjeta
	@tarjetaNumero NVARCHAR(16)
AS

UPDATE GEM4.Tarjeta
SET Tarjeta_Habilitado=0
WHERE Tarjeta_Numero=@tarjetaNumero;

GO


IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spVincularTarjeta')
	DROP PROCEDURE GEM4.spVincularTarjeta;

GO

CREATE PROCEDURE GEM4.spVincularTarjeta
	@tarjetaNumero NVARCHAR(16)
AS

UPDATE GEM4.Tarjeta
SET Tarjeta_Habilitado=1
WHERE Tarjeta_Numero=@tarjetaNumero;

GO


IF EXISTS (SELECT 1 FROM sys.sysobjects WHERE name = 'spNuevaTarjeta')
	DROP PROCEDURE GEM4.spNuevaTarjeta;

GO


CREATE PROCEDURE GEM4.spNuevaTarjeta
	@tarjetaNumero		NVARCHAR(16),
	@emisorDescripcion	NVARCHAR(255),
	@personaID			INT
AS

--	INSERT INTO GEM4.Tarjeta()

GO