USE [master]
GO
/****** Object:  Database [ConsultaMedica]    Script Date: 17/6/2019 16:34:17 ******/
CREATE DATABASE [ConsultaMedica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Consulta Medica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Consulta Medica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Consulta Medica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Consulta Medica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ConsultaMedica] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ConsultaMedica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ConsultaMedica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ConsultaMedica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ConsultaMedica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ConsultaMedica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ConsultaMedica] SET ARITHABORT OFF 
GO
ALTER DATABASE [ConsultaMedica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ConsultaMedica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ConsultaMedica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ConsultaMedica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ConsultaMedica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ConsultaMedica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ConsultaMedica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ConsultaMedica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ConsultaMedica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ConsultaMedica] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ConsultaMedica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ConsultaMedica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ConsultaMedica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ConsultaMedica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ConsultaMedica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ConsultaMedica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ConsultaMedica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ConsultaMedica] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ConsultaMedica] SET  MULTI_USER 
GO
ALTER DATABASE [ConsultaMedica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ConsultaMedica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ConsultaMedica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ConsultaMedica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ConsultaMedica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ConsultaMedica] SET QUERY_STORE = OFF
GO
USE [ConsultaMedica]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ConsultaMedica]
GO
/****** Object:  Table [dbo].[Cita]    Script Date: 17/6/2019 16:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cita](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[paciente] [int] NULL,
	[medico] [int] NULL,
	[funcionario] [int] NULL,
	[turno] [int] NULL,
	[fecha] [datetime] NULL,
	[consultorio] [int] NULL,
	[reserva] [int] NULL,
 CONSTRAINT [PK_Cita] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 17/6/2019 16:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Ciudad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clinica]    Script Date: 17/6/2019 16:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clinica](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[ciudad] [int] NULL,
	[telefono] [varchar](50) NULL,
 CONSTRAINT [PK_Clinica] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consultorio]    Script Date: 17/6/2019 16:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultorio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[clinica] [int] NULL,
 CONSTRAINT [PK_Consultorio] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Disponibilidad]    Script Date: 17/6/2019 16:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disponibilidad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[medico] [int] NULL,
	[turno] [int] NULL,
	[dias_atencion] [varchar](50) NULL,
 CONSTRAINT [PK_Disponibilidad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funcionario]    Script Date: 17/6/2019 16:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcionario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nro_doc] [int] NULL,
	[nombre] [varchar](60) NULL,
	[apellido] [varchar](60) NULL,
	[edad] [int] NULL,
	[direccion] [varchar](60) NULL,
	[telefono] [varchar](50) NULL,
	[ruc] [varchar](50) NULL,
	[tipo_cargo] [int] NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_funcionario_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 17/6/2019 16:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nro_doc] [int] NULL,
	[nombre] [varchar](60) NULL,
	[apellido] [varchar](60) NULL,
	[edad] [int] NULL,
	[direccion] [varchar](60) NULL,
	[telefono] [varchar](50) NULL,
	[ruc] [varchar](50) NULL,
	[tipo_especialidad] [int] NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_Medico_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 17/6/2019 16:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nro_doc] [int] NULL,
	[nombre] [varchar](60) NULL,
	[apellido] [varchar](60) NULL,
	[edad] [int] NULL,
	[direccion] [varchar](60) NULL,
	[telefono] [varchar](50) NULL,
	[ruc] [varchar](50) NULL,
	[tipo_sexo] [int] NULL,
	[tipo_estado] [int] NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_paciente_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 17/6/2019 16:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[paciente] [int] NULL,
	[medico] [int] NULL,
	[funcionario] [int] NULL,
	[fecha_registro] [datetime] NULL,
	[fecha_reservada] [datetime] NULL,
	[estados] [int] NULL,
	[monto] [float] NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turno]    Script Date: 17/6/2019 16:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[hora_inicio] [datetime] NULL,
	[hora_fin] [datetime] NULL,
 CONSTRAINT [PK_Turno] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 17/6/2019 16:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cita] ON 
GO
INSERT [dbo].[Cita] ([id], [paciente], [medico], [funcionario], [turno], [fecha], [consultorio], [reserva]) VALUES (3, 1, 1, 2, 11, CAST(N'2019-06-17T00:00:00.000' AS DateTime), 2, 2)
GO
SET IDENTITY_INSERT [dbo].[Cita] OFF
GO
SET IDENTITY_INSERT [dbo].[Ciudad] ON 
GO
INSERT [dbo].[Ciudad] ([id], [descripcion]) VALUES (1, N'Asunción')
GO
INSERT [dbo].[Ciudad] ([id], [descripcion]) VALUES (2, N'Fernando de la Mora')
GO
INSERT [dbo].[Ciudad] ([id], [descripcion]) VALUES (3, N'Lambare')
GO
INSERT [dbo].[Ciudad] ([id], [descripcion]) VALUES (4, N'San Lorenzo')
GO
INSERT [dbo].[Ciudad] ([id], [descripcion]) VALUES (5, N'M.R.A')
GO
INSERT [dbo].[Ciudad] ([id], [descripcion]) VALUES (6, N'Villa Elisa')
GO
SET IDENTITY_INSERT [dbo].[Ciudad] OFF
GO
SET IDENTITY_INSERT [dbo].[Clinica] ON 
GO
INSERT [dbo].[Clinica] ([id], [descripcion], [direccion], [ciudad], [telefono]) VALUES (1, N'Villa Morra', N'Mcal. López', 1, N'12')
GO
INSERT [dbo].[Clinica] ([id], [descripcion], [direccion], [ciudad], [telefono]) VALUES (2, N'San Pablo', N'avda de la Victoria', 1, N'3214')
GO
SET IDENTITY_INSERT [dbo].[Clinica] OFF
GO
SET IDENTITY_INSERT [dbo].[Consultorio] ON 
GO
INSERT [dbo].[Consultorio] ([id], [descripcion], [clinica]) VALUES (1, N'01', 1)
GO
INSERT [dbo].[Consultorio] ([id], [descripcion], [clinica]) VALUES (2, N'01', 2)
GO
SET IDENTITY_INSERT [dbo].[Consultorio] OFF
GO
SET IDENTITY_INSERT [dbo].[Disponibilidad] ON 
GO
INSERT [dbo].[Disponibilidad] ([id], [medico], [turno], [dias_atencion]) VALUES (17, 1, 7, N'V,S')
GO
INSERT [dbo].[Disponibilidad] ([id], [medico], [turno], [dias_atencion]) VALUES (18, 1, 11, N'J,V')
GO
INSERT [dbo].[Disponibilidad] ([id], [medico], [turno], [dias_atencion]) VALUES (19, 1, 11, N'L')
GO
INSERT [dbo].[Disponibilidad] ([id], [medico], [turno], [dias_atencion]) VALUES (20, 2, 11, N'L,X,V')
GO
SET IDENTITY_INSERT [dbo].[Disponibilidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Funcionario] ON 
GO
INSERT [dbo].[Funcionario] ([id], [nro_doc], [nombre], [apellido], [edad], [direccion], [telefono], [ruc], [tipo_cargo], [email]) VALUES (1, 12547, N'Juan', N'Lopez', 30, N'llll', N'4785', N'458889-8', 1, N'agavagv')
GO
INSERT [dbo].[Funcionario] ([id], [nro_doc], [nombre], [apellido], [edad], [direccion], [telefono], [ruc], [tipo_cargo], [email]) VALUES (2, 2145, N'Jorge', N'moreira', 45, N'mkjnkj', N'457878', N'454544-8', 2, N'lokok')
GO
SET IDENTITY_INSERT [dbo].[Funcionario] OFF
GO
SET IDENTITY_INSERT [dbo].[Medico] ON 
GO
INSERT [dbo].[Medico] ([id], [nro_doc], [nombre], [apellido], [edad], [direccion], [telefono], [ruc], [tipo_especialidad], [email]) VALUES (1, 12354, N'Arturo', N'Solìs', 22, N'Ygatymi', N'20154', N'sdsdlsdk', 0, N'solis@gmail.com')
GO
INSERT [dbo].[Medico] ([id], [nro_doc], [nombre], [apellido], [edad], [direccion], [telefono], [ruc], [tipo_especialidad], [email]) VALUES (2, 412365, N'Juan', N'Sosa', 35, N'de la victoria', N'12365', N'1254789-8', 1, N'juan@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Medico] OFF
GO
SET IDENTITY_INSERT [dbo].[Paciente] ON 
GO
INSERT [dbo].[Paciente] ([id], [nro_doc], [nombre], [apellido], [edad], [direccion], [telefono], [ruc], [tipo_sexo], [tipo_estado], [email]) VALUES (1, 232322, N'Julia', N'Gonzalez', 55, N'cacique lambare', N'4578787', N'7854965-9', 2, 1, N'julia@hotmail.com')
GO
INSERT [dbo].[Paciente] ([id], [nro_doc], [nombre], [apellido], [edad], [direccion], [telefono], [ruc], [tipo_sexo], [tipo_estado], [email]) VALUES (2, 214587, N'Julio', N'Saldivar', 45, N'defensores del chaco', N'123321', N'2136547-4', 1, 1, N'julio@hotmail.com')
GO
SET IDENTITY_INSERT [dbo].[Paciente] OFF
GO
SET IDENTITY_INSERT [dbo].[Reserva] ON 
GO
INSERT [dbo].[Reserva] ([id], [paciente], [medico], [funcionario], [fecha_registro], [fecha_reservada], [estados], [monto]) VALUES (2, 1, 1, 1, CAST(N'2019-06-17T00:00:00.000' AS DateTime), CAST(N'2019-06-26T00:00:00.000' AS DateTime), 0, 200000)
GO
SET IDENTITY_INSERT [dbo].[Reserva] OFF
GO
SET IDENTITY_INSERT [dbo].[Turno] ON 
GO
INSERT [dbo].[Turno] ([id], [descripcion], [hora_inicio], [hora_fin]) VALUES (7, N'Siesta', CAST(N'2019-06-10T14:53:44.000' AS DateTime), CAST(N'2019-06-10T17:53:44.000' AS DateTime))
GO
INSERT [dbo].[Turno] ([id], [descripcion], [hora_inicio], [hora_fin]) VALUES (11, N'Mañana', CAST(N'2019-06-11T08:00:00.000' AS DateTime), CAST(N'2019-06-11T12:00:00.000' AS DateTime))
GO
INSERT [dbo].[Turno] ([id], [descripcion], [hora_inicio], [hora_fin]) VALUES (12, N'Tarde', CAST(N'2019-06-11T12:59:53.000' AS DateTime), CAST(N'2019-06-11T17:59:53.000' AS DateTime))
GO
INSERT [dbo].[Turno] ([id], [descripcion], [hora_inicio], [hora_fin]) VALUES (15, N'Noche', CAST(N'2019-06-11T17:27:32.000' AS DateTime), CAST(N'2019-06-11T20:27:32.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Turno] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([id], [usuario], [password]) VALUES (1, N'Arturo', N'b1FAikKugcz0bWBdd833nLQy07c=')
GO
INSERT [dbo].[Usuario] ([id], [usuario], [password]) VALUES (2, N'Juan', N'4hh+Ef9tmk2Y0RSoc+MKNnEsgs0=')
GO
INSERT [dbo].[Usuario] ([id], [usuario], [password]) VALUES (3, N'Arturo', N'yKjonsmTFFOaFa9SunfugAmDXJk=')
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
USE [master]
GO
ALTER DATABASE [ConsultaMedica] SET  READ_WRITE 
GO
