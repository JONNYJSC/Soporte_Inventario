USE [master]
GO
/****** Object:  Database [dbInventario]    Script Date: 1/9/2022 11:27:43 a. m. ******/
CREATE DATABASE [dbInventario]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbInventario', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbInventario.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbInventario_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbInventario_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbInventario] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbInventario].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbInventario] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbInventario] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbInventario] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbInventario] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbInventario] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbInventario] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbInventario] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbInventario] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbInventario] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbInventario] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbInventario] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbInventario] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbInventario] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbInventario] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbInventario] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbInventario] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbInventario] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbInventario] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbInventario] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbInventario] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbInventario] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbInventario] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbInventario] SET RECOVERY FULL 
GO
ALTER DATABASE [dbInventario] SET  MULTI_USER 
GO
ALTER DATABASE [dbInventario] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbInventario] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbInventario] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbInventario] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbInventario] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbInventario] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbInventario', N'ON'
GO
ALTER DATABASE [dbInventario] SET QUERY_STORE = OFF
GO
USE [dbInventario]
GO
/****** Object:  Table [dbo].[Configuracion]    Script Date: 1/9/2022 11:27:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuracion](
	[Recurso] [varchar](50) NULL,
	[Propiedad] [varchar](50) NULL,
	[Valor] [varchar](60) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dato]    Script Date: 1/9/2022 11:27:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dato](
	[IdDato] [int] NOT NULL,
	[UrlLogo] [varchar](500) NULL,
	[NombreLogo] [varchar](100) NULL,
	[Nombre] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 1/9/2022 11:27:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[IdDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[EsActivo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipo]    Script Date: 1/9/2022 11:27:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipo](
	[IdEquipo] [int] IDENTITY(1,1) NOT NULL,
	[IdDepartamento] [int] NULL,
	[codigoInventario] [varchar](50) NULL,
	[Equipo] [varchar](50) NULL,
	[Marca] [varchar](50) NULL,
	[Descripcion] [varchar](1000) NULL,
	[Modelo] [varchar](50) NULL,
	[Direccion_IP] [varchar](50) NULL,
	[EsEstado] [bit] NULL,
	[EsGarantia] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 1/9/2022 11:27:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[idMenu] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](30) NULL,
	[IdMenuPadre] [int] NULL,
	[Icono] [varchar](30) NULL,
	[Controlador] [varchar](30) NULL,
	[PaginaAccion] [varchar](30) NULL,
	[EsActivo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reparacion]    Script Date: 1/9/2022 11:27:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reparacion](
	[IdReparacion] [int] IDENTITY(1,1) NOT NULL,
	[IdEquipo] [int] NULL,
	[IdReparacionDetalle] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdReparacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReparacionDetalle]    Script Date: 1/9/2022 11:27:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReparacionDetalle](
	[IdReparacionDetalle] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](2500) NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdReparacionDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 1/9/2022 11:27:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](30) NULL,
	[EsActivo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolMenu]    Script Date: 1/9/2022 11:27:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolMenu](
	[IdRolMenu] [int] IDENTITY(1,1) NOT NULL,
	[IdRol] [int] NULL,
	[IdMenu] [int] NULL,
	[EsActivo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRolMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 1/9/2022 11:27:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[IdRol] [int] NULL,
	[UrlFoto] [varchar](500) NULL,
	[NombreFoto] [varchar](100) NULL,
	[Clave] [varchar](100) NULL,
	[EsActivo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Departamento] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Equipo] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[ReparacionDetalle] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Rol] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[RolMenu] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Equipo]  WITH CHECK ADD FOREIGN KEY([IdDepartamento])
REFERENCES [dbo].[Departamento] ([IdDepartamento])
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD FOREIGN KEY([IdMenuPadre])
REFERENCES [dbo].[Menu] ([idMenu])
GO
ALTER TABLE [dbo].[Reparacion]  WITH CHECK ADD FOREIGN KEY([IdEquipo])
REFERENCES [dbo].[Equipo] ([IdEquipo])
GO
ALTER TABLE [dbo].[Reparacion]  WITH CHECK ADD FOREIGN KEY([IdReparacionDetalle])
REFERENCES [dbo].[ReparacionDetalle] ([IdReparacionDetalle])
GO
ALTER TABLE [dbo].[RolMenu]  WITH CHECK ADD FOREIGN KEY([IdMenu])
REFERENCES [dbo].[Menu] ([idMenu])
GO
ALTER TABLE [dbo].[RolMenu]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
/****** Object:  StoredProcedure [dbo].[SP_DEL_Empleado]    Script Date: 1/9/2022 11:27:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DEL_Empleado]
(@IdEmplado INT)
AS
SET NOCOUNT ON;
BEGIN
        DELETE FROM dbo.Empleado
        WHERE IdEmpleado = @IdEmplado;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_INS_DetalleReparacion]    Script Date: 1/9/2022 11:27:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INS_DetalleReparacion]
(
    @IdEquipo INT,
    @DescripcionReparacion VARCHAR(2500)
)
AS
BEGIN
    DECLARE @IdDetalleReparacion INT;

    INSERT INTO dbo.DetalleReparacion
    (
        DescripcionReparacion,
        Fecha
    )
    VALUES
    (   @DescripcionReparacion, -- DescripcionReparacion - varchar(2500)
        DEFAULT                 -- Fecha - datetime
        );

    --Obtiene el ultimo id 
    SET @IdDetalleReparacion = IDENT_CURRENT('DetalleReparacion');

    INSERT INTO dbo.Reparacion
    (
        IdReparacionDetalle,
        IdEquipo
    )
    VALUES
    (   @IdDetalleReparacion, -- IdReparacionDetalle - int
        @IdEquipo             -- IdEquipo - int
        );
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_INS_Empleado]    Script Date: 1/9/2022 11:27:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INS_Empleado]
(@Nombre VARCHAR(50))
AS
BEGIN
    INSERT INTO dbo.Empleado
    (
        Nombre
    )
    VALUES
    (@Nombre -- Nombre - varchar(150)
        );
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_SEL_Departamento]    Script Date: 1/9/2022 11:27:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SEL_Departamento]
(@IdDepartamento INT = 0)
AS
BEGIN
    IF @IdDepartamento > 0
        SELECT *
        FROM dbo.Departamento d
        WHERE d.IdDepartamento = @IdDepartamento;
    ELSE
        SELECT *
        FROM dbo.Departamento d;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_SEL_DetalleReparacion]    Script Date: 1/9/2022 11:27:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SEL_DetalleReparacion]
(@IdEquipo INT = 0)
AS
BEGIN
    IF @IdEquipo > 0
        SELECT dr.IdReparacionDetalle,
               dr.DescripcionReparacion,
               dr.Fecha
        FROM dbo.DetalleReparacion dr
            INNER JOIN dbo.Reparacion r
                ON r.IdReparacionDetalle = dr.IdReparacionDetalle
        WHERE r.IdEquipo = @IdEquipo;
    ELSE
        SELECT *
        FROM dbo.DetalleReparacion dr;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_SEL_Empleado]    Script Date: 1/9/2022 11:27:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SEL_Empleado]
(@IdEmpleado INT = 0)
AS
BEGIN
    IF @IdEmpleado > 0
        SELECT *
        FROM dbo.Empleado e
        WHERE e.IdEmpleado = @IdEmpleado;
    ELSE
        SELECT *
        FROM dbo.Empleado e;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_SEL_Equipo]    Script Date: 1/9/2022 11:27:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SEL_Equipo]
(@IdEquipo INT = 0)
AS
BEGIN
    IF @IdEquipo > 0
        SELECT *
        FROM dbo.Equipo e
        WHERE e.IdEquipo = @IdEquipo;
    ELSE
        SELECT *
        FROM dbo.Equipo e;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_SEL_Laboratorio]    Script Date: 1/9/2022 11:27:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SEL_Laboratorio]
(@IdLaboratorio INT = 0)
AS
BEGIN
    IF @IdLaboratorio > 0
        SELECT *
        FROM dbo.Laboratorio l
        WHERE l.IdLaboratorio = @IdLaboratorio;
    ELSE
        SELECT *
        FROM dbo.Laboratorio l;
END;
GO
USE [master]
GO
ALTER DATABASE [dbInventario] SET  READ_WRITE 
GO
