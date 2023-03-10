USE [master]
GO
/****** Object:  Database [i_posgrado]    Script Date: 28/6/2022 16:49:07 ******/
CREATE DATABASE [i_posgrado]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'i_posgrado', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\i_posgrado.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'i_posgrado_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\i_posgrado_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [i_posgrado] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [i_posgrado].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [i_posgrado] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [i_posgrado] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [i_posgrado] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [i_posgrado] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [i_posgrado] SET ARITHABORT OFF 
GO
ALTER DATABASE [i_posgrado] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [i_posgrado] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [i_posgrado] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [i_posgrado] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [i_posgrado] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [i_posgrado] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [i_posgrado] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [i_posgrado] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [i_posgrado] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [i_posgrado] SET  DISABLE_BROKER 
GO
ALTER DATABASE [i_posgrado] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [i_posgrado] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [i_posgrado] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [i_posgrado] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [i_posgrado] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [i_posgrado] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [i_posgrado] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [i_posgrado] SET RECOVERY FULL 
GO
ALTER DATABASE [i_posgrado] SET  MULTI_USER 
GO
ALTER DATABASE [i_posgrado] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [i_posgrado] SET DB_CHAINING OFF 
GO
ALTER DATABASE [i_posgrado] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [i_posgrado] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [i_posgrado] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'i_posgrado', N'ON'
GO
ALTER DATABASE [i_posgrado] SET QUERY_STORE = OFF
GO
USE [i_posgrado]
GO
/****** Object:  User [posgrado]    Script Date: 28/6/2022 16:49:07 ******/
CREATE USER [posgrado] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [evaPosgrado]    Script Date: 28/6/2022 16:49:07 ******/
CREATE USER [evaPosgrado] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [posgrado]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [posgrado]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [posgrado]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [posgrado]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [posgrado]
GO
ALTER ROLE [db_datareader] ADD MEMBER [posgrado]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [posgrado]
GO
ALTER ROLE [db_datareader] ADD MEMBER [evaPosgrado]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [evaPosgrado]
GO
/****** Object:  Table [dbo].[Canton]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canton](
	[CantonId] [int] NOT NULL,
	[Descripcion] [nvarchar](250) NULL,
	[ProvinciaId] [int] NULL,
	[Codigo] [text] NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_Canton] PRIMARY KEY CLUSTERED 
(
	[CantonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria-Pregunta]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria-Pregunta](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Categoria] [nvarchar](50) NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_Categoria-Pregunta] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cohorte]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cohorte](
	[id_cohorte] [int] IDENTITY(14,1) NOT NULL,
	[id_maestria] [int] NULL,
	[detalle] [nvarchar](300) NULL,
	[estado] [nvarchar](10) NULL,
	[eliminado] [bit] NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_Cohorte] PRIMARY KEY CLUSTERED 
(
	[id_cohorte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Convocatoria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Convocatoria](
	[id_convocatoria] [int] IDENTITY(16,1) NOT NULL,
	[id_cohorte] [int] NULL,
	[detalle] [nvarchar](100) NULL,
	[estado] [nvarchar](10) NULL,
	[eliminado] [bit] NULL,
	[fecha_inicio] [date] NULL,
	[fecha_fin] [date] NULL,
	[idPonderacion] [int] NULL,
 CONSTRAINT [PK_Convocatoria] PRIMARY KEY CLUSTERED 
(
	[id_convocatoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuestionario]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuestionario](
	[IdCuestionario] [int] IDENTITY(1,1) NOT NULL,
	[IdMaestria] [int] NULL,
	[Eliminado] [bit] NULL,
	[Descripcion] [nvarchar](100) NULL,
	[Fecha] [date] NULL,
 CONSTRAINT [PK_Cuestionario] PRIMARY KEY CLUSTERED 
(
	[IdCuestionario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cupos_Maestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cupos_Maestria](
	[id_cupos] [int] IDENTITY(1,1) NOT NULL,
	[cupos] [int] NULL,
	[eliminado] [bit] NULL,
	[id_maestria] [int] NULL,
 CONSTRAINT [PK_Cupos_Maestria] PRIMARY KEY CLUSTERED 
(
	[id_cupos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[iddireccion] [int] IDENTITY(1,1) NOT NULL,
	[detalle] [nvarchar](200) NULL,
	[eliminado] [bit] NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[iddireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discapacidad]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discapacidad](
	[DiscapacidadId] [int] NOT NULL,
	[Descripcion] [nvarchar](200) NOT NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_Discapacidad] PRIMARY KEY CLUSTERED 
(
	[DiscapacidadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscapacidadPersona]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscapacidadPersona](
	[DiscapacidadPersonaId] [int] IDENTITY(1,1) NOT NULL,
	[DiscapacidadId] [int] NULL,
	[PersonaId] [int] NULL,
	[Porcentaje] [nvarchar](200) NULL,
	[CarnetNumero] [nvarchar](200) NULL,
	[Descripcion] [nvarchar](200) NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_DiscapacidadPerdona] PRIMARY KEY CLUSTERED 
(
	[DiscapacidadPersonaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doc_Resultados]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doc_Resultados](
	[iddocumento] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](200) NULL,
	[fecha] [date] NULL,
	[formato] [nvarchar](200) NULL,
	[archivo] [nvarchar](200) NULL,
	[eliminado] [bit] NULL,
	[iddirección] [int] NULL,
 CONSTRAINT [PK_Doc_Resultados] PRIMARY KEY CLUSTERED 
(
	[iddocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documento]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documento](
	[iddocumento] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](200) NULL,
	[fecha] [date] NULL,
	[formato] [nvarchar](200) NULL,
	[archivo] [nvarchar](200) NULL,
	[eliminado] [bit] NULL,
	[iddirección] [int] NULL,
 CONSTRAINT [PK_Documento] PRIMARY KEY CLUSTERED 
(
	[iddocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entrevista]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrevista](
	[IdEntrevista] [int] IDENTITY(1,1) NOT NULL,
	[IdCuestionario] [int] NULL,
	[IdInscripcion] [int] NULL,
	[Calificacion] [decimal](4, 2) NULL,
	[Fecha] [date] NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_Entrevista] PRIMARY KEY CLUSTERED 
(
	[IdEntrevista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoCivil]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoCivil](
	[IdEstadoCivil] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](200) NULL,
 CONSTRAINT [PK_EstadiCivil] PRIMARY KEY CLUSTERED 
(
	[IdEstadoCivil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EtapaMaestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EtapaMaestria](
	[idetapa] [int] IDENTITY(1,1) NOT NULL,
	[idplantilla] [int] NULL,
	[titulo] [nvarchar](200) NULL,
	[fecha] [nvarchar](100) NULL,
	[contenido] [nvarchar](max) NULL,
	[eliminado] [bit] NULL,
 CONSTRAINT [PK_EtapaMaestria] PRIMARY KEY CLUSTERED 
(
	[idetapa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evidencia_Pago]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evidencia_Pago](
	[IdEvidenciaPago] [int] IDENTITY(1,1) NOT NULL,
	[IdInscripcion] [int] NULL,
	[evidencia_pago] [nvarchar](100) NULL,
	[valido] [nvarchar](2) NULL,
	[eliminado] [bit] NULL,
 CONSTRAINT [PK_Evidencia_Pago] PRIMARY KEY CLUSTERED 
(
	[IdEvidenciaPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExperienciaLaboral]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExperienciaLaboral](
	[IdExperienciaLaboral] [int] IDENTITY(1,1) NOT NULL,
	[IdPersona] [int] NULL,
	[FechaInicio] [date] NULL,
	[FechaFin] [date] NULL,
	[Empresa] [nvarchar](50) NULL,
	[Puesto] [nvarchar](50) NULL,
	[Estado] [nvarchar](50) NULL,
	[Sueldo] [nvarchar](50) NULL,
 CONSTRAINT [PK_ExperienciaLaboral] PRIMARY KEY CLUSTERED 
(
	[IdExperienciaLaboral] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Financiamiento]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Financiamiento](
	[IdFinanciamiento] [int] IDENTITY(1,1) NOT NULL,
	[TipoFinanciamiento] [nvarchar](50) NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_Financiamiento] PRIMARY KEY CLUSTERED 
(
	[IdFinanciamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Galeria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Galeria](
	[idgaleria] [int] IDENTITY(1,1) NOT NULL,
	[archivo] [nvarchar](200) NULL,
	[eliminado] [bit] NULL,
	[idnoticia] [int] NULL,
 CONSTRAINT [PK_Galeria] PRIMARY KEY CLUSTERED 
(
	[idgaleria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HorarioMaestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HorarioMaestria](
	[idhorario] [int] IDENTITY(1,1) NOT NULL,
	[idplantilla] [int] NULL,
	[detalle] [nvarchar](max) NULL,
	[eliminado] [bit] NULL,
 CONSTRAINT [PK_HorarioMaestria] PRIMARY KEY CLUSTERED 
(
	[idhorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idiomas]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idiomas](
	[Id_idiomas] [int] IDENTITY(1,1) NOT NULL,
	[idioma] [nvarchar](50) NULL,
 CONSTRAINT [PK_Idiomas] PRIMARY KEY CLUSTERED 
(
	[Id_idiomas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InformacionAcademica]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InformacionAcademica](
	[IdInformacionAcademica] [int] IDENTITY(1,1) NOT NULL,
	[IdPersona] [int] NULL,
	[IdNivelInstruccion] [int] NULL,
	[InstitucionAcademica] [nvarchar](200) NULL,
	[TituloAcademico] [nvarchar](200) NULL,
	[NroRegistroTitulo] [nvarchar](200) NULL,
	[PromedioAcademico] [decimal](4, 2) NULL,
	[FechaRegistro] [datetime] NULL,
	[Evidencia_Pdf] [nvarchar](200) NULL,
 CONSTRAINT [PK_EstudiosSuperiores] PRIMARY KEY CLUSTERED 
(
	[IdInformacionAcademica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inscripcion]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inscripcion](
	[IdInscripcion] [int] IDENTITY(1,1) NOT NULL,
	[IdPersona] [int] NULL,
	[IdPeriodo] [int] NULL,
	[IdFinanciamiento] [int] NULL,
	[Idrespuesta] [int] NULL,
	[Fecha] [date] NULL,
	[IdConvocatoria] [int] NULL,
 CONSTRAINT [PK_Inscripcion] PRIMARY KEY CLUSTERED 
(
	[IdInscripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maestria](
	[IdMaestria] [int] IDENTITY(1,1) NOT NULL,
	[NombreMaestria] [nvarchar](100) NULL,
	[EstadoMaestria] [nvarchar](50) NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_Maestria] PRIMARY KEY CLUSTERED 
(
	[IdMaestria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NivelIdiomas]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NivelIdiomas](
	[idNivelIdiomas] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_NivelIdiomas] PRIMARY KEY CLUSTERED 
(
	[idNivelIdiomas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NivelInstruccion]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NivelInstruccion](
	[IdNivelInstruccion] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_NivelDeEstudios] PRIMARY KEY CLUSTERED 
(
	[IdNivelInstruccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Noticia]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Noticia](
	[idnoticia] [int] IDENTITY(1,1) NOT NULL,
	[imagen] [nvarchar](200) NULL,
	[titulo] [nvarchar](200) NULL,
	[resumen] [nvarchar](500) NULL,
	[contenido] [nvarchar](max) NULL,
	[fecha] [date] NULL,
	[eliminado] [bit] NULL,
	[mostrar] [bit] NULL,
	[iddireccion] [int] NULL,
	[url] [nvarchar](max) NULL,
 CONSTRAINT [PK_Noticia] PRIMARY KEY CLUSTERED 
(
	[idnoticia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[PaisId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[PaisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Periodo]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Periodo](
	[IdPeriodo] [int] IDENTITY(1,1) NOT NULL,
	[Detalle] [varchar](50) NULL,
	[Estado] [nvarchar](50) NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_Periodo] PRIMARY KEY CLUSTERED 
(
	[IdPeriodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[IdPersona] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](200) NULL,
	[SegundoNombre] [nvarchar](200) NULL,
	[ApellidoPaterno] [nvarchar](100) NULL,
	[ApellidoMaterno] [nvarchar](100) NULL,
	[Cedula] [nvarchar](200) NULL,
	[Direccion] [nvarchar](200) NULL,
	[CalleSecundaria] [nvarchar](200) NULL,
	[Numero] [nvarchar](200) NULL,
	[ReferenciaD] [nvarchar](200) NULL,
	[TelefonoD] [nvarchar](15) NULL,
	[TelefonoC] [nvarchar](15) NULL,
	[ParroquiaNac] [nvarchar](200) NULL,
	[FechaNac] [datetime] NULL,
	[Email] [nvarchar](200) NULL,
	[Eliminado] [bit] NULL,
	[EtniaId] [int] NULL,
	[CantonId] [int] NULL,
	[TipoSangreID] [int] NULL,
	[EstadoCivilId] [int] NULL,
	[EmailInstitucional] [nvarchar](200) NULL,
	[tipoDocumentoId] [int] NULL,
	[sexoId] [int] NULL,
	[paisNacionalidadId] [int] NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonaIdiomaNivel]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonaIdiomaNivel](
	[idPersonaIdiomaNivel] [int] IDENTITY(1,1) NOT NULL,
	[id_NivelIdioma] [int] NULL,
	[id_Persona] [int] NULL,
	[id_idiomas] [int] NULL,
 CONSTRAINT [PK_PersonaIdiomaNivel] PRIMARY KEY CLUSTERED 
(
	[idPersonaIdiomaNivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personal]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal](
	[idpersona] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](max) NULL,
	[identificación] [nvarchar](200) NULL,
	[foto] [nvarchar](200) NULL,
	[titulo] [nvarchar](200) NULL,
	[correo] [nvarchar](200) NULL,
	[telefono] [nvarchar](200) NULL,
	[eliminado] [bit] NULL,
	[idrolpersona] [int] NULL,
	[iddireccion] [int] NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[idpersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlantillaMaestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlantillaMaestria](
	[idplantilla] [int] IDENTITY(1,1) NOT NULL,
	[idmaestriaweb] [int] NULL,
	[estado] [bit] NULL,
	[banner] [nvarchar](200) NULL,
	[modalidad] [nvarchar](200) NULL,
	[duracion] [nvarchar](200) NULL,
	[gradoacademico] [nvarchar](200) NULL,
	[descripcion] [nvarchar](max) NULL,
	[objetivogeneral] [nvarchar](max) NULL,
	[objetivosespecificos] [nvarchar](max) NULL,
	[perfilaspirante] [nvarchar](max) NULL,
	[requisitosingreso] [nvarchar](max) NULL,
	[resolucion] [nvarchar](200) NULL,
	[admision] [nvarchar](200) NULL,
	[matricula] [nvarchar](200) NULL,
	[colegiatura] [nvarchar](200) NULL,
	[linkinstructivo] [nvarchar](200) NULL,
	[telefono] [nvarchar](200) NULL,
	[emailinstitucional] [nvarchar](200) NULL,
	[email] [nvarchar](200) NULL,
	[color] [nvarchar](200) NULL,
 CONSTRAINT [PK_PlantillaMaestria] PRIMARY KEY CLUSTERED 
(
	[idplantilla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ponderacion]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ponderacion](
	[idPonderacion] [int] IDENTITY(1,1) NOT NULL,
	[cEspecificos] [int] NULL,
	[cGeneral] [int] NULL,
	[Entrevista] [int] NULL,
	[eliminado] [bit] NULL,
 CONSTRAINT [PK_Ponderacion] PRIMARY KEY CLUSTERED 
(
	[idPonderacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[Detalle] [nvarchar](200) NULL,
	[Estado] [nvarchar](50) NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreguntasCuestionario]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreguntasCuestionario](
	[IdPreguntaCuestionario] [int] IDENTITY(1,1) NOT NULL,
	[IdPregunta] [int] NULL,
	[IdCuestionario] [int] NULL,
	[Valor] [decimal](4, 2) NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_PreguntasCuestionario_1] PRIMARY KEY CLUSTERED 
(
	[IdPreguntaCuestionario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreguntasE]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreguntasE](
	[IdPreguntas] [int] IDENTITY(1,1) NOT NULL,
	[Detalle] [nvarchar](200) NULL,
	[IdCategoria] [int] NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_PreguntasE] PRIMARY KEY CLUSTERED 
(
	[IdPreguntas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreguntasEntrevista]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreguntasEntrevista](
	[IdPreguntaEntrevista] [int] IDENTITY(1,1) NOT NULL,
	[IdEntrevista] [int] NULL,
	[IdPreguntaCuestionario] [int] NULL,
	[Calificacion] [decimal](4, 2) NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_PreguntasCuestionario] PRIMARY KEY CLUSTERED 
(
	[IdPreguntaEntrevista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preseleccionados]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preseleccionados](
	[Id_preseleccionado] [int] IDENTITY(1,1) NOT NULL,
	[Id_inscripcion] [int] NULL,
	[Puntaje] [decimal](4, 2) NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_Preseleccionados] PRIMARY KEY CLUSTERED 
(
	[Id_preseleccionado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[ProvinciaId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](250) NULL,
	[Codigo] [int] NULL,
	[PaisId] [int] NULL,
	[Eliminado] [bit] NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[ProvinciaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[DetalleRespuesta] [nvarchar](max) NULL,
	[IdPregunta] [int] NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolMaestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolMaestria](
	[id_usuario] [int] NOT NULL,
	[id_maestria] [int] NOT NULL,
 CONSTRAINT [PK_RolMaestria] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC,
	[id_maestria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sexo]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sexo](
	[sexoId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](150) NULL,
 CONSTRAINT [PK_Sexo] PRIMARY KEY CLUSTERED 
(
	[sexoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[idslider] [int] IDENTITY(1,1) NOT NULL,
	[foto] [nvarchar](200) NULL,
	[titulo] [nvarchar](200) NULL,
	[eliminado] [bit] NULL,
	[iddirección] [int] NULL,
	[link] [nvarchar](500) NULL,
 CONSTRAINT [PK_Sliders] PRIMARY KEY CLUSTERED 
(
	[idslider] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoIdentificacion]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoIdentificacion](
	[tipoDocumentoId] [int] IDENTITY(1,1) NOT NULL,
	[Etiqueta] [varchar](50) NULL,
 CONSTRAINT [PK_TipoIdentificacion] PRIMARY KEY CLUSTERED 
(
	[tipoDocumentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPersona]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPersona](
	[idrolpersona] [int] IDENTITY(1,1) NOT NULL,
	[detallerol] [nvarchar](200) NULL,
	[eliminado] [bit] NULL,
 CONSTRAINT [PK_TipoPersona] PRIMARY KEY CLUSTERED 
(
	[idrolpersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[TipoUsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](200) NULL,
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[TipoUsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[UsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [nvarchar](200) NULL,
	[Pass] [nvarchar](200) NULL,
	[Estado] [nvarchar](200) NULL,
	[UltimoAcceso] [datetime] NULL,
	[TipoUsuarioId] [int] NULL,
	[IdPersona] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebMaestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebMaestria](
	[idmaestriaweb] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [nvarchar](200) NULL,
	[mencion] [nvarchar](200) NULL,
	[imagen] [nvarchar](200) NULL,
	[contenido] [nvarchar](500) NULL,
	[enlace] [nvarchar](200) NULL,
	[idDireccion] [int] NULL,
	[eliminado] [bit] NULL,
 CONSTRAINT [PK_WebMaestria] PRIMARY KEY CLUSTERED 
(
	[idmaestriaweb] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Canton]  WITH CHECK ADD  CONSTRAINT [FK_Canton_Provincia] FOREIGN KEY([ProvinciaId])
REFERENCES [dbo].[Provincia] ([ProvinciaId])
GO
ALTER TABLE [dbo].[Canton] CHECK CONSTRAINT [FK_Canton_Provincia]
GO
ALTER TABLE [dbo].[Cohorte]  WITH CHECK ADD  CONSTRAINT [FK_Cohorte_Maestria] FOREIGN KEY([id_maestria])
REFERENCES [dbo].[Maestria] ([IdMaestria])
GO
ALTER TABLE [dbo].[Cohorte] CHECK CONSTRAINT [FK_Cohorte_Maestria]
GO
ALTER TABLE [dbo].[Convocatoria]  WITH CHECK ADD  CONSTRAINT [FK_Convocatoria_Cohorte] FOREIGN KEY([id_cohorte])
REFERENCES [dbo].[Cohorte] ([id_cohorte])
GO
ALTER TABLE [dbo].[Convocatoria] CHECK CONSTRAINT [FK_Convocatoria_Cohorte]
GO
ALTER TABLE [dbo].[Cuestionario]  WITH CHECK ADD  CONSTRAINT [FK_Cuestionario_Maestria] FOREIGN KEY([IdMaestria])
REFERENCES [dbo].[Maestria] ([IdMaestria])
GO
ALTER TABLE [dbo].[Cuestionario] CHECK CONSTRAINT [FK_Cuestionario_Maestria]
GO
ALTER TABLE [dbo].[Cupos_Maestria]  WITH CHECK ADD  CONSTRAINT [FK_Cupos_Maestria_Maestria] FOREIGN KEY([id_maestria])
REFERENCES [dbo].[Maestria] ([IdMaestria])
GO
ALTER TABLE [dbo].[Cupos_Maestria] CHECK CONSTRAINT [FK_Cupos_Maestria_Maestria]
GO
ALTER TABLE [dbo].[DiscapacidadPersona]  WITH CHECK ADD  CONSTRAINT [FK_DiscapacidadPersona_Discapacidad] FOREIGN KEY([DiscapacidadId])
REFERENCES [dbo].[Discapacidad] ([DiscapacidadId])
GO
ALTER TABLE [dbo].[DiscapacidadPersona] CHECK CONSTRAINT [FK_DiscapacidadPersona_Discapacidad]
GO
ALTER TABLE [dbo].[DiscapacidadPersona]  WITH CHECK ADD  CONSTRAINT [FK_DiscapacidadPersona_Persona] FOREIGN KEY([PersonaId])
REFERENCES [dbo].[Persona] ([IdPersona])
GO
ALTER TABLE [dbo].[DiscapacidadPersona] CHECK CONSTRAINT [FK_DiscapacidadPersona_Persona]
GO
ALTER TABLE [dbo].[Entrevista]  WITH CHECK ADD  CONSTRAINT [FK_Entrevista_Cuestionario] FOREIGN KEY([IdCuestionario])
REFERENCES [dbo].[Cuestionario] ([IdCuestionario])
GO
ALTER TABLE [dbo].[Entrevista] CHECK CONSTRAINT [FK_Entrevista_Cuestionario]
GO
ALTER TABLE [dbo].[Entrevista]  WITH CHECK ADD  CONSTRAINT [FK_Entrevista_Inscripcion] FOREIGN KEY([IdInscripcion])
REFERENCES [dbo].[Inscripcion] ([IdInscripcion])
GO
ALTER TABLE [dbo].[Entrevista] CHECK CONSTRAINT [FK_Entrevista_Inscripcion]
GO
ALTER TABLE [dbo].[Evidencia_Pago]  WITH CHECK ADD  CONSTRAINT [FK_Evidencia_Pago_Inscripcion] FOREIGN KEY([IdInscripcion])
REFERENCES [dbo].[Inscripcion] ([IdInscripcion])
GO
ALTER TABLE [dbo].[Evidencia_Pago] CHECK CONSTRAINT [FK_Evidencia_Pago_Inscripcion]
GO
ALTER TABLE [dbo].[ExperienciaLaboral]  WITH CHECK ADD  CONSTRAINT [FK_ExperienciaLaboral_Persona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([IdPersona])
GO
ALTER TABLE [dbo].[ExperienciaLaboral] CHECK CONSTRAINT [FK_ExperienciaLaboral_Persona]
GO
ALTER TABLE [dbo].[InformacionAcademica]  WITH CHECK ADD  CONSTRAINT [FK_EstudiosSuperiores_NivelDeEstudios] FOREIGN KEY([IdNivelInstruccion])
REFERENCES [dbo].[NivelInstruccion] ([IdNivelInstruccion])
GO
ALTER TABLE [dbo].[InformacionAcademica] CHECK CONSTRAINT [FK_EstudiosSuperiores_NivelDeEstudios]
GO
ALTER TABLE [dbo].[InformacionAcademica]  WITH CHECK ADD  CONSTRAINT [FK_InformacionAcademica_Persona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([IdPersona])
GO
ALTER TABLE [dbo].[InformacionAcademica] CHECK CONSTRAINT [FK_InformacionAcademica_Persona]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Convocatoria] FOREIGN KEY([IdConvocatoria])
REFERENCES [dbo].[Convocatoria] ([id_convocatoria])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Convocatoria]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Financiamiento] FOREIGN KEY([IdFinanciamiento])
REFERENCES [dbo].[Financiamiento] ([IdFinanciamiento])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Financiamiento]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Periodo] FOREIGN KEY([IdPeriodo])
REFERENCES [dbo].[Periodo] ([IdPeriodo])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Periodo]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Persona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([IdPersona])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Persona]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Respuestas] FOREIGN KEY([Idrespuesta])
REFERENCES [dbo].[Respuestas] ([IdRespuesta])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Respuestas]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_Canton] FOREIGN KEY([CantonId])
REFERENCES [dbo].[Canton] ([CantonId])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_Canton]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_EstadoCivil] FOREIGN KEY([EstadoCivilId])
REFERENCES [dbo].[EstadoCivil] ([IdEstadoCivil])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_EstadoCivil]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_Sexo] FOREIGN KEY([sexoId])
REFERENCES [dbo].[Sexo] ([sexoId])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_Sexo]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_TipoIdentificacion] FOREIGN KEY([tipoDocumentoId])
REFERENCES [dbo].[TipoIdentificacion] ([tipoDocumentoId])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_TipoIdentificacion]
GO
ALTER TABLE [dbo].[PersonaIdiomaNivel]  WITH CHECK ADD  CONSTRAINT [FK_PersonaIdiomaNivel_Idiomas] FOREIGN KEY([id_idiomas])
REFERENCES [dbo].[Idiomas] ([Id_idiomas])
GO
ALTER TABLE [dbo].[PersonaIdiomaNivel] CHECK CONSTRAINT [FK_PersonaIdiomaNivel_Idiomas]
GO
ALTER TABLE [dbo].[PersonaIdiomaNivel]  WITH CHECK ADD  CONSTRAINT [FK_PersonaIdiomaNivel_NivelIdiomas] FOREIGN KEY([id_NivelIdioma])
REFERENCES [dbo].[NivelIdiomas] ([idNivelIdiomas])
GO
ALTER TABLE [dbo].[PersonaIdiomaNivel] CHECK CONSTRAINT [FK_PersonaIdiomaNivel_NivelIdiomas]
GO
ALTER TABLE [dbo].[PreguntasCuestionario]  WITH CHECK ADD  CONSTRAINT [FK_PreguntasCuestionario_Cuestionario] FOREIGN KEY([IdCuestionario])
REFERENCES [dbo].[Cuestionario] ([IdCuestionario])
GO
ALTER TABLE [dbo].[PreguntasCuestionario] CHECK CONSTRAINT [FK_PreguntasCuestionario_Cuestionario]
GO
ALTER TABLE [dbo].[PreguntasCuestionario]  WITH CHECK ADD  CONSTRAINT [FK_PreguntasCuestionario_PreguntasE] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[PreguntasE] ([IdPreguntas])
GO
ALTER TABLE [dbo].[PreguntasCuestionario] CHECK CONSTRAINT [FK_PreguntasCuestionario_PreguntasE]
GO
ALTER TABLE [dbo].[PreguntasEntrevista]  WITH CHECK ADD  CONSTRAINT [FK_PreguntasEntrevista_Entrevista] FOREIGN KEY([IdEntrevista])
REFERENCES [dbo].[Entrevista] ([IdEntrevista])
GO
ALTER TABLE [dbo].[PreguntasEntrevista] CHECK CONSTRAINT [FK_PreguntasEntrevista_Entrevista]
GO
ALTER TABLE [dbo].[PreguntasEntrevista]  WITH CHECK ADD  CONSTRAINT [FK_PreguntasEntrevista_PreguntasCuestionario] FOREIGN KEY([IdPreguntaCuestionario])
REFERENCES [dbo].[PreguntasCuestionario] ([IdPreguntaCuestionario])
GO
ALTER TABLE [dbo].[PreguntasEntrevista] CHECK CONSTRAINT [FK_PreguntasEntrevista_PreguntasCuestionario]
GO
ALTER TABLE [dbo].[Preseleccionados]  WITH CHECK ADD  CONSTRAINT [FK_Preseleccionados_Inscripcion] FOREIGN KEY([Id_inscripcion])
REFERENCES [dbo].[Inscripcion] ([IdInscripcion])
GO
ALTER TABLE [dbo].[Preseleccionados] CHECK CONSTRAINT [FK_Preseleccionados_Inscripcion]
GO
ALTER TABLE [dbo].[Provincia]  WITH CHECK ADD  CONSTRAINT [FK_Provincia_Pais] FOREIGN KEY([PaisId])
REFERENCES [dbo].[Pais] ([PaisId])
GO
ALTER TABLE [dbo].[Provincia] CHECK CONSTRAINT [FK_Provincia_Pais]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Preguntas] ([IdPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
/****** Object:  StoredProcedure [dbo].[active_usuario]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[active_usuario]
	@iduser int
AS
BEGIN
	
	UPDATE Usuario
	set Estado='ACTIVO'
	WHERE UsuarioId=@iduser
END
GO
/****** Object:  StoredProcedure [dbo].[actualizar_cohorte]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[actualizar_cohorte] 
	-- Add the parameters for the stored procedure here
@idcohorte int,
@idmaes int,
@detalle nvarchar(200),
@estado nvarchar(10)
AS
BEGIN
	UPDATE Cohorte
		SET id_maestria = @idmaes, detalle=@detalle, estado =  @estado
		WHERE id_cohorte = @idcohorte
END
GO
/****** Object:  StoredProcedure [dbo].[actualizar_convocatoria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[actualizar_convocatoria]
@idconvocatoria int,
@idcohorte int,
@detalle nvarchar(100),
@estado nvarchar(10)
AS
BEGIN
	UPDATE Convocatoria
	SET	id_cohorte = @idcohorte, detalle = @detalle, estado = @estado
	WHERE id_convocatoria= @idconvocatoria
END
GO
/****** Object:  StoredProcedure [dbo].[actualizar_cupos]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[actualizar_cupos]
	@idcupos int,
	@cupos int,
	@idmaestria int
AS	
BEGIN


UPDATE    Cupos_Maestria
SET       cupos =  @cupos,
		  id_maestria =  @idmaestria
		 			
where id_cupos=@idcupos

END


GO
/****** Object:  StoredProcedure [dbo].[actualizar_preguntas]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[actualizar_preguntas]
	@id int, @descripcion nvarchar(200)
AS
BEGIN
	UPDATE PreguntasE
	SET Detalle=@descripcion,Eliminado=0
	WHERE IdPreguntas = @id
END
GO
/****** Object:  StoredProcedure [dbo].[ad_delete_financiamientoBit]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ad_delete_financiamientoBit]
	@id_financiamiento int	
	--@tipo varchar(200)
	
AS	
BEGIN


UPDATE    Financiamiento
SET       
--TipoFinanciamiento =  @tipo,		  
		  Eliminado = CONVERT(bit,1)
		 			
	where (IdFinanciamiento=@id_financiamiento)

END
GO
/****** Object:  StoredProcedure [dbo].[ad_delete_maestriaBit]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ad_delete_maestriaBit]
	@id_maestria int,	
	--@nombre varchar(200),
	@estado varchar (200)
AS	
BEGIN


UPDATE    Maestria
SET       
--NombreMaestria =  @nombre,
		  EstadoMaestria =  @estado,
		  Eliminado = CONVERT(bit,1)
		 			
where IdMaestria = @id_maestria

END
GO
/****** Object:  StoredProcedure [dbo].[ad_delete_periodoBit]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ad_delete_periodoBit]
	@id_periodo int,
	--@detalle varchar(200),
	@estado varchar (200)
	
AS	
BEGIN


UPDATE    Periodo
SET         
--Detalle =  @detalle,
		 Estado =  @estado,
		  Eliminado = CONVERT(bit,1)
		 			
where IdPeriodo=@id_periodo

END
GO
/****** Object:  StoredProcedure [dbo].[ad_delete_preguntaBit]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ad_delete_preguntaBit]
	@id_pregunta int,
	--@detalle varchar(200),	
	@estado varchar(200)
	
AS	
BEGIN


UPDATE    Preguntas

SET       
--Detalle =  @detalle,	
		  Estado =  @estado,		  
		  Eliminado = CONVERT(bit,1)
		 			
	where (IdPregunta = @id_pregunta)

END
GO
/****** Object:  StoredProcedure [dbo].[ad_input_financiamiento]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ad_input_financiamiento]
	
	@tipo_financimiento varchar(50)
AS	
BEGIN
BEGIN TRANSACTION;

BEGIN TRY   

if not exists (SELECT TipoFinanciamiento
FROM            Financiamiento
WHERE        (TipoFinanciamiento = @tipo_financimiento))
begin  
declare @mensaje nvarchar (100)
INSERT INTO Financiamiento
                      (TipoFinanciamiento,Eliminado)
VALUES     (@tipo_financimiento,0)

set @mensaje = 'ok' 
	select @mensaje as resultado;
end
	else
	begin 

	set @mensaje = 'El financiamiento ya existe'
		select @mensaje as resultado;
	end 

END TRY
BEGIN CATCH
   

	set @mensaje = 'Error'
select @mensaje as resultado;
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;
IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
END

GO
/****** Object:  StoredProcedure [dbo].[ad_input_maestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ad_input_maestria] 
	@nombre_maestria varchar(100),
	@estado_maestria varchar(50)
AS
BEGIN

BEGIN TRANSACTION;

BEGIN TRY   


if not exists (SELECT NombreMaestria
FROM            Maestria
WHERE        (NombreMaestria = @nombre_maestria))
begin  
declare @mensaje nvarchar (100)

INSERT INTO Maestria
                      (NombreMaestria, EstadoMaestria,Eliminado)
VALUES     (@nombre_maestria,@estado_maestria,0)

	set @mensaje = 'ok' 
	select @mensaje as resultado;
end
	else
	begin 

	set @mensaje = 'La maestría ya existe'
		select @mensaje as resultado;
	end 
END TRY
BEGIN CATCH  

	set @mensaje = 'Error'
select @mensaje as resultado;
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;
IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;



END
GO
/****** Object:  StoredProcedure [dbo].[ad_input_periodo]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ad_input_periodo]
	@detalle varchar(50),
	@estado varchar (50)
AS	
BEGIN

BEGIN TRANSACTION;

BEGIN TRY   


if not exists (SELECT Detalle
FROM            Periodo
WHERE        (Detalle = @detalle))
begin  
declare @mensaje nvarchar (100)

INSERT INTO Periodo
                      (Detalle, Estado, Eliminado)
VALUES     (@detalle,@estado,0)
	
	set @mensaje = 'ok' 
	select @mensaje as resultado;
end
	else
	begin 

	set @mensaje = 'El periodo ya existe'
		select @mensaje as resultado;
	end 


END TRY
BEGIN CATCH
   

	set @mensaje = 'Error'
select @mensaje as resultado;
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;
IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
END


GO
/****** Object:  StoredProcedure [dbo].[ad_input_pregunta]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ad_input_pregunta]
	
	@pregunta varchar(200),
	@estado varchar(50)
AS	
BEGIN
BEGIN TRANSACTION;

BEGIN TRY   

if not exists (SELECT Detalle
FROM            Preguntas
WHERE        (Detalle = @pregunta))
begin  
declare @mensaje nvarchar (100)
INSERT INTO Preguntas(Detalle, Estado,Eliminado)
VALUES     (@pregunta,@estado, 0 )


set @mensaje = 'ok' 
	select @mensaje as resultado;
end
	else
	begin 

	set @mensaje = 'La pregunta ya existe'
		select @mensaje as resultado;
	end 

END TRY
BEGIN CATCH
   

	set @mensaje = 'Error'
select @mensaje as resultado;
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;
IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
END
GO
/****** Object:  StoredProcedure [dbo].[admin_load_inscripciones]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[admin_load_inscripciones] 
	@idconv int
AS
BEGIN

SELECT        i.IdInscripcion, p.Cedula, p.Nombres, p.SegundoNombre, p.ApellidoPaterno, p.ApellidoMaterno, CONVERT(date, i.Fecha, 103) AS Fecha, m.NombreMaestria, m.EstadoMaestria, m.IdMaestria, p.TelefonoC, p.Email, 
                         IA.Evidencia_Pdf
FROM            Inscripcion AS i INNER JOIN
                         Convocatoria c ON i.IdConvocatoria = c.id_convocatoria INNER JOIN
                         Persona AS p ON i.IdPersona = p.IdPersona INNER JOIN
                         InformacionAcademica AS IA ON p.IdPersona = IA.IdPersona INNER JOIN
                         Cohorte co ON c.id_cohorte = co.id_cohorte	INNER JOIN 
						 dbo.Maestria m ON co.id_maestria = m.IdMaestria
WHERE        (i.IdConvocatoria = @idconv)
ORDER BY i.Fecha ASC
END
GO
/****** Object:  StoredProcedure [dbo].[admin_load_personas_idmaestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[admin_load_personas_idmaestria] 
	 @maestriax int,
	  @periodox int
AS
BEGIN
exec AdministracionAcademica.posgrado.[admin_load_personas_idmaestria]
	 @maestriax = @maestriax,
	  @periodox = @periodox
END




GO
/****** Object:  StoredProcedure [dbo].[admitidos_por_cohorte]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[admitidos_por_cohorte]
	@idcohorte int
AS
BEGIN
	SELECT  Preseleccionados.Id_preseleccionado,  Persona.Nombres + ' ' + Persona.SegundoNombre + ' ' + Persona.ApellidoPaterno + ' ' + Persona.ApellidoMaterno as Persona, Convocatoria.detalle AS Convocatoria, Preseleccionados.Puntaje
FROM            Cohorte INNER JOIN
                         Convocatoria ON Cohorte.id_cohorte = Convocatoria.id_cohorte INNER JOIN
                         Inscripcion ON Convocatoria.id_convocatoria = Inscripcion.IdConvocatoria INNER JOIN
                         Maestria ON Cohorte.id_maestria = Maestria.IdMaestria INNER JOIN
                         Persona ON Inscripcion.IdPersona = Persona.IdPersona INNER JOIN
                         Preseleccionados ON Inscripcion.IdInscripcion=Preseleccionados.Id_inscripcion
WHERE        (Preseleccionados.Eliminado = 0) AND (Cohorte.eliminado = 0) AND (Maestria.Eliminado = 0) AND (Convocatoria.eliminado = 0) AND (Persona.Eliminado = 0) AND (Convocatoria.id_cohorte = @idcohorte)
END
GO
/****** Object:  StoredProcedure [dbo].[asigna_Maestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[asigna_Maestria]
	@id_user int, @id_maes int
AS
BEGIN
	insert into RolMaestria(id_usuario, id_maestria)
	values (@id_user, @id_maes)
END
GO
/****** Object:  StoredProcedure [dbo].[Autocompletar]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Autocompletar]	
@apellidoPaterno nvarchar(100)
AS
BEGIN


	SELECT        Persona.ApellidoPaterno + ' ' + Persona.ApellidoMaterno + ' ' + Persona.Nombres AS Nombres, Persona.Cedula, Persona.IdPersona, Inscripcion.IdConvocatoria
FROM            Persona INNER JOIN
                         Inscripcion ON Persona.IdPersona = Inscripcion.IdPersona INNER JOIN
                         Convocatoria ON Inscripcion.IdConvocatoria = Convocatoria.id_convocatoria
WHERE        Persona.ApellidoPaterno + ' ' + Persona.ApellidoMaterno LIKE '%' + RTRIM(@apellidoPaterno + '%') OR Persona.Nombres LIKE '%' + RTRIM(@apellidoPaterno) + '%'

	--SELECT  ApellidoPaterno  +' '+ ApellidoMaterno +' '+ Nombres +' '+ SegundoNombre as Nombres, Cedula, Id_Persona
	--FROM talentoHumano.Persona 
	--WHERE ApellidoPaterno LIKE '%' + RTRIM(@filtro) + '%';

END

GO
/****** Object:  StoredProcedure [dbo].[Autocompletar1]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[Autocompletar1]	
@apellidoPaterno nvarchar(100)
AS
BEGIN


	SELECT  ApellidoPaterno  +' '+ ApellidoMaterno +' '+ Nombres  as Nombres, Cedula, IdPersona
	FROM Persona 
	WHERE ApellidoPaterno  +' '+ ApellidoMaterno LIKE '%' + RTRIM(@apellidoPaterno) + '%' or Nombres LIKE '%' + RTRIM(@apellidoPaterno) + '%' ;

	--SELECT  ApellidoPaterno  +' '+ ApellidoMaterno +' '+ Nombres +' '+ SegundoNombre as Nombres, Cedula, Id_Persona
	--FROM talentoHumano.Persona 
	--WHERE ApellidoPaterno LIKE '%' + RTRIM(@filtro) + '%';

END

GO
/****** Object:  StoredProcedure [dbo].[cambiar_clave]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[cambiar_clave]
@iduser int,
@clave nvarchar(50)
AS
BEGIN
	UPDATE Usuario
	SET Pass = @clave
	WHERE UsuarioId = @iduser and Estado='ACTIVO'
END
GO
/****** Object:  StoredProcedure [dbo].[categorias_pregunta]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[categorias_pregunta]
AS
BEGIN
	SELECT        Categoria, idCategoria
FROM            [Categoria-Pregunta]
WHERE        (Eliminado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[cohorte_por_maestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[cohorte_por_maestria]
	@idmaes int
AS
BEGIN
SELECT        Cohorte.id_cohorte, Cohorte.detalle, Cohorte.estado
FROM            Cohorte INNER JOIN
                         Maestria ON Cohorte.id_maestria = Maestria.IdMaestria
WHERE        (Cohorte.id_maestria = @idmaes) AND (Cohorte.eliminado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[consultar_admitido]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[consultar_admitido]
@idcohorte int
AS
BEGIN
	SELECT        Preseleccionados.Id_preseleccionado, Persona.Nombres + ' ' + Persona.SegundoNombre + ' ' + Persona.ApellidoPaterno + ' ' + Persona.ApellidoMaterno AS Persona, Cohorte.detalle AS Cohorte, 
                         Convocatoria.detalle AS Convocatoria, Preseleccionados.Puntaje
FROM            Cohorte INNER JOIN
                         Convocatoria ON Cohorte.id_cohorte = Convocatoria.id_cohorte INNER JOIN
                         Inscripcion ON Convocatoria.id_convocatoria = Inscripcion.IdConvocatoria INNER JOIN
                         Maestria ON Cohorte.id_maestria = Maestria.IdMaestria INNER JOIN
                         Persona ON Inscripcion.IdPersona = Persona.IdPersona INNER JOIN
                         Preseleccionados ON Inscripcion.IdInscripcion = Preseleccionados.Id_inscripcion
WHERE        (Preseleccionados.Eliminado = 0) AND (Cohorte.eliminado = 0) AND (Maestria.Eliminado = 0) AND (Convocatoria.eliminado = 0) AND (Persona.Eliminado = 0) AND (Convocatoria.id_cohorte = @idcohorte)
ORDER BY Preseleccionados.Puntaje DESC
END
GO
/****** Object:  StoredProcedure [dbo].[consultar_admitido_conv]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[consultar_admitido_conv]
@idconvocatoria int
AS
BEGIN
	SELECT        Preseleccionados.Id_preseleccionado, Persona.Nombres + ' ' + Persona.SegundoNombre + ' ' + Persona.ApellidoPaterno + ' ' + Persona.ApellidoMaterno AS Persona, Cohorte.detalle AS Cohorte, 
                         Convocatoria.detalle AS Convocatoria, Preseleccionados.Puntaje
FROM            Cohorte INNER JOIN
                         Convocatoria ON Cohorte.id_cohorte = Convocatoria.id_cohorte INNER JOIN
                         Inscripcion ON Convocatoria.id_convocatoria = Inscripcion.IdConvocatoria INNER JOIN
                         Maestria ON Cohorte.id_maestria = Maestria.IdMaestria INNER JOIN
                         Persona ON Inscripcion.IdPersona = Persona.IdPersona INNER JOIN
                         Preseleccionados ON Inscripcion.IdInscripcion = Preseleccionados.Id_inscripcion
WHERE        (Preseleccionados.Eliminado = 0) AND (Cohorte.eliminado = 0) AND (Maestria.Eliminado = 0) AND (Convocatoria.eliminado = 0) AND (Persona.Eliminado = 0) AND (Convocatoria.id_convocatoria = @idconvocatoria)
ORDER BY Preseleccionados.Puntaje DESC
END
GO
/****** Object:  StoredProcedure [dbo].[consultar_cohorte]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[consultar_cohorte] 	-- Add the parameters for the stored procedure here

AS
BEGIN
SELECT        Cohorte.id_cohorte, Cohorte.id_maestria, Maestria.NombreMaestria, Cohorte.detalle, Cohorte.estado
FROM            Cohorte INNER JOIN
                         Maestria ON Cohorte.id_maestria = Maestria.IdMaestria
WHERE        (Cohorte.eliminado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[consultar_convocatoria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[consultar_convocatoria]
AS
BEGIN
	SELECT        Convocatoria.id_convocatoria, Convocatoria.id_cohorte, Maestria.NombreMaestria, Cohorte.detalle AS cohorte, Convocatoria.detalle AS convocatoria, Convocatoria.estado, Ponderacion.cEspecificos, Ponderacion.cGeneral, 
                         Ponderacion.Entrevista
FROM            Cohorte INNER JOIN
                         Convocatoria ON Cohorte.id_cohorte = Convocatoria.id_cohorte INNER JOIN
                         Maestria ON Cohorte.id_maestria = Maestria.IdMaestria INNER JOIN
                         Ponderacion ON Convocatoria.idPonderacion = Ponderacion.idPonderacion
WHERE        (Convocatoria.eliminado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[consultar_cupos]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[consultar_cupos]
	 
AS
BEGIN
SELECT        Cupos_Maestria.id_cupos, Cupos_Maestria.cupos, Maestria.NombreMaestria
FROM            Cupos_Maestria INNER JOIN
                         Maestria ON Cupos_Maestria.id_maestria = Maestria.IdMaestria
WHERE        Cupos_Maestria.eliminado = 0
END
GO
/****** Object:  StoredProcedure [dbo].[consultar_detalle_cuestionario]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[consultar_detalle_cuestionario]
@idcuestionario int
AS
BEGIN
	SELECT        PreguntasE.Detalle, PreguntasCuestionario.Valor
FROM            Cuestionario INNER JOIN
                         PreguntasCuestionario ON Cuestionario.IdCuestionario = PreguntasCuestionario.IdCuestionario INNER JOIN
                         PreguntasE ON PreguntasCuestionario.IdPregunta = PreguntasE.IdPreguntas
WHERE        (PreguntasCuestionario.IdCuestionario = @idcuestionario) AND (PreguntasE.Eliminado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[consultar_detalle_entrevista]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[consultar_detalle_entrevista]
@idinscripcion int
AS
BEGIN
SELECT        PreguntasE.Detalle, PreguntasEntrevista.Calificacion
FROM            Entrevista INNER JOIN
                         PreguntasEntrevista ON Entrevista.IdEntrevista = PreguntasEntrevista.IdEntrevista INNER JOIN
                         PreguntasCuestionario ON PreguntasEntrevista.IdPreguntaCuestionario = PreguntasCuestionario.IdPreguntaCuestionario INNER JOIN
                         PreguntasE ON PreguntasCuestionario.IdPregunta = PreguntasE.IdPreguntas
WHERE        (Entrevista.IdInscripcion = @idinscripcion)
END
GO
/****** Object:  StoredProcedure [dbo].[consultar_notas]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[consultar_notas] 
@idconv int
AS
BEGIN

SELECT         Persona.Nombres + ' ' + Persona.SegundoNombre + ' ' + Persona.ApellidoPaterno + ' ' + Persona.ApellidoMaterno as Postulante, m.NombreMaestria,  
                             (SELECT        TOP (1) it.Calificacion
                               FROM            ReactivosPosgrado.evaluacion.Instrumento AS it INNER JOIN
                                                         ReactivosPosgrado.evaluacion.Prueba AS pru ON it.IdTest = pru.IdTest INNER JOIN
                                                         ReactivosPosgrado.evaluacion.SubAreas_Prueba AS sar ON pru.IdTest = sar.IdPrueba INNER JOIN
                                                         Inscripcion AS inst ON it.Cod_Matricula = inst.IdInscripcion
                               WHERE        (it.carrera = @idconv) AND (pru.Eliminado = 0)  AND (pru.TipoTest = 'GENERAL') AND(ins.IdInscripcion = it.Cod_Matricula) 
                               ORDER BY it.Calificacion DESC) AS CalificacionGeneral,
							    (SELECT        TOP (1) it.Calificacion
                               FROM            ReactivosPosgrado.evaluacion.Instrumento AS it INNER JOIN
                                                         ReactivosPosgrado.evaluacion.Prueba AS pru ON it.IdTest = pru.IdTest INNER JOIN
                                                         ReactivosPosgrado.evaluacion.SubAreas_Prueba AS sar ON pru.IdTest = sar.IdPrueba INNER JOIN
                                                         Inscripcion AS inst ON it.Cod_Matricula = inst.IdInscripcion
                               WHERE        (it.carrera = @idconv) AND (pru.Eliminado = 0) AND (pru.TipoTest = 'PARTICULAR') AND(ins.IdInscripcion = it.Cod_Matricula)
                               ORDER BY it.Calificacion DESC) AS CalificacionParticular, 
							   
							   (SELECT TOP (1)ent.Calificacion
							    FROM Entrevista AS ent  
								WHERE (ent.IdInscripcion = ins.IdInscripcion) AND (ent.Eliminado = 0)
								) as Entrevista,

							   ins.IdInscripcion
FROM            
                         Inscripcion AS ins  INNER JOIN
						 Convocatoria as con on ins.IdConvocatoria = con.id_convocatoria inner join
						 Cohorte as co on con.id_cohorte = co.id_cohorte inner join
                         Maestria as m ON co.id_maestria = m.IdMaestria  inner join 
                         Persona ON ins.IdPersona = Persona.IdPersona inner join 
						 ReactivosPosgrado.evaluacion.Instrumento it on ins.IdInscripcion = it.Cod_Matricula
WHERE        (ins.IdConvocatoria = @idconv) AND(ins.IdInscripcion = it.Cod_Matricula)
GROUP BY m.IdMaestria, m.NombreMaestria, Persona.Nombres, Persona.SegundoNombre, Persona.ApellidoPaterno, Persona.ApellidoMaterno,ins.IdInscripcion, it.Cod_Matricula, it.carrera
END
GO
/****** Object:  StoredProcedure [dbo].[consultar_notas_cohorte]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[consultar_notas_cohorte]
@idcohorte int
AS
BEGIN
	declare @idmaes int


SELECT       @idmaes = Maestria.IdMaestria
FROM            Cohorte INNER JOIN
                         Maestria ON Cohorte.id_maestria = Maestria.IdMaestria
WHERE        (Maestria.Eliminado = 0) AND (Cohorte.eliminado = 0) AND (Maestria.IdMaestria = @idcohorte)

SELECT         Persona.Nombres + ' ' + Persona.SegundoNombre + ' ' + Persona.ApellidoPaterno + ' ' + Persona.ApellidoMaterno as Postulante, m.NombreMaestria,  
                             (SELECT        TOP (1) it.Calificacion
                               FROM            ReactivosPosgrado.evaluacion.Instrumento AS it INNER JOIN
                                                         ReactivosPosgrado.evaluacion.Prueba AS pru ON it.IdTest = pru.IdTest INNER JOIN
                                                         ReactivosPosgrado.evaluacion.SubAreas_Prueba AS sar ON pru.IdTest = sar.IdPrueba INNER JOIN
                                                         Inscripcion AS inst ON it.Cod_Matricula = inst.IdInscripcion
                               WHERE        (it.carrera = @idmaes) AND (pru.Eliminado = 0)  AND (pru.TipoTest = 'GENERAL') AND(ins.IdInscripcion = it.Cod_Matricula) 
                               ORDER BY it.Calificacion DESC) AS CalificacionGeneral,
							    (SELECT        TOP (1) it.Calificacion
                               FROM            ReactivosPosgrado.evaluacion.Instrumento AS it INNER JOIN
                                                         ReactivosPosgrado.evaluacion.Prueba AS pru ON it.IdTest = pru.IdTest INNER JOIN
                                                         ReactivosPosgrado.evaluacion.SubAreas_Prueba AS sar ON pru.IdTest = sar.IdPrueba INNER JOIN
                                                         Inscripcion AS inst ON it.Cod_Matricula = inst.IdInscripcion
                               WHERE        (it.carrera = @idmaes) AND (pru.Eliminado = 0) AND (pru.TipoTest = 'PARTICULAR') AND(ins.IdInscripcion = it.Cod_Matricula)
                               ORDER BY it.Calificacion DESC) AS CalificacionParticular, 
							   
							   (SELECT TOP (1)ent.Calificacion
							    FROM Entrevista AS ent  
								WHERE (ent.IdInscripcion = ins.IdInscripcion) AND (ent.Eliminado = 0)
								) as Entrevista,

							   ins.IdInscripcion,con.detalle as Convocatoria
FROM            
                         Inscripcion AS ins  INNER JOIN
						 Convocatoria as con on ins.IdConvocatoria = con.id_convocatoria inner join
						 Cohorte as co on con.id_cohorte = co.id_cohorte inner join
                         Maestria as m ON co.id_maestria = m.IdMaestria  inner join 
                         Persona ON ins.IdPersona = Persona.IdPersona inner join 
						 ReactivosPosgrado.evaluacion.Instrumento it on ins.IdInscripcion = it.Cod_Matricula
WHERE        (ins.IdInscripcion = it.Cod_Matricula) and (co.id_maestria=@idmaes)
GROUP BY m.IdMaestria, m.NombreMaestria, Persona.Nombres, Persona.SegundoNombre, Persona.ApellidoPaterno, Persona.ApellidoMaterno,ins.IdInscripcion, it.Cod_Matricula, it.carrera, con.detalle
END
GO
/****** Object:  StoredProcedure [dbo].[consultar_ponderacion]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[consultar_ponderacion]
AS
BEGIN
	SELECT        idPonderacion, cEspecificos, cGeneral, Entrevista
FROM            Ponderacion
WHERE        (eliminado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[consultar_tipo_pregunta]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[consultar_tipo_pregunta]

AS
BEGIN
	SELECT idCategoria, Categoria
	FROM [Categoria-Pregunta]
	WHERE Eliminado = 0
END
GO
/****** Object:  StoredProcedure [dbo].[consultar_usuarios]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[consultar_usuarios]

AS
BEGIN
	SELECT        Usuario.UsuarioId, Personal.nombre, Usuario.NombreUsuario, Usuario.Estado, TipoPersona.detallerol, TipoUsuario.Descripcion, Usuario.Pass
FROM            TipoUsuario INNER JOIN
                         Usuario ON TipoUsuario.TipoUsuarioId = Usuario.TipoUsuarioId INNER JOIN
                         Personal ON Usuario.IdPersona = Personal.idpersona INNER JOIN
                         TipoPersona ON Personal.idrolpersona = TipoPersona.idrolpersona
WHERE        (Usuario.Estado = N'ACTIVO')
END
GO
/****** Object:  StoredProcedure [dbo].[contadores_inicio]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[contadores_inicio]
AS
BEGIN
declare @maestrias int = (select count(Maestria.NombreMaestria)
						from Maestria where Eliminado =0)

declare @postulaciones int = (select count(Inscripcion.IdInscripcion)
from Inscripcion)

declare @preseleccionados int = (select count(Preseleccionados.Id_inscripcion) 
from Preseleccionados)

declare @intenciones int = (SELECT        count(Inscripcion.IdInscripcion) 
FROM            Evidencia_Pago INNER JOIN
                         Inscripcion ON Evidencia_Pago.IdInscripcion = Inscripcion.IdInscripcion INNER JOIN
                         Persona ON Inscripcion.IdPersona = Persona.IdPersona
WHERE        (Evidencia_Pago.evidencia_pago = N'') AND (Evidencia_Pago.valido = N'NO'))

select @maestrias  as Maestrias, @postulaciones  as Postulaciones,@preseleccionados as Preseleccionados,@intenciones as IntenEstudio
END
GO
/****** Object:  StoredProcedure [dbo].[convocatorias_por_cohorte]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[convocatorias_por_cohorte]
@idcohorte int
AS
BEGIN
	SELECT        Convocatoria.id_convocatoria, Convocatoria.detalle, Convocatoria.estado
FROM            Cohorte INNER JOIN
                         Convocatoria ON Cohorte.id_cohorte = Convocatoria.id_cohorte INNER JOIN
                         Maestria ON Cohorte.id_maestria = Maestria.IdMaestria
WHERE        (Convocatoria.id_cohorte = @idcohorte) AND (Convocatoria.eliminado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[cuestionario_por_maestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[cuestionario_por_maestria]
@idmaestria int
AS
BEGIN
	SELECT        Cuestionario.IdCuestionario, Cuestionario.Descripcion
FROM            Cuestionario INNER JOIN
                         Maestria ON Cuestionario.IdMaestria = Maestria.IdMaestria
WHERE        (Cuestionario.IdMaestria = @idmaestria) AND (Cuestionario.Eliminado = 0)
END

GO
/****** Object:  StoredProcedure [dbo].[delete_documento]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[delete_documento]
@iddoc int
AS
BEGIN
	UPDATE Documento
	SET eliminado= CONVERT(BIT,1)
	WHERE iddocumento=@iddoc
END
GO
/****** Object:  StoredProcedure [dbo].[delete_Etapa]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[delete_Etapa]
@idetapa int
AS
BEGIN
	UPDATE EtapaMaestria
	SET eliminado=CONVERT(bit,1)
	WHERE idetapa=@idetapa
END
GO
/****** Object:  StoredProcedure [dbo].[delete_financiamiento]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[delete_financiamiento]
	@id_financiamiento int
AS
BEGIN
	SET NOCOUNT ON;
	delete from Financiamiento
	where (IdFinanciamiento=@id_financiamiento)


END





GO
/****** Object:  StoredProcedure [dbo].[delete_galeria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[delete_galeria]
	@idgal int
AS
BEGIN
	UPDATE Galeria
	SET eliminado=CONVERT (BIT,1)
	WHERE idgaleria=@idgal
END
GO
/****** Object:  StoredProcedure [dbo].[delete_Horario]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[delete_Horario]
@idhorario int
AS
BEGIN
	UPDATE HorarioMaestria
	SET eliminado=CONVERT(BIT,1)
	WHERE idhorario=@idhorario
END
GO
/****** Object:  StoredProcedure [dbo].[delete_maestría]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[delete_maestría]
	@id_maestria int
AS
BEGIN
	SET NOCOUNT ON;
	delete from Maestria
	where (IdMaestria = @id_maestria)


END





GO
/****** Object:  StoredProcedure [dbo].[delete_noticia]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[delete_noticia]
@idnoti int
AS
BEGIN
	UPDATE Noticia
	SET eliminado=CONVERT(bit, 1), mostrar=CONVERT(bit, 1)
	WHERE idnoticia=@idnoti
END
GO
/****** Object:  StoredProcedure [dbo].[delete_periodo]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[delete_periodo]
	@id_periodo int
AS
BEGIN
	SET NOCOUNT ON;
	delete from Periodo
	where (IdPeriodo = @id_periodo)


END





GO
/****** Object:  StoredProcedure [dbo].[delete_personal]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[delete_personal]
	@idpersona int
AS
BEGIN
	UPDATE Personal
	SET eliminado = CONVERT(bit,1)
	WHERE idpersona=@idpersona
END
GO
/****** Object:  StoredProcedure [dbo].[delete_PlantillaMaestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[delete_PlantillaMaestria]
@id int
AS
BEGIN
	UPDATE PlantillaMaestria
	SET estado= CONVERT(BIT,1)
	WHERE idplantilla=@id
END
GO
/****** Object:  StoredProcedure [dbo].[delete_pregunta]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[delete_pregunta]
	@id_pregunta int
AS
BEGIN
	SET NOCOUNT ON;
	delete from Preguntas
	where (IdPregunta = @id_pregunta)


END





GO
/****** Object:  StoredProcedure [dbo].[delete_results]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[delete_results]
@iddoc int
AS
BEGIN
	UPDATE Doc_Resultados
	SET eliminado= CONVERT(BIT,1)
	WHERE iddocumento=@iddoc
END
GO
/****** Object:  StoredProcedure [dbo].[delete_slider]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[delete_slider]
@id int
AS
BEGIN
	UPDATE Sliders
	SET eliminado=CONVERT(BIT,1)
	WHERE idslider=@id
END
GO
/****** Object:  StoredProcedure [dbo].[delete_tipoPersona]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[delete_tipoPersona]
	@idtipo int
AS
BEGIN
	UPDATE TipoPersona
	SET eliminado= CONVERT(bit,1)
	WHERE idrolpersona=@idtipo
END
GO
/****** Object:  StoredProcedure [dbo].[delete_usuario]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[delete_usuario]
	@id_usuario int
AS
BEGIN
	
	SET NOCOUNT ON;

    UPDATE Usuario
	set Estado= 'INACTIVO'
	where UsuarioId=@id_usuario
END
GO
/****** Object:  StoredProcedure [dbo].[delete_usuariomaes]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[delete_usuariomaes]
	@id_usuario int,
	@id_maestria int
AS
BEGIN	
DELETE
FROM            RolMaestria
WHERE        (id_usuario = @id_usuario) AND (id_maestria = @id_maestria)
    
END
GO
/****** Object:  StoredProcedure [dbo].[delete_WebMaestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[delete_WebMaestria]
@id int
AS
BEGIN
	UPDATE WebMaestria
	SET eliminado= CONVERT(bit, 1)
	WHERE idmaestriaweb=@id
END
GO
/****** Object:  StoredProcedure [dbo].[detalle_maestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[detalle_maestria]
as
begin
SELECT        Maestria.NombreMaestria + ' - ' + Cohorte.detalle + ' - ' + Convocatoria.detalle AS Detalle, Convocatoria.id_convocatoria
FROM            Cohorte INNER JOIN
                         Convocatoria ON Cohorte.id_cohorte = Convocatoria.id_cohorte INNER JOIN
                         Maestria ON Cohorte.id_maestria = Maestria.IdMaestria
WHERE        (Maestria.Eliminado = 0) AND (Convocatoria.eliminado = 0) AND (Cohorte.eliminado = 0)
end
GO
/****** Object:  StoredProcedure [dbo].[eliminar_admitido]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[eliminar_admitido]
@idpreseleccionado int
AS
BEGIN
	UPDATE Preseleccionados
	SET Eliminado = CONVERT(BIT,1)
	WHERE Id_preseleccionado = @idpreseleccionado
END
GO
/****** Object:  StoredProcedure [dbo].[eliminar_cohorte]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[eliminar_cohorte] 
	-- Add the parameters for the stored procedure here
@idcohorte int
AS
BEGIN
	UPDATE Cohorte
		SET eliminado = CONVERT(bit,1)
		WHERE id_cohorte = @idcohorte
END
GO
/****** Object:  StoredProcedure [dbo].[eliminar_convocatoria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[eliminar_convocatoria]
@idconvocatoria int
AS
BEGIN
	UPDATE Convocatoria
	SET	eliminado = CONVERT(bit, 1)
	WHERE id_convocatoria= @idconvocatoria
END
GO
/****** Object:  StoredProcedure [dbo].[eliminar_cuestionario]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[eliminar_cuestionario]
	@id_cuestionario int
AS
BEGIN
	
	SET NOCOUNT ON;

    UPDATE Cuestionario
	set Eliminado= 1
	where IdCuestionario=@id_cuestionario
END
GO
/****** Object:  StoredProcedure [dbo].[eliminar_cupos]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[eliminar_cupos]
	@idcupos int	
AS	
BEGIN


UPDATE    Cupos_Maestria
SET       eliminado =  convert(bit,1)		  
		 			
where id_cupos=@idcupos

END

GO
/****** Object:  StoredProcedure [dbo].[eliminar_ponderacion]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[eliminar_ponderacion]
@idponderacion int
AS
BEGIN
	UPDATE Ponderacion
	SET eliminado = 1
	WHERE idPonderacion = @idponderacion
END
GO
/****** Object:  StoredProcedure [dbo].[eliminar_preg_cuest]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[eliminar_preg_cuest]
@idpreguntacuest int
AS
BEGIN
	update PreguntasCuestionario
	set Eliminado = 1
	where IdPreguntaCuestionario = @idpreguntacuest
END

GO
/****** Object:  StoredProcedure [dbo].[eliminar_pregunta]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[eliminar_pregunta]
	@id_pregunta int
AS
BEGIN
	
	SET NOCOUNT ON;

    UPDATE PreguntasE
	set Eliminado= 1
	where IdPreguntas=@id_pregunta
END
GO
/****** Object:  StoredProcedure [dbo].[eliminar_puntaje]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[eliminar_puntaje]
	@idpuntaje int
AS
BEGIN
	
	SET NOCOUNT ON;

    UPDATE PuntajeEntrevista
	set Eliminado= 1
	where IdPuntaje=@idpuntaje
END
GO
/****** Object:  StoredProcedure [dbo].[eliminar_tipo_pregunta]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[eliminar_tipo_pregunta]
@idcategoria int
AS
BEGIN
	UPDATE [Categoria-Pregunta]
	SET Eliminado = 1
	WHERE idCategoria = @idcategoria
END
GO
/****** Object:  StoredProcedure [dbo].[get_enlace]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_enlace]
	@idmaes int
AS
BEGIN
SELECT        WebMaestria.enlace
FROM            WebMaestria INNER JOIN
                         PlantillaMaestria ON WebMaestria.idmaestriaweb = PlantillaMaestria.idmaestriaweb
WHERE        (WebMaestria.idmaestriaweb = @idmaes)
END
GO
/****** Object:  StoredProcedure [dbo].[get_urlimage]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_urlimage] 
	@idmaes int
AS
BEGIN
SELECT        PlantillaMaestria.banner
FROM            PlantillaMaestria INNER JOIN
                         WebMaestria ON PlantillaMaestria.idmaestriaweb = WebMaestria.idmaestriaweb
WHERE        (PlantillaMaestria.idmaestriaweb = @idmaes) AND (PlantillaMaestria.estado = CONVERT(bit,0)) AND (WebMaestria.eliminado = CONVERT(bit,0))
END
GO
/****** Object:  StoredProcedure [dbo].[ingresar_admitido]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ingresar_admitido]
@idinscripcion int,
@puntaje decimal(4,2)
AS
BEGIN

BEGIN TRANSACTION

BEGIN TRY
IF NOT EXISTS(SELECT Preseleccionados.Id_inscripcion
				FROM Preseleccionados
				WHERE Id_inscripcion = @idinscripcion)

begin  
		declare @mensaje nvarchar (100)
		declare @cupos int
		declare @idmaes int

		SELECT      @idmaes=  Maestria.IdMaestria
		FROM            Cohorte INNER JOIN Convocatoria ON Cohorte.id_cohorte = Convocatoria.id_cohorte INNER JOIN
								 Inscripcion ON Convocatoria.id_convocatoria = Inscripcion.IdConvocatoria INNER JOIN
								 Maestria ON Cohorte.id_maestria = Maestria.IdMaestria
		WHERE        (Inscripcion.IdInscripcion = @idinscripcion)
		select @idmaes

		select @cupos = cupos
		from Cupos_Maestria inner join Maestria on Cupos_Maestria.id_maestria = Maestria.IdMaestria
		where Cupos_Maestria.id_maestria = @idmaes

		declare @registros int

		select @registros = count (*)
		from Preseleccionados as p inner join Inscripcion as i on p.Id_inscripcion = i.IdInscripcion inner join
		Convocatoria as c on i.IdConvocatoria = c.id_convocatoria inner join Cohorte as co on c.id_cohorte = co.id_cohorte inner join
		Maestria as m on co.id_maestria = m.IdMaestria
		where p.Eliminado = 0 and m.IdMaestria = @idmaes

		IF (@cupos = @registros)
			BEGIN	
			set @mensaje = 'lleno' 
			select @mensaje as resultado;
			END
		ELSE
			BEGIN
			INSERT INTO Preseleccionados (Id_inscripcion, Puntaje, Eliminado)
			VALUES (@idinscripcion, @puntaje, convert(bit,0))
			set @mensaje = 'ok' 
			select @mensaje as resultado;
		END
	end
else
	begin 

	set @mensaje = 'existe'
		select @mensaje as resultado;
	end 
END TRY
BEGIN CATCH  

	set @mensaje = 'error'
select @mensaje as resultado;
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;
IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;

END
GO
/****** Object:  StoredProcedure [dbo].[ingresar_cohorte]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ingresar_cohorte] 
	-- Add the parameters for the stored procedure here
@idmaes int,
@detalle nvarchar(200),
@estado nvarchar(10),
@fecha date
AS
BEGIN
	INSERT INTO Cohorte (id_maestria, detalle, estado, eliminado,fecha)
	VALUES (@idmaes, @detalle, @estado, convert(bit,0),@fecha)
END
GO
/****** Object:  StoredProcedure [dbo].[ingresar_convocatoria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ingresar_convocatoria]
@idcohorte int,
@detalle nvarchar(100),
@estado nvarchar(10),
@incio date,
@fin date,
@ponderacionId int
AS
BEGIN
	INSERT INTO Convocatoria (id_cohorte, detalle, estado, eliminado, fecha_inicio, fecha_fin, idPonderacion)
	VALUES (@idcohorte, @detalle, @estado, CONVERT(bit, 0), @incio, @fin, @ponderacionId)
END
GO
/****** Object:  StoredProcedure [dbo].[ingresar_cuestionario]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ingresar_cuestionario]
	@idmaestria int,
	@descrpcion nvarchar(100),
	@fecha date
	
AS
BEGIN
	
        insert into Cuestionario(IdMaestria,  Eliminado, Descripcion, Fecha)
	values (@idmaestria, 0, @descrpcion, @fecha)
	
END
GO
/****** Object:  StoredProcedure [dbo].[ingresar_cupos]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ingresar_cupos]
	@cupos as int, @maestria int	
AS
BEGIN
	
	insert into Cupos_Maestria(cupos, eliminado, id_maestria)
	values (@cupos, 0, @maestria)


END
GO
/****** Object:  StoredProcedure [dbo].[ingresar_ponderacion]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ingresar_ponderacion]
@esp int,
@gen int,
@ent int
AS
BEGIN
	INSERT INTO Ponderacion(cEspecificos, cGeneral, Entrevista, eliminado)
	VALUES (@esp, @gen, @ent, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[ingresar_preguntas]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ingresar_preguntas]
	@descripcion nvarchar(200),
	@idcategoria int
	
AS
BEGIN
	
	insert into PreguntasE(Detalle, IdCategoria, Eliminado)
	values (@descripcion,@idcategoria, 0)



END
GO
/****** Object:  StoredProcedure [dbo].[ingresar_preguntas_cuestionario]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ingresar_preguntas_cuestionario]
	@idpregunta int,
	@idcuestionario int,
	@valor decimal(4,2)
			
AS
IF NOT EXISTS (SELECT * FROM PreguntasCuestionario  WHERE IdPregunta = @idpregunta and IdCuestionario= @idcuestionario) 
BEGIN  
	INSERT INTO PreguntasCuestionario
                         (IdPregunta, IdCuestionario, Valor, Eliminado)
VALUES        (@idpregunta,@idcuestionario,@valor,0)
END 
ELSE
BEGIN
	UPDATE PreguntasCuestionario
	SET Eliminado = 0
	WHERE IdPregunta = @idpregunta
END
GO
/****** Object:  StoredProcedure [dbo].[ingresar_puntaje]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ingresar_puntaje]
	@identrevista int,
	@valor decimal(4,2),	
	@idpreguntas int
	
AS
BEGIN
insert into PreguntasEntrevista(IdEntrevista,IdPreguntaCuestionario, Calificacion, Eliminado)
values (@identrevista,@idpreguntas,@valor,0)
END
GO
/****** Object:  StoredProcedure [dbo].[ingresar_tipo_pregunta]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ingresar_tipo_pregunta]
@detalle nvarchar(100)
AS
BEGIN
	INSERT INTO [Categoria-Pregunta](Categoria, Eliminado)
	VALUES (@detalle, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[ingresar_total]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ingresar_total]
	
	@idpersona int,	
	@idcuestionario int,	
	@valor decimal(4,2),	
	@fecha date,
	@idconvocatoria int
	
AS
BEGIN
BEGIN TRANSACTION;

BEGIN TRY
declare @idinscripcion int


SELECT       @idinscripcion = Inscripcion.IdInscripcion
FROM            Inscripcion INNER JOIN
                         Convocatoria ON Inscripcion.IdConvocatoria = Convocatoria.id_convocatoria INNER JOIN
                         Persona ON Inscripcion.IdPersona = Persona.IdPersona
WHERE        (Inscripcion.IdConvocatoria = @idconvocatoria) AND (Inscripcion.IdPersona = @idpersona)


if (@idinscripcion IS NULL)

begin  
	declare @mensaje nvarchar (100)
	set @mensaje = 'La persona no está inscrita en ninguna maestría'
	select @mensaje as resultado
	end

else

begin 		
		if not exists (SELECT IdEntrevista FROM Entrevista WHERE IdInscripcion = @idinscripcion)	
			BEGIN
				insert into Entrevista(IdCuestionario,IdInscripcion, Calificacion, Fecha, Eliminado)
				values (@idcuestionario,@idinscripcion,@valor,@fecha,0)
				declare @id int

				set @id =  (select top 1 IdEntrevista from Entrevista order by IdEntrevista desc ); 	
				set @mensaje = @id
				select @mensaje as resultado;
			END
		ELSE
			BEGIN
				set @mensaje = 'existe'
				select @mensaje as resultado
			END		
end 

END TRY
BEGIN CATCH  
set @mensaje = 'error'
select @mensaje as resultado;
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;
IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
END
GO
/****** Object:  StoredProcedure [dbo].[ingresar_usuario]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ingresar_usuario]
	@nom nvarchar(200),
	@pass nvarchar (200),
	@estado nvarchar (200),
	@access datetime,
	@idtipo int
	
AS
BEGIN
	
	insert into Usuario ([NombreUsuario],[Pass],[Estado],[UltimoAcceso],[TipoUsuarioId])
	values (@nom, @pass, @estado,@access,@idtipo)
END
GO
/****** Object:  StoredProcedure [dbo].[ingresar_usuarios]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ingresar_usuarios]
	@nom nvarchar(200),
	@pass nvarchar (200),
	@access datetime,
	@idtipo int,
	@idper int
	
AS
BEGIN
	
	insert into Usuario (NombreUsuario, Pass, Estado, UltimoAcceso, TipoUsuarioId, IdPersona)
	values (@nom, @pass, 'ACTIVO',@access,@idtipo, @idper)
END
GO
/****** Object:  StoredProcedure [dbo].[input_documento]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[input_documento]
@nom nvarchar(200), @fecha date, @formato nvarchar(200), @archivo nvarchar(200)
AS
BEGIN
	INSERT INTO Documento (nombre,fecha,formato,archivo,eliminado,iddirección)
	VALUES (@nom,@fecha,@formato,@archivo,CONVERT(bit,0), 1)
END
GO
/****** Object:  StoredProcedure [dbo].[input_Etapa]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[input_Etapa]
@idplantilla int, @titulo nvarchar(200), @fecha nvarchar(200), @contenido nvarchar(200)
AS
BEGIN
	INSERT INTO EtapaMaestria(idplantilla,titulo,fecha,contenido,eliminado)
	VALUES (@idplantilla,@titulo,@fecha,@contenido, CONVERT(BIT,0))
END
GO
/****** Object:  StoredProcedure [dbo].[input_financiamiento]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[input_financiamiento]
	
	@tipo_financimiento varchar(50)
AS	
BEGIN

INSERT INTO Financiamiento
                      (TipoFinanciamiento)
VALUES     (@tipo_financimiento)


END





GO
/****** Object:  StoredProcedure [dbo].[input_galeria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[input_galeria]
	@archivo nvarchar(200), @idnoti int
AS
BEGIN
	INSERT INTO Galeria (archivo, eliminado, idnoticia)
	VALUES (@archivo, CONVERT(bit, 0), @idnoti)
END
GO
/****** Object:  StoredProcedure [dbo].[input_Horario]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[input_Horario]
@idplantilla int, @detalle nvarchar(200)
AS
BEGIN
	INSERT INTO HorarioMaestria(idplantilla,detalle,eliminado)
	VALUES(@idplantilla, @detalle, CONVERT(BIT,0))
END
GO
/****** Object:  StoredProcedure [dbo].[input_inscripcion]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[input_inscripcion]

@nombres varchar(200),
@SegundoNombre varchar(200),
@apellido1 varchar(100),
@apellido2 varchar(100),
@cedula varchar(10),
@direccion varchar(200),
@telefono1 varchar(10),
@telefono2 varchar(10),
@fechanac date,
@email varchar(50),
@cantonid int,
@estadocivilid int,
@tipoDocumentoId int,
@sexoId int,
@paisNacionalidadId int,
@evidenciapdf varchar(50),
@evidenciapago varchar(50),


--idpersona
@idnivelinstruccion int,
@institucion varchar(50),
@titulo varchar(50),
@nroregistro varchar(50),
@promedio decimal(18,2),
@fecharegistro date,


--id_persona
@fechaini date,
@fechafin date,
@empresa varchar(50),
@puesto varchar(50),
@estado varchar(50),
@sueldo varchar(100),


@detallerespuesta varchar(max),
@id_pregunta int,


@id_nivelidioma int,
--idpersona
@id_idiomas int,


--idpersona
@id_periodo int,
@id_financimiento int,
--idrespuesta
--fecha
@id_convocatoria int,--cambia id_maestria por id_convocatoria
@validez char(2)

AS
BEGIN

BEGIN TRANSACTION;

BEGIN TRY   
	declare @idrespuesta int
	declare @mensaje nvarchar (100)
	declare @PersonaId int 
	declare @InscripcionId int

	if not exists (SELECT        Cedula
		FROM   Persona
	WHERE        (Cedula = @cedula))
	begin  

		INSERT INTO Persona
								 (Nombres, SegundoNombre, ApellidoPaterno, ApellidoMaterno, Cedula, Direccion, TelefonoD, TelefonoC, FechaNac, Email, Eliminado, etniaId, CantonId, EstadoCivilID, tipoDocumentoId, sexoId, 
								 paisNacionalidadId, ParroquiaNac)
		VALUES        (@nombres,@SegundoNombre,@apellido1,@apellido2,@cedula,@direccion,@telefono1,@telefono2,@fechanac,@email, 'FALSE', 
								 1,@cantonid,@estadocivilid,@tipoDocumentoId,@sexoId,@paisNacionalidadId, '')
								SET @PersonaId = SCOPE_IDENTITY();
	end
	else
		begin 

				UPDATE       Persona
				SET                Nombres = @nombres, SegundoNombre = @SegundoNombre, ApellidoPaterno = @apellido1, ApellidoMaterno = @apellido2, Direccion = @direccion, TelefonoD = @telefono1, TelefonoC = @telefono2, 
					FechaNac = @fechanac, Email = @email, Eliminado = 'FALSE', etniaId = 1, CantonId = @cantonid, EstadoCivilID = @estadocivilid, tipoDocumentoId = @tipoDocumentoId, sexoId = @sexoId, 
					paisNacionalidadId = @paisNacionalidadId, ParroquiaNac = ''
				where Persona.Cedula =@cedula


			SELECT        @PersonaId = p.IdPersona
				FROM   Persona as p
			WHERE        (Cedula = @cedula)		
		end 
	if not exists ( select * from
					i_posgrado.dbo.Inscripcion as i 
					where i.IdPersona = @PersonaId )
	begin

							 
		INSERT INTO i_posgrado.dbo.InformacionAcademica
						(IdPersona,IdNivelInstruccion,InstitucionAcademica,TituloAcademico,NroRegistroTitulo,
							PromedioAcademico,FechaRegistro,Evidencia_Pdf)						
							VALUES (@PersonaId,@idnivelinstruccion,@institucion,@titulo,@nroregistro,@promedio,@fecharegistro,@evidenciapdf)
	
	
	
		INSERT INTO i_posgrado.dbo.ExperienciaLaboral
						(IdPersona,FechaInicio,FechaFin,Empresa,Puesto,Estado,Sueldo)					
							VALUES (@PersonaId,@fechaini,@fechafin,@empresa,@puesto,@estado,@sueldo)

		INSERT INTO i_posgrado.dbo.PersonaIdiomaNivel
						(id_NivelIdioma,id_Persona,id_idiomas)						
							VALUES (@id_nivelidioma, @PersonaId,@id_idiomas)	
						
		INSERT INTO i_posgrado.dbo.Respuestas
						(DetalleRespuesta,IdPregunta)						
							VALUES (@detallerespuesta,@id_pregunta)
						
							SET @idrespuesta = SCOPE_IDENTITY();
						

		INSERT INTO i_posgrado.dbo.Inscripcion
						(IdPersona,IdPeriodo,IdFinanciamiento,Idrespuesta,Fecha,IdConvocatoria)						
							VALUES (@PersonaId,@id_periodo,@id_financimiento,@idrespuesta,GETDATE(),@id_convocatoria)

							SET @InscripcionId = SCOPE_IDENTITY();

		INSERT INTO Evidencia_Pago
						(IdInscripcion, evidencia_pago,valido, eliminado)
							VALUES (@InscripcionId, @evidenciapago, @validez, CONVERT(bit,0))
	end
	else 	if not exists ( select * from
					i_posgrado.dbo.Inscripcion as i 
					where i.IdPersona = @PersonaId and i.IdConvocatoria = @id_convocatoria)
					begin 


					INSERT INTO i_posgrado.dbo.Respuestas
						(DetalleRespuesta,IdPregunta)						
							VALUES (@detallerespuesta,@id_pregunta)
						
							SET @idrespuesta = SCOPE_IDENTITY();
					
							INSERT INTO i_posgrado.dbo.Inscripcion
							(IdPersona,IdPeriodo,IdFinanciamiento,Idrespuesta,Fecha,IdConvocatoria)						
							VALUES (@PersonaId,@id_periodo,@id_financimiento,@idrespuesta,GETDATE(),@id_convocatoria)
					end 

					else 
	

		begin	
			set @mensaje = 'El usuario ya esta inscrito'
			select @mensaje as Column1;
		end	
			
					--select CONVERT(nvarchar(20), @PersonaId)
		set @mensaje = 'ok' 
		select @mensaje as Column1;
	


END TRY
BEGIN CATCH
    --SELECT 
    --    ERROR_NUMBER() AS ErrorNumber
    --    ,ERROR_SEVERITY() AS ErrorSeverity
    --    ,ERROR_STATE() AS ErrorState
    --    ,ERROR_PROCEDURE() AS ErrorProcedure
    --    ,ERROR_LINE() AS ErrorLine
    --    ,ERROR_MESSAGE() AS ErrorMessage;

set @mensaje = 'Error'
select @mensaje as Column1;
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;

IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;



END
GO
/****** Object:  StoredProcedure [dbo].[input_personal]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[input_personal]

	@nombre nvarchar(200), @iden nvarchar(200), @foto nvarchar (200), @titulo nvarchar (200), @correo nvarchar (200),
	@tlf nvarchar (200), @idtipo int

AS
BEGIN
	INSERT INTO Personal (nombre,identificación,foto,titulo,correo,telefono,eliminado,idrolpersona,iddireccion)
	VALUES (@nombre , @iden , @foto , @titulo , @correo , @tlf , CONVERT(bit,0) , @idtipo , 1 )
END
GO
/****** Object:  StoredProcedure [dbo].[input_PlantillaMaestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[input_PlantillaMaestria]
@idmaes int, @banner nvarchar(200), @modalidad nvarchar(200), @duracion nvarchar(200), @grado nvarchar(200), @descripcion nvarchar(MAX),
@objgeneral nvarchar(max), @objespe nvarchar(MAX), @perfil nvarchar(MAX), @requisitos nvarchar(MAX), 
@resol nvarchar(200), @admision nvarchar(200), @matri nvarchar(200), @cole nvarchar(200), 
@enlace nvarchar(200), @tele nvarchar(200), @email1 nvarchar(200), @email2 nvarchar(200), @color nvarchar(200)
AS
BEGIN
	INSERT INTO PlantillaMaestria (idmaestriaweb,estado,banner,modalidad,duracion,gradoacademico,descripcion,
									objetivogeneral,objetivosespecificos,perfilaspirante,requisitosingreso,
									resolucion, admision,matricula,colegiatura,linkinstructivo,telefono,
									emailinstitucional,email,color)
	VALUES (@idmaes, CONVERT(BIT,0),@banner, @modalidad, @duracion, @grado, @descripcion, @objgeneral,
			@objespe , @perfil , @requisitos , @resol , @admision , @matri , @cole , @enlace , @tele , 
			@email1 , @email2 , @color)
END
GO
/****** Object:  StoredProcedure [dbo].[input_results]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[input_results]
@nom nvarchar(200), @fecha date, @formato nvarchar(200), @archivo nvarchar(200)
AS
BEGIN
	INSERT INTO Doc_Resultados(nombre,fecha,formato,archivo,eliminado,iddirección)
	VALUES (@nom,@fecha,@formato,@archivo,CONVERT(bit,0), 1)
END
GO
/****** Object:  StoredProcedure [dbo].[input_slider]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[input_slider]
@foto nvarchar(200), @titulo nvarchar(200), @link nvarchar(500)
AS
BEGIN
	INSERT INTO Sliders (foto,titulo,eliminado,iddirección, link)
	VALUES (@foto,@titulo,CONVERT (bit,0), 1, @link)
END
GO
/****** Object:  StoredProcedure [dbo].[input_tipoPersona]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[input_tipoPersona]
	@rol nvarchar(200)
AS
BEGIN
	INSERT INTO TipoPersona (detallerol, eliminado)
	VALUES (@rol, CONVERT(bit,0))
END
GO
/****** Object:  StoredProcedure [dbo].[input_WebMaestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[input_WebMaestria]
@titulo nvarchar(200), @mencion nvarchar(200), @imagen nvarchar(200),@contenido nvarchar(500)
AS
BEGIN
DECLARE @id_maes int

	INSERT INTO WebMaestria (titulo, mencion,imagen, contenido, enlace, idDireccion, eliminado)
	VALUES (@titulo, @mencion, @imagen, @contenido, NULL, 1, CONVERT(bit,0))

select @id_maes = SCOPE_IDENTITY();

DECLARE @last_maestria nvarchar(200)

SELECT @last_maestria =  titulo + mencion
FROM            WebMaestria
WHERE        (idmaestriaweb = @id_maes)

DECLARE @texturl nvarchar(MAX)
SELECT @texturl = REPLACE(@last_maestria,' ','-');

DECLARE @enlace nvarchar(MAX)


SELECT @enlace = CONVERT(NVARCHAR(MAX), @id_maes) + '&' + @texturl

UPDATE WebMaestria
SET enlace= @enlace
WHERE WebMaestria.idmaestriaweb = @id_maes

END
GO
/****** Object:  StoredProcedure [dbo].[insert_noticia]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insert_noticia]

	@imagen nvarchar(200), @titulo nvarchar(200), @resumen nvarchar(200), @contenido nvarchar(MAX), @fecha date
AS
BEGIN
DECLARE @id_noti int

	INSERT INTO Noticia (imagen, titulo, resumen, contenido,fecha, eliminado, mostrar, iddireccion)
	VALUES (@imagen,@titulo,@resumen,@contenido,@fecha, CONVERT(BIT,0), CONVERT(BIT,1), 1)
select @id_noti = SCOPE_IDENTITY();

DECLARE @titu_noti nvarchar(200)

SELECT @titu_noti =  titulo
FROM            Noticia
WHERE        (idnoticia = @id_noti)

DECLARE @newtitulo nvarchar(MAX)
SELECT @newtitulo = REPLACE(@titu_noti,' ','-');

DECLARE @urlnoti nvarchar(MAX)

SELECT @urlnoti = CONVERT(NVARCHAR(MAX), @id_noti) + '&' + @newtitulo

UPDATE Noticia
SET url= @urlnoti
WHERE Noticia.idnoticia = @id_noti
END
GO
/****** Object:  StoredProcedure [dbo].[int_estudio_cohorte]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[int_estudio_cohorte]
@idcohorte int
AS
BEGIN
SELECT        Persona.Nombres + ' ' + Persona.SegundoNombre + ' ' + Persona.ApellidoPaterno + ' ' + Persona.ApellidoMaterno AS Persona, Persona.Direccion, Persona.TelefonoD, Persona.TelefonoC, Persona.Email, Convocatoria.detalle as Convocatoria, 
                         Pais.Descripcion as Pais, Provincia.Descripcion AS Provincia, Canton.Descripcion AS Canton, NivelInstruccion.Descripcion AS NivelEstudios, InformacionAcademica.TituloAcademico, InformacionAcademica.PromedioAcademico, Idiomas.idioma, 
                         NivelIdiomas.Descripcion AS NivelIdiomas
FROM            Cohorte INNER JOIN
                         Convocatoria ON Cohorte.id_cohorte = Convocatoria.id_cohorte INNER JOIN
                         Inscripcion ON Convocatoria.id_convocatoria = Inscripcion.IdConvocatoria INNER JOIN
                         Evidencia_Pago ON Inscripcion.IdInscripcion = Evidencia_Pago.IdInscripcion INNER JOIN
                         Maestria ON Cohorte.id_maestria = Maestria.IdMaestria INNER JOIN
                         Persona ON Inscripcion.IdPersona = Persona.IdPersona INNER JOIN
                         Canton ON Persona.CantonId = Canton.CantonId INNER JOIN
                         Provincia ON Canton.ProvinciaId = Provincia.ProvinciaId INNER JOIN
                         NivelInstruccion INNER JOIN
                         InformacionAcademica ON NivelInstruccion.IdNivelInstruccion = InformacionAcademica.IdNivelInstruccion ON Persona.IdPersona = InformacionAcademica.IdPersona INNER JOIN
                         PersonaIdiomaNivel INNER JOIN
                         NivelIdiomas ON PersonaIdiomaNivel.id_NivelIdioma = NivelIdiomas.idNivelIdiomas INNER JOIN
                         Idiomas ON PersonaIdiomaNivel.id_idiomas = Idiomas.Id_idiomas ON Persona.IdPersona = PersonaIdiomaNivel.id_Persona INNER JOIN
                         Pais ON Provincia.PaisId = Pais.PaisId
WHERE        (Evidencia_Pago.evidencia_pago = N'') AND (Evidencia_Pago.valido = N'NO') AND (Convocatoria.id_cohorte = @idcohorte)
END
GO
/****** Object:  StoredProcedure [dbo].[load_canton]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[load_canton]	
	
	@provinciaid int
AS	
BEGIN

	SELECT        CantonId, Descripcion, ProvinciaId, Codigo
FROM            Canton
WHERE        (Eliminado = 0) AND (ProvinciaId = @provinciaid)
ORDER BY Descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[load_cantonxxx]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[load_cantonxxx]	
	

AS	
BEGIN

SELECT        CantonId, Descripcion, ProvinciaId, Codigo
	FROM            Canton
	WHERE        (Eliminado = 0)
	ORDER BY Descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[load_documento]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_documento]
AS
BEGIN
	SELECT        iddocumento, nombre, formato, archivo
FROM            Documento
WHERE        (eliminado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[load_estadocivil]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[load_estadocivil]
	
AS	
BEGIN

	select IdEstadoCivil, Descripcion
	from EstadoCivil

END





GO
/****** Object:  StoredProcedure [dbo].[load_Etapa]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_Etapa]

AS
BEGIN
	SELECT        EtapaMaestria.idetapa, EtapaMaestria.idplantilla, EtapaMaestria.titulo, EtapaMaestria.fecha, EtapaMaestria.contenido, WebMaestria.titulo + ' ' + WebMaestria.mencion as maestria
FROM            EtapaMaestria INNER JOIN
                         PlantillaMaestria ON EtapaMaestria.idplantilla = PlantillaMaestria.idplantilla INNER JOIN
                         WebMaestria ON PlantillaMaestria.idmaestriaweb = WebMaestria.idmaestriaweb
WHERE        (EtapaMaestria.eliminado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[load_EtapaPorMaestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_EtapaPorMaestria]
@idmaes int
AS
BEGIN
SELECT        EtapaMaestria.idetapa, EtapaMaestria.titulo, EtapaMaestria.fecha, EtapaMaestria.contenido, WebMaestria.titulo + ' ' + WebMaestria.mencion AS maestria, PlantillaMaestria.idplantilla, PlantillaMaestria.idmaestriaweb
FROM            EtapaMaestria INNER JOIN
                         PlantillaMaestria ON EtapaMaestria.idplantilla = PlantillaMaestria.idplantilla INNER JOIN
                         WebMaestria ON PlantillaMaestria.idmaestriaweb = WebMaestria.idmaestriaweb
WHERE        (EtapaMaestria.eliminado = 0) AND (PlantillaMaestria.idmaestriaweb = @idmaes)
END
GO
/****** Object:  StoredProcedure [dbo].[load_financiamiento]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[load_financiamiento]
	
AS	
BEGIN

SELECT        IdFinanciamiento, TipoFinanciamiento
FROM          Financiamiento

where Eliminado=CONVERT(bit,0)

END

GO
/****** Object:  StoredProcedure [dbo].[load_galeriaNoticia]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_galeriaNoticia]
	@idnoti int
AS
BEGIN
	SELECT        Galeria.idgaleria, Galeria.archivo
FROM            Galeria INNER JOIN
                         Noticia ON Galeria.idnoticia = Noticia.idnoticia
WHERE        (Galeria.idnoticia = @idnoti) AND (Galeria.eliminado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[load_Horario]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_Horario]

AS
BEGIN
	SELECT        HorarioMaestria.idhorario, HorarioMaestria.idplantilla, HorarioMaestria.detalle, WebMaestria.titulo + ' ' + WebMaestria.mencion as maestria
FROM            HorarioMaestria INNER JOIN
                         PlantillaMaestria ON HorarioMaestria.idplantilla = PlantillaMaestria.idplantilla INNER JOIN
                         WebMaestria ON PlantillaMaestria.idmaestriaweb = WebMaestria.idmaestriaweb
WHERE        (HorarioMaestria.eliminado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[load_HorarioPorMaestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_HorarioPorMaestria]
@idmaes int
AS
BEGIN
SELECT        HorarioMaestria.idhorario, HorarioMaestria.detalle, WebMaestria.titulo + ' ' +  WebMaestria.mencion as maestria
FROM            HorarioMaestria INNER JOIN
                         PlantillaMaestria ON HorarioMaestria.idplantilla = PlantillaMaestria.idplantilla INNER JOIN
                         WebMaestria ON PlantillaMaestria.idmaestriaweb = WebMaestria.idmaestriaweb
WHERE        (HorarioMaestria.eliminado = 0) AND (PlantillaMaestria.idmaestriaweb = @idmaes)
END
GO
/****** Object:  StoredProcedure [dbo].[load_idiomas]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[load_idiomas]	

AS	
BEGIN

select Id_idiomas,idioma
from Idiomas

END


GO
/****** Object:  StoredProcedure [dbo].[load_IdPlantilla]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_IdPlantilla]
	@idmaes int
AS
BEGIN
SELECT        PlantillaMaestria.idplantilla
FROM            PlantillaMaestria INNER JOIN
                         WebMaestria ON PlantillaMaestria.idmaestriaweb = WebMaestria.idmaestriaweb
WHERE        (PlantillaMaestria.idmaestriaweb = @idmaes) AND (PlantillaMaestria.estado = convert(bit, 0))
END
GO
/****** Object:  StoredProcedure [dbo].[load_maestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[load_maestria] 
	 
AS
BEGIN
SELECT    distinct    Maestria.IdMaestria, Maestria.NombreMaestria, Maestria.EstadoMaestria
FROM            Maestria 
--INNER JOIN
                         --Cohorte ON Maestria.IdMaestria = Cohorte.id_maestria INNER JOIN
                         --Convocatoria ON Cohorte.id_cohorte = Convocatoria.id_cohorte
WHERE        (Maestria.Eliminado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[load_maestria_mencion]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_maestria_mencion]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	SELECT idmaestriaweb, titulo + ' ' + mencion as maestria
	FROM WebMaestria 
	WHERE eliminado= convert(bit,0)
END
GO
/****** Object:  StoredProcedure [dbo].[load_maestriaporid]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[load_maestriaporid] 
	 @maesid int
AS
BEGIN
SELECT        IdMaestria, NombreMaestria, EstadoMaestria
FROM          Maestria
WHERE	IdMaestria=@maesid and Eliminado=CONVERT(bit,0)
END

GO
/****** Object:  StoredProcedure [dbo].[load_nivelidioma_extra]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[load_nivelidioma_extra]	
	

AS	
BEGIN

select idNivelIdiomas,Descripcion
from NivelIdiomas

END





GO
/****** Object:  StoredProcedure [dbo].[load_nivelidiomas]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[load_nivelidiomas]	
	

AS	
BEGIN

select idNivelIdiomas,Descripcion
from NivelIdiomas

END





GO
/****** Object:  StoredProcedure [dbo].[load_noticia]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_noticia]
AS
BEGIN
	SELECT        idnoticia, titulo, resumen, contenido, imagen, fecha, url
FROM            Noticia
WHERE eliminado=CONVERT(bit,0)
ORDER BY fecha DESC -- PARA INDEX
END
GO
/****** Object:  StoredProcedure [dbo].[load_noticiaID]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_noticiaID]
	@idnoti int
AS
BEGIN
	SELECT        idnoticia, titulo, resumen, contenido, imagen, fecha, url
FROM            Noticia
WHERE        (eliminado = CONVERT(bit, 0)) AND (idnoticia = @idnoti)
END
GO
/****** Object:  StoredProcedure [dbo].[load_pais]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[load_pais]	
	

AS	
BEGIN

SELECT        PaisId, Descripcion
FROM            Pais where Eliminado=0

END
GO
/****** Object:  StoredProcedure [dbo].[load_paisnoecuador]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[load_paisnoecuador]	
	

AS	
BEGIN
SELECT        PaisId, Descripcion
FROM            Pais
WHERE        (Eliminado = 0) AND (Descripcion != 'Ecuador')
END
GO
/****** Object:  StoredProcedure [dbo].[load_periodo]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[load_periodo]
	
AS	
BEGIN

SELECT      IdPeriodo, Detalle, Estado
FROM        Periodo
where		Eliminado=CONVERT(bit,0)
order by IdPeriodo DESC 

END
GO
/****** Object:  StoredProcedure [dbo].[load_periodo_form]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[load_periodo_form]
	
AS	
BEGIN

SELECT      IdPeriodo, Detalle, Estado
FROM        Periodo
where		Estado='ACTIVO' and Eliminado=CONVERT(bit,0)

END

GO
/****** Object:  StoredProcedure [dbo].[load_personal]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_personal]

AS
BEGIN
	SELECT        Personal.idpersona, Personal.nombre, Personal.identificación, Personal.foto, Personal.titulo, Personal.correo, Personal.telefono, TipoPersona.detallerol
FROM            Personal INNER JOIN
                         TipoPersona ON Personal.idrolpersona = TipoPersona.idrolpersona
WHERE        (Personal.eliminado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[load_personalTipo]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_personalTipo]
	@idtipo int
AS
BEGIN
	SELECT        Personal.idpersona, Personal.nombre, Personal.identificación, Personal.foto, Personal.titulo, Personal.correo, Personal.telefono, TipoPersona.detallerol
FROM            Personal INNER JOIN
                         TipoPersona ON Personal.idrolpersona = TipoPersona.idrolpersona
WHERE        (TipoPersona.idrolpersona = @idtipo)
END
GO
/****** Object:  StoredProcedure [dbo].[load_PlantillaMaestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_PlantillaMaestria]

AS
BEGIN
	SELECT        PlantillaMaestria.idplantilla, WebMaestria.titulo, WebMaestria.mencion, PlantillaMaestria.banner, PlantillaMaestria.modalidad, PlantillaMaestria.duracion, PlantillaMaestria.gradoacademico, PlantillaMaestria.descripcion, 
                         PlantillaMaestria.objetivogeneral, PlantillaMaestria.objetivosespecificos, PlantillaMaestria.requisitosingreso, PlantillaMaestria.perfilaspirante, PlantillaMaestria.resolucion, PlantillaMaestria.admision, 
                         PlantillaMaestria.matricula, PlantillaMaestria.colegiatura, PlantillaMaestria.linkinstructivo, PlantillaMaestria.telefono, PlantillaMaestria.emailinstitucional, PlantillaMaestria.email, PlantillaMaestria.color, 
                         PlantillaMaestria.idmaestriaweb
FROM            PlantillaMaestria INNER JOIN
                         WebMaestria ON PlantillaMaestria.idmaestriaweb = WebMaestria.idmaestriaweb
WHERE        (PlantillaMaestria.estado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[load_PlantillaPorMaestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_PlantillaPorMaestria]
@idmaes int
AS
BEGIN
	SELECT        PlantillaMaestria.idplantilla, WebMaestria.titulo, WebMaestria.mencion, PlantillaMaestria.banner, PlantillaMaestria.modalidad, PlantillaMaestria.duracion, PlantillaMaestria.gradoacademico, PlantillaMaestria.descripcion, 
                         PlantillaMaestria.objetivogeneral, PlantillaMaestria.objetivosespecificos, PlantillaMaestria.requisitosingreso, PlantillaMaestria.perfilaspirante, PlantillaMaestria.resolucion, PlantillaMaestria.admision, 
                         PlantillaMaestria.matricula, PlantillaMaestria.colegiatura, PlantillaMaestria.linkinstructivo, PlantillaMaestria.telefono, PlantillaMaestria.emailinstitucional, PlantillaMaestria.email, PlantillaMaestria.color, 
                         PlantillaMaestria.idmaestriaweb
FROM            PlantillaMaestria INNER JOIN
                         WebMaestria ON PlantillaMaestria.idmaestriaweb = WebMaestria.idmaestriaweb
WHERE        (PlantillaMaestria.estado = 0) AND (PlantillaMaestria.idmaestriaweb = @idmaes)
END
GO
/****** Object:  StoredProcedure [dbo].[load_preguntas]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[load_preguntas]	
	

AS	
BEGIN

select IdPregunta, Detalle, Estado
from Preguntas
where		Eliminado=CONVERT(bit,0)
END

GO
/****** Object:  StoredProcedure [dbo].[load_provincia]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[load_provincia]	
	
@paisid int
AS	
BEGIN

		SELECT        ProvinciaId, Descripcion, Codigo, PaisId
		FROM            Provincia
	WHERE        (Eliminado = 0) AND (PaisId = @paisid)
END
GO
/****** Object:  StoredProcedure [dbo].[load_provinciaxxx]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[load_provinciaxxx]	
	
AS	
BEGIN


	SELECT        ProvinciaId, Descripcion, Codigo, PaisId
FROM            Provincia where Eliminado=0

END
GO
/****** Object:  StoredProcedure [dbo].[load_results]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_results]
	
AS
BEGIN
	SELECT        iddocumento, nombre, formato, archivo
FROM            Doc_Resultados
WHERE        (eliminado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[load_sexo]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[load_sexo]
	
AS	
BEGIN

SELECT      sexoId, Descripcion
FROM        Sexo


END
GO
/****** Object:  StoredProcedure [dbo].[load_slider]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_slider]
AS
BEGIN
SELECT        idslider, titulo, foto, link
FROM            Sliders
WHERE        (eliminado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[load_tipo_usuario]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_tipo_usuario]
	
AS
BEGIN
	
	SELECT TipoUsuarioId,Descripcion
	FROM TipoUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[load_tipodocumento]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[load_tipodocumento]	
	
	
AS	
BEGIN

select tipoDocumentoId,Etiqueta
from TipoIdentificacion

END
GO
/****** Object:  StoredProcedure [dbo].[load_tipoPersona]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_tipoPersona]
AS
BEGIN
	SELECT idrolpersona, detallerol
	FROM TipoPersona
END
GO
/****** Object:  StoredProcedure [dbo].[load_usuario]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_usuario]

AS
BEGIN
	SELECT        Usuario.UsuarioId, Usuario.NombreUsuario, Usuario.Pass, TipoUsuario.Descripcion, Usuario.Estado
FROM            TipoUsuario INNER JOIN
                         Usuario ON TipoUsuario.TipoUsuarioId = Usuario.TipoUsuarioId
END
GO
/****** Object:  StoredProcedure [dbo].[load_usuarios_activos]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_usuarios_activos]
AS
BEGIN
	SELECT        Usuario.NombreUsuario, Usuario.Pass, Usuario.Estado, TipoUsuario.Descripcion
FROM            TipoUsuario INNER JOIN
                         Usuario ON TipoUsuario.TipoUsuarioId = Usuario.TipoUsuarioId
WHERE        (Usuario.Estado = N'ACTIVO')
END
GO
/****** Object:  StoredProcedure [dbo].[load_usuarios_inactivos]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_usuarios_inactivos]
AS
BEGIN
	SELECT        Usuario.NombreUsuario, Usuario.Pass, Usuario.Estado, TipoUsuario.Descripcion
FROM            TipoUsuario INNER JOIN
                         Usuario ON TipoUsuario.TipoUsuarioId = Usuario.TipoUsuarioId
WHERE        (Usuario.Estado = N'INACTIVO')
END
GO
/****** Object:  StoredProcedure [dbo].[load_usuarios_maestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_usuarios_maestria]
AS
BEGIN
	SELECT      Personal.nombre, Usuario.NombreUsuario, TipoUsuario.Descripcion, Maestria.NombreMaestria, Usuario.UsuarioId, Maestria.IdMaestria
FROM            Usuario INNER JOIN
                         TipoUsuario ON Usuario.TipoUsuarioId = TipoUsuario.TipoUsuarioId INNER JOIN
                         Maestria INNER JOIN
                         RolMaestria ON Maestria.IdMaestria = RolMaestria.id_maestria ON Usuario.UsuarioId = RolMaestria.id_usuario INNER JOIN
                         Personal ON Usuario.IdPersona = Personal.idpersona
WHERE        (Usuario.TipoUsuarioId = 2) AND (Usuario.Estado = N'ACTIVO')
END
GO
/****** Object:  StoredProcedure [dbo].[load_WebMaestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[load_WebMaestria]
AS
BEGIN
	SELECT        idmaestriaweb, titulo, mencion, imagen, contenido, enlace
FROM            WebMaestria
WHERE        (eliminado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[MaesPlantilla]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MaesPlantilla]
	
AS
BEGIN
SELECT        WebMaestria.idmaestriaweb, WebMaestria.titulo + ' ' + WebMaestria.mencion AS maestria, WebMaestria.enlace
FROM            PlantillaMaestria INNER JOIN
                         WebMaestria ON PlantillaMaestria.idmaestriaweb = WebMaestria.idmaestriaweb
WHERE        (PlantillaMaestria.estado = CONVERT(bit, 0)) AND (WebMaestria.eliminado = CONVERT(bit, 0))
END
GO
/****** Object:  StoredProcedure [dbo].[maestrias_inscripcion]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[maestrias_inscripcion]
AS
BEGIN
	SELECT DISTINCT       Maestria.IdMaestria, Maestria.NombreMaestria, Maestria.EstadoMaestria
FROM            Cohorte INNER JOIN
                         Convocatoria ON Cohorte.id_cohorte = Convocatoria.id_cohorte INNER JOIN
                         Maestria ON Cohorte.id_maestria = Maestria.IdMaestria
WHERE        (Maestria.Eliminado = 0) AND (Cohorte.estado = N'ACTIVA') AND (Convocatoria.estado = N'ACTIVA')
END
GO
/****** Object:  StoredProcedure [dbo].[modificar_cuestionario]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[modificar_cuestionario]
	@idcuestionario int,
	@descripcion nvarchar(200)
	
AS
BEGIN
	
	SET NOCOUNT ON;

    UPDATE Cuestionario
	set Descripcion = @descripcion, Eliminado=0
	where IdCuestionario=@idcuestionario
END
GO
/****** Object:  StoredProcedure [dbo].[modificar_pregunta]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[modificar_pregunta]
	@idpregunta int,
	@descripcion nvarchar(200)
	
AS
BEGIN
	
	SET NOCOUNT ON;

    UPDATE PreguntasE
	set Detalle = @descripcion, Eliminado=0
	where IdPreguntas=@idpregunta
END
GO
/****** Object:  StoredProcedure [dbo].[modificar_puntaje]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[modificar_puntaje]
	@idpersona int,
	@idpregunta int,
	@valor decimal(18,2)
	
AS
BEGIN
	--declare @mensaje nvarchar(100)
	SET NOCOUNT ON;
	--BEGIN TRANSACTION;
	--BEGIN TRY	

		declare @idinscripcion int
		SELECT   @idinscripcion =  IdInscripcion
		FROM            Inscripcion
		WHERE        (IdPersona = @idpersona)
		print @idinscripcion

	UPDATE       PreguntasEntrevista
SET                Calificacion = @valor
FROM            PreguntasEntrevista INNER JOIN
                         Entrevista ON PreguntasEntrevista.IdEntrevista = Entrevista.IdEntrevista INNER JOIN
                         PreguntasCuestionario ON PreguntasEntrevista.IdPreguntaCuestionario = PreguntasCuestionario.IdPreguntaCuestionario
		where (PreguntasCuestionario.IdPregunta = @idpregunta) and (Entrevista.IdInscripcion = @idinscripcion)

--		set @mensaje = 'ok'
--		select @mensaje as resultado;

--	END TRY
--BEGIN CATCH  
--		set @mensaje = 'error'
--		select @mensaje as resultado;
--		IF @@TRANCOUNT > 0
--        ROLLBACK TRANSACTION;
--END CATCH;
--IF @@TRANCOUNT > 0
--    COMMIT TRANSACTION;

END
GO
/****** Object:  StoredProcedure [dbo].[modificar_total]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[modificar_total]
	@idpersona int,	
	@valor decimal(18,2)
	
AS
BEGIN
	--declare @mensaje nvarchar(100)
	SET NOCOUNT ON;
	--BEGIN TRANSACTION;
	--BEGIN TRY	

		declare @idinscripcion int
		SELECT   @idinscripcion =  IdInscripcion
		FROM            Inscripcion
		WHERE        (IdPersona = @idpersona)
		print @idinscripcion

	UPDATE       Entrevista
SET                Calificacion = @valor        
		where  (Entrevista.IdInscripcion = @idinscripcion)

--		set @mensaje = 'ok'
--		select @mensaje as resultado;

--	END TRY
--BEGIN CATCH  
--		set @mensaje = 'error'
--		select @mensaje as resultado;
--		IF @@TRANCOUNT > 0
--        ROLLBACK TRANSACTION;
--END CATCH;
--IF @@TRANCOUNT > 0
--    COMMIT TRANSACTION;

END
GO
/****** Object:  StoredProcedure [dbo].[mostrar_cuestionario]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mostrar_cuestionario]

AS
BEGIN
SELECT        Cuestionario.IdCuestionario, Maestria.NombreMaestria, Cuestionario.Descripcion, Cuestionario.Fecha
FROM            Maestria INNER JOIN
                         Cuestionario ON Maestria.IdMaestria = Cuestionario.IdMaestria
WHERE        (Cuestionario.Eliminado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[mostrar_maestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mostrar_maestria]

AS
BEGIN
SELECT       IdMaestria, NombreMaestria
FROM            Maestria
where Maestria.Eliminado = 0
END
GO
/****** Object:  StoredProcedure [dbo].[mostrar_noticia]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mostrar_noticia]
	@idnoti int
AS
BEGIN
	UPDATE Noticia
	SET mostrar=CONVERT(bit, 0)
	WHERE idnoticia = @idnoti
END
GO
/****** Object:  StoredProcedure [dbo].[mostrar_preguntas]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mostrar_preguntas]

AS
BEGIN
	SELECT        PreguntasE.IdPreguntas, PreguntasE.Detalle, [Categoria-Pregunta].Categoria
FROM            PreguntasE INNER JOIN
                         [Categoria-Pregunta] ON PreguntasE.IdCategoria = [Categoria-Pregunta].idCategoria
WHERE        (PreguntasE.Eliminado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[mostrar_puntaje]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[mostrar_puntaje]

@idpersona int 

AS
BEGIN

declare @idinscripcion int

SELECT      @idinscripcion =  Entrevista.IdInscripcion
FROM            Inscripcion INNER JOIN
                         Entrevista ON Inscripcion.IdInscripcion = Entrevista.IdInscripcion
WHERE        (Inscripcion.IdPersona = @idpersona)

declare @identrevista int

SELECT @identrevista = IdEntrevista
FROM Entrevista
WHERE IdInscripcion = @idinscripcion

SELECT        PreguntasE.Detalle, PreguntasEntrevista.Calificacion, Entrevista.Fecha, PreguntasE.IdPreguntas, PreguntasEntrevista.IdEntrevista
FROM            PreguntasCuestionario INNER JOIN
                         PreguntasE ON PreguntasCuestionario.IdPregunta = PreguntasE.IdPreguntas INNER JOIN
                         PreguntasEntrevista ON PreguntasCuestionario.IdPreguntaCuestionario = PreguntasEntrevista.IdPreguntaCuestionario INNER JOIN
                         Entrevista ON PreguntasEntrevista.IdEntrevista = Entrevista.IdEntrevista
WHERE        (PreguntasEntrevista.IdEntrevista = @identrevista)

END
GO
/****** Object:  StoredProcedure [dbo].[nomostrar_noticia]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[nomostrar_noticia]
	@idnoti int
AS
BEGIN
	UPDATE Noticia
	SET mostrar=CONVERT(bit, 1)
	WHERE idnoticia = @idnoti
END
GO
/****** Object:  StoredProcedure [dbo].[notas_por_inscripcion]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[notas_por_inscripcion]
@idinscripcion int
AS
BEGIN
	SELECT         Persona.Nombres + ' ' + Persona.SegundoNombre + ' ' + Persona.ApellidoPaterno + ' ' + Persona.ApellidoMaterno as Postulante, Persona.Cedula, m.NombreMaestria as maestria, co.detalle as cohorte, con.detalle as convocatoria,
                             (SELECT        TOP (1) it.Calificacion
                               FROM            ReactivosPosgrado.evaluacion.Instrumento AS it INNER JOIN
                                                         ReactivosPosgrado.evaluacion.Prueba AS pru ON it.IdTest = pru.IdTest INNER JOIN
                                                         ReactivosPosgrado.evaluacion.SubAreas_Prueba AS sar ON pru.IdTest = sar.IdPrueba INNER JOIN
                                                         Inscripcion AS inst ON it.Cod_Matricula = inst.IdInscripcion
                               WHERE        (it.Cod_Matricula = @idinscripcion) AND (pru.Eliminado = 0)  AND (pru.TipoTest = 'GENERAL') AND(ins.IdInscripcion = it.Cod_Matricula) 
                               ORDER BY it.Calificacion DESC) AS CalificacionGeneral,
							    (SELECT        TOP (1) it.Calificacion
                               FROM            ReactivosPosgrado.evaluacion.Instrumento AS it INNER JOIN
                                                         ReactivosPosgrado.evaluacion.Prueba AS pru ON it.IdTest = pru.IdTest INNER JOIN
                                                         ReactivosPosgrado.evaluacion.SubAreas_Prueba AS sar ON pru.IdTest = sar.IdPrueba INNER JOIN
                                                         Inscripcion AS inst ON it.Cod_Matricula = inst.IdInscripcion
                               WHERE        (it.Cod_Matricula = @idinscripcion) AND (pru.Eliminado = 0) AND (pru.TipoTest = 'PARTICULAR') AND(ins.IdInscripcion = it.Cod_Matricula)
                               ORDER BY it.Calificacion DESC) AS CalificacionParticular, 
							   
							   (SELECT TOP (1)ent.Calificacion
							    FROM Entrevista AS ent  
								WHERE (ent.IdInscripcion = ins.IdInscripcion) AND (ent.Eliminado = 0)
								) as Entrevista,

							   ins.IdInscripcion
FROM            
                         Inscripcion AS ins  INNER JOIN
						 Convocatoria as con on ins.IdConvocatoria = con.id_convocatoria inner join
						 Cohorte as co on con.id_cohorte = co.id_cohorte inner join
                         Maestria as m ON co.id_maestria = m.IdMaestria  inner join 
                         Persona ON ins.IdPersona = Persona.IdPersona inner join 
						 ReactivosPosgrado.evaluacion.Instrumento it on ins.IdInscripcion = it.Cod_Matricula
WHERE        (ins.IdInscripcion = @idinscripcion) AND(ins.IdInscripcion = it.Cod_Matricula)
GROUP BY m.IdMaestria, Persona.Nombres, Persona.SegundoNombre, Persona.ApellidoPaterno, Persona.ApellidoMaterno,ins.IdInscripcion, it.Cod_Matricula, it.carrera, m.NombreMaestria, co.detalle, con.detalle, Persona.Cedula

END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerListaMaestrias_Alumni]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Silvio Alcivar
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerListaMaestrias_Alumni] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT PlantillaMaestria.idplantilla as IdMaestria, WebMaestria.titulo as NombreMaestria, WebMaestria.mencion as Mencion, PlantillaMaestria.modalidad, PlantillaMaestria.duracion,
		WebMaestria.imagen
FROM  PlantillaMaestria INNER JOIN
      WebMaestria ON PlantillaMaestria.idmaestriaweb = WebMaestria.idmaestriaweb
WHERE (PlantillaMaestria.estado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerMaestriaPorIdAlumni]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Silvio Alcivar
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerMaestriaPorIdAlumni] @idMaestria as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT PlantillaMaestria.idplantilla as IdMaestria, WebMaestria.titulo as NombreMaestria, WebMaestria.mencion as Mencion,PlantillaMaestria.color,
       PlantillaMaestria.modalidad, PlantillaMaestria.duracion, PlantillaMaestria.gradoacademico, PlantillaMaestria.descripcion, PlantillaMaestria.perfilaspirante as perfil, PlantillaMaestria.requisitosingreso as requisitos ,WebMaestria.enlace,
	   WebMaestria.imagen
FROM   PlantillaMaestria INNER JOIN
       WebMaestria ON PlantillaMaestria.idmaestriaweb = WebMaestria.idmaestriaweb
WHERE  (PlantillaMaestria.estado = 0) AND (PlantillaMaestria.idmaestriaweb = @idMaestria)
END
GO
/****** Object:  StoredProcedure [dbo].[pago_novalido]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pago_novalido]
@idpago int
AS
BEGIN
	UPDATE Evidencia_Pago
	SET valido = 'NO'
	WHERE IdEvidenciaPago = @idpago
END
GO
/****** Object:  StoredProcedure [dbo].[pago_valido]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pago_valido]
@idpago int
AS
BEGIN
	UPDATE Evidencia_Pago
	SET valido = 'SI'
	WHERE IdEvidenciaPago = @idpago
END
GO
/****** Object:  StoredProcedure [dbo].[ponderacion_maestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ponderacion_maestria]
@idconv int
AS
BEGIN
SELECT        Ponderacion.cEspecificos, Ponderacion.cGeneral, Ponderacion.Entrevista, Convocatoria.id_convocatoria
FROM            Convocatoria INNER JOIN
                         Ponderacion ON Convocatoria.idPonderacion = Ponderacion.idPonderacion
WHERE        (Ponderacion.eliminado = 0) AND (Convocatoria.id_convocatoria = @idconv)
END
GO
/****** Object:  StoredProcedure [dbo].[preguntas_segun_maestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[preguntas_segun_maestria]
@idcuestionario int
AS
BEGIN
SELECT        PreguntasCuestionario.IdPreguntaCuestionario, PreguntasE.Detalle, PreguntasCuestionario.Valor, [Categoria-Pregunta].Categoria
FROM            PreguntasE INNER JOIN
                         PreguntasCuestionario ON PreguntasE.IdPreguntas = PreguntasCuestionario.IdPregunta INNER JOIN
                         Cuestionario ON PreguntasCuestionario.IdCuestionario = Cuestionario.IdCuestionario INNER JOIN
                         [Categoria-Pregunta] ON PreguntasE.IdCategoria = [Categoria-Pregunta].idCategoria
WHERE        (Cuestionario.IdCuestionario = @idcuestionario) AND (PreguntasCuestionario.Eliminado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[ServicioPreseleccionados]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ServicioPreseleccionados]
	
AS
BEGIN
	SELECT        Persona.Cedula, Persona.Nombres, Persona.SegundoNombre, Persona.ApellidoPaterno, Persona.ApellidoMaterno, Persona.Direccion, Persona.FechaNac, Persona.Email, Persona.TelefonoD, Persona.TelefonoC, 
                         Sexo.Descripcion, EstadoCivil.Descripcion AS EstadoCivil, Pais.Eliminado, Provincia.Descripcion AS Provincia, Canton.Descripcion AS Canton, Persona.ParroquiaNac, InformacionAcademica.InstitucionAcademica, 
                         InformacionAcademica.TituloAcademico, InformacionAcademica.NroRegistroTitulo, 'http://posgrado.espam.edu.ec/gestionAdmision/PDF/'+InformacionAcademica.Evidencia_Pdf as Evidencia, ExperienciaLaboral.Empresa, ExperienciaLaboral.Puesto, ExperienciaLaboral.Sueldo, ExperienciaLaboral.FechaInicio, 
                         ExperienciaLaboral.FechaFin, Convocatoria.detalle as Convocatoria, Cohorte.detalle AS Cohorte, Maestria.NombreMaestria as Maestria, NivelIdiomas.Descripcion AS IdiomaNivel, Idiomas.idioma, Preseleccionados.Puntaje, Preseleccionados.Id_preseleccionado, 
                         Periodo.Detalle AS Periodo
FROM            PersonaIdiomaNivel INNER JOIN
                         Idiomas ON PersonaIdiomaNivel.id_idiomas = Idiomas.Id_idiomas INNER JOIN
                         NivelIdiomas ON PersonaIdiomaNivel.id_NivelIdioma = NivelIdiomas.idNivelIdiomas INNER JOIN
                         Sexo INNER JOIN
                         Persona INNER JOIN
                         Inscripcion ON Persona.IdPersona = Inscripcion.IdPersona INNER JOIN
                         EstadoCivil ON Persona.EstadoCivilId = EstadoCivil.IdEstadoCivil INNER JOIN
                         Provincia INNER JOIN
                         Pais ON Provincia.PaisId = Pais.PaisId INNER JOIN
                         Canton ON Provincia.ProvinciaId = Canton.ProvinciaId ON Persona.CantonId = Canton.CantonId ON Sexo.sexoId = Persona.sexoId INNER JOIN
                         Preseleccionados ON Inscripcion.IdInscripcion = Preseleccionados.Id_inscripcion INNER JOIN
                         InformacionAcademica ON Persona.IdPersona = InformacionAcademica.IdPersona INNER JOIN
                         ExperienciaLaboral ON Persona.IdPersona = ExperienciaLaboral.IdPersona INNER JOIN
                         Convocatoria ON Inscripcion.IdConvocatoria = Convocatoria.id_convocatoria INNER JOIN
                         Cohorte ON Convocatoria.id_cohorte = Cohorte.id_cohorte INNER JOIN
                         Maestria ON Cohorte.id_maestria = Maestria.IdMaestria ON PersonaIdiomaNivel.id_Persona = Persona.IdPersona INNER JOIN
                         Periodo ON Inscripcion.IdPeriodo = Periodo.IdPeriodo
WHERE        (Preseleccionados.Eliminado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[suma_puntaje]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[suma_puntaje]

@id int
AS
BEGIN
SELECT        IdPersona, SUM(Valor) as Suma
FROM            PuntajeEntrevista where IdPersona= @id
GROUP BY IdPersona
END
GO
/****** Object:  StoredProcedure [dbo].[undelete_personal]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[undelete_personal] 
	@idpersona int
AS
BEGIN
	UPDATE Personal
	SET eliminado = CONVERT(bit,0)
	WHERE idpersona=@idpersona
END
GO
/****** Object:  StoredProcedure [dbo].[update_direccion]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_direccion]
@deta nvarchar(200)
AS
BEGIN
	UPDATE Direccion
	SET detalle=@deta
	where iddireccion=1
END
GO
/****** Object:  StoredProcedure [dbo].[update_documento]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_documento]
@id int, @nom nvarchar(200), @fecha date, @formato nvarchar(200), @archivo nvarchar(200)
AS
BEGIN
	UPDATE Documento
	SET nombre=@nom,fecha=@fecha,formato=@formato,archivo=@archivo
	WHERE iddocumento = @id
END
GO
/****** Object:  StoredProcedure [dbo].[update_Etapa]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_Etapa]
@idetapa int, @idplantilla int, @titulo nvarchar(200), @fecha nvarchar(200), @contenido nvarchar(200)
AS
BEGIN
	UPDATE EtapaMaestria
	SET idplantilla=@idplantilla,titulo=@titulo, fecha=@fecha,contenido=@contenido
	WHERE idetapa=@idetapa
END
GO
/****** Object:  StoredProcedure [dbo].[update_financiamiento]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[update_financiamiento]
	@id_financiamiento int,
	@tipo_financimiento varchar(50)
AS	
BEGIN
declare @mensaje nvarchar (100)
UPDATE    Financiamiento
SET         TipoFinanciamiento =  @tipo_financimiento		
			
where IdFinanciamiento=@id_financiamiento
set @mensaje = 'ok' 
	select @mensaje as Column1;


END





GO
/****** Object:  StoredProcedure [dbo].[update_galeria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_galeria]
	@idgal int, @archi nvarchar(200)
AS
BEGIN
	UPDATE Galeria
	SET archivo=@archi
	WHERE idgaleria = @idgal
END
GO
/****** Object:  StoredProcedure [dbo].[update_Horario]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_Horario]
@idhorario int, @idplantilla int, @detalle nvarchar(200)
AS
BEGIN
	UPDATE HorarioMaestria
	SET idplantilla=@idplantilla,detalle=@detalle
	WHERE idhorario=@idhorario
END
GO
/****** Object:  StoredProcedure [dbo].[update_maestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[update_maestria] 
	@id_maestria int,
	@nombre_maestria varchar(100),
	@estado_maestria varchar(50)
AS
BEGIN
 
UPDATE    Maestria
SET         NombreMaestria =  @nombre_maestria, 
			EstadoMaestria = @estado_maestria 
			
where Maestria.IdMaestria=@id_maestria

END





GO
/****** Object:  StoredProcedure [dbo].[update_noticia]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_noticia]
	@idnoti int, @titulo nvarchar(200), @resumen nvarchar(200), @contenido nvarchar(MAX), @imagen nvarchar(200)
AS
BEGIN
	UPDATE Noticia 
	SET  titulo=@titulo,resumen=@resumen,contenido=@contenido,imagen=@imagen,iddireccion= 1
	WHERE idnoticia=@idnoti
END
GO
/****** Object:  StoredProcedure [dbo].[update_periodo]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[update_periodo]
	@id_periodo int,
	@detalle varchar(50),
	@estado varchar (50)
AS	
BEGIN


UPDATE    Periodo
SET         Detalle =  @detalle,
		 Estado =  @estado
		 			
where IdPeriodo=@id_periodo

END





GO
/****** Object:  StoredProcedure [dbo].[update_personal]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_personal]
	@idpersona int, @nombre nvarchar(200), @iden nvarchar(200), @foto nvarchar (200), @titulo nvarchar (200), @correo nvarchar (200),
	@tlf nvarchar (200), @idtipo int
AS
BEGIN
	UPDATE Personal
	SET nombre= @nombre ,identificación= @iden ,foto= @foto , titulo= @titulo ,correo= @correo ,telefono= @tlf , idrolpersona= @idtipo
	WHERE idpersona=@idpersona
END
GO
/****** Object:  StoredProcedure [dbo].[update_PlantillaMaestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_PlantillaMaestria]
@id int, @idmaes int, @banner nvarchar(200), @modalidad nvarchar(200), @duracion nvarchar(200), @grado nvarchar(200), @descripcion nvarchar(MAX),
@objgeneral nvarchar(max), @objespe nvarchar(MAX), @perfil nvarchar(MAX), @requisitos nvarchar(MAX), 
@resol nvarchar(200), @admision nvarchar(200), @matri nvarchar(200), @cole nvarchar(200), 
@enlace nvarchar(200), @tele nvarchar(200), @email1 nvarchar(200), @email2 nvarchar(200), @color nvarchar(200)
AS
BEGIN
	UPDATE PlantillaMaestria
	SET idmaestriaweb= @idmaes,banner= @banner,modalidad= @modalidad,duracion= @duracion,gradoacademico= @grado,descripcion= @descripcion,objetivogeneral= @objgeneral,
		objetivosespecificos=@objespe , perfilaspirante= @perfil ,requisitosingreso= @requisitos ,resolucion= @resol ,admision= @admision ,matricula= @matri ,colegiatura= @cole ,linkinstructivo= @enlace ,telefono= @tele , 
		emailinstitucional=@email1 ,email= @email2 ,color= @color
	WHERE idplantilla=@id
END
GO
/****** Object:  StoredProcedure [dbo].[update_preguntas]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[update_preguntas]	
	@id_pregunta int,
	@detalle varchar (300),
	@estado varchar(50)
AS	
BEGIN


UPDATE    Preguntas
SET         Detalle =  @detalle,	
			Estado = @estado	
			
where IdPregunta=@id_pregunta


END




GO
/****** Object:  StoredProcedure [dbo].[update_results]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_results]
	@id int, @nom nvarchar(200), @fecha date, @formato nvarchar(200), @archivo nvarchar(200)
AS
BEGIN
	UPDATE Doc_Resultados
	SET nombre=@nom,fecha=@fecha,formato=@formato,archivo=@archivo
	WHERE iddocumento = @id
END
GO
/****** Object:  StoredProcedure [dbo].[update_slider]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_slider]
@id int, @foto nvarchar(200), @titu nvarchar(200), @link nvarchar(500)
AS
BEGIN
	UPDATE Sliders
	SET foto =@foto,titulo=@titu, link=@link
	WHERE idslider = @id
END
GO
/****** Object:  StoredProcedure [dbo].[update_tipoPersona]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_tipoPersona]
	@idtipo int,
	@rol nvarchar(200)
AS
BEGIN
	UPDATE TipoPersona
	SET detallerol=@rol
	WHERE idrolpersona = @idtipo
END
GO
/****** Object:  StoredProcedure [dbo].[update_usuario]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_usuario]
	@id_usuario int,
	@nom nvarchar(200),
	@pass nvarchar(200),
	@idtipo int
AS
BEGIN
	
	SET NOCOUNT ON;

    UPDATE Usuario
	set NombreUsuario = @nom, Pass=@pass, TipoUsuarioId=@idtipo
	where UsuarioId=@id_usuario
END
GO
/****** Object:  StoredProcedure [dbo].[update_WebMaestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_WebMaestria]
@id int, @titulo nvarchar(200), @mencion nvarchar(200), @imagen nvarchar(200),@contenido nvarchar(500)
AS
BEGIN
	UPDATE WebMaestria
	SET titulo=@titulo,mencion=@mencion, imagen=@imagen, contenido=@contenido
	WHERE idmaestriaweb=@id
END
GO
/****** Object:  StoredProcedure [dbo].[validar_login_roles]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[validar_login_roles]
@iduser int
AS
BEGIN
SELECT        TipoUsuario.Descripcion, Usuario.NombreUsuario, Usuario.Pass, Personal.foto
FROM            Usuario INNER JOIN
                         TipoUsuario ON Usuario.TipoUsuarioId = TipoUsuario.TipoUsuarioId INNER JOIN
                         Personal ON Usuario.IdPersona = Personal.idpersona
WHERE        (Usuario.Estado = 'ACTIVO') AND (Usuario.UsuarioId = @iduser) AND (Personal.eliminado = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[validar_login_supervisor]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[validar_login_supervisor]
@iduser int
AS
BEGIN
SELECT        TipoUsuario.Descripcion
FROM            Usuario INNER JOIN
                         TipoUsuario ON Usuario.TipoUsuarioId = TipoUsuario.TipoUsuarioId
WHERE        (Usuario.Estado = 'ACTIVO') AND (TipoUsuario.TipoUsuarioId = 4) AND (Usuario.UsuarioId = 15)
END
GO
/****** Object:  StoredProcedure [dbo].[validate_load_login_maestria]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[validate_load_login_maestria]	
	@iduser int
	
AS	
BEGIN
SELECT        RolMaestria.id_maestria, TipoUsuario.Descripcion, RolMaestria.id_usuario
FROM            Usuario INNER JOIN
                         RolMaestria ON Usuario.UsuarioId = RolMaestria.id_usuario INNER JOIN
                         TipoUsuario ON Usuario.TipoUsuarioId = TipoUsuario.TipoUsuarioId
WHERE        (Usuario.Estado = 'ACTIVO') AND (RolMaestria.id_usuario = @iduser) AND (TipoUsuario.TipoUsuarioId = 2)

END
GO
/****** Object:  StoredProcedure [dbo].[validate_login]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[validate_login]	
	@nick varchar(50),
	@pass varchar(50)
AS	
BEGIN

BEGIN TRANSACTION;
BEGIN TRY   

if exists (SELECT NombreUsuario, Pass
FROM            Usuario
WHERE        (NombreUsuario = @nick and Pass =  @pass AND Estado='ACTIVO'))
begin  

select UsuarioId, NombreUsuario, Pass, Descripcion, foto
from Usuario inner join TipoUsuario on Usuario.TipoUsuarioId = TipoUsuario.TipoUsuarioId inner join Personal on Usuario.IdPersona = Personal.idpersona
where (NombreUsuario = @nick and Pass =  @pass)

declare @mensaje nvarchar (100)
--set @mensaje = 'ok' 
--select @mensaje as resultado;
end
else
begin 
set @mensaje = 'Error de autenticación'
	select @mensaje as resultado;
end 
END TRY
BEGIN CATCH   
set @mensaje = 'Error'
select @mensaje as resultado;
IF @@TRANCOUNT > 0
ROLLBACK TRANSACTION;
END CATCH;
IF @@TRANCOUNT > 0
COMMIT TRANSACTION;
END
GO
/****** Object:  StoredProcedure [dbo].[validate_login_2]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[validate_login_2]	
	@nick varchar(50),
	@pass varchar(50)
AS	
BEGIN
BEGIN TRANSACTION;
BEGIN TRY   

declare @iduser int

if exists (SELECT UsuarioId, NombreUsuario, Pass
FROM            Usuario
WHERE        (NombreUsuario = @nick and Pass =  @pass AND Estado='ACTIVO'))
begin  

select @iduser=UsuarioId
from Usuario
WHERE (NombreUsuario = @nick and Pass =  @pass AND Estado='ACTIVO')

print @iduser

declare @mensaje nvarchar (100)

set @mensaje = @iduser 
	select @mensaje as resultado;
end
	else
	begin 
	set @mensaje = 'Error de autenticación'
		select @mensaje as resultado;
	end 
END TRY
BEGIN CATCH   
	set @mensaje = 'Error'
select @mensaje as resultado;
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;
IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
END
GO
/****** Object:  StoredProcedure [dbo].[validez_pago]    Script Date: 28/6/2022 16:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[validez_pago]
@idconv int
AS
BEGIN
	SELECT        Evidencia_Pago.IdEvidenciaPago, Persona.Nombres +' '+ Persona.SegundoNombre +' '+ Persona.ApellidoPaterno +' '+ Persona.ApellidoMaterno as Postulante, Evidencia_Pago.evidencia_pago, Evidencia_Pago.valido
FROM            Cohorte INNER JOIN
                         Maestria ON Cohorte.id_maestria = Maestria.IdMaestria INNER JOIN
                         Convocatoria ON Cohorte.id_cohorte = Convocatoria.id_cohorte INNER JOIN
                         Inscripcion ON Convocatoria.id_convocatoria = Inscripcion.IdConvocatoria INNER JOIN
                         Persona ON Inscripcion.IdPersona = Persona.IdPersona INNER JOIN
                         Evidencia_Pago ON Inscripcion.IdInscripcion = Evidencia_Pago.IdInscripcion
WHERE        (Inscripcion.IdConvocatoria = @idconv)
GROUP BY Evidencia_Pago.IdEvidenciaPago, Persona.Nombres, Persona.SegundoNombre, Persona.ApellidoPaterno, Persona.ApellidoMaterno, Evidencia_Pago.evidencia_pago, Evidencia_Pago.valido

END
GO
USE [master]
GO
ALTER DATABASE [i_posgrado] SET  READ_WRITE 
GO
