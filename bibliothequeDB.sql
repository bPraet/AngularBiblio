
CREATE DATABASE [Bibliotheque]
GO
USE [Bibliotheque]
GO
/****** Object:  Table [dbo].[administrateur]    Script Date: 15-06-20 20:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administrateur](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](255) NOT NULL,
	[prenom] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[login] [varchar](255) NOT NULL,
	[motDePasse] [varchar](255) NOT NULL,
	[dateNaissance] [date] NOT NULL,
	[adresse] [varchar](255) NOT NULL,
	[telephone] [varchar](255) NULL,
	[idRole] [int] NOT NULL,
	[isDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[administrationAdmin]    Script Date: 15-06-20 20:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administrationAdmin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime2](7) NOT NULL,
	[action] [varchar](255) NOT NULL,
	[raison] [varchar](255) NOT NULL,
	[idAdministrateurCible] [int] NULL,
	[idAdministrateur] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[administrationBiblio]    Script Date: 15-06-20 20:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administrationBiblio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime2](7) NOT NULL,
	[action] [varchar](255) NOT NULL,
	[raison] [varchar](255) NOT NULL,
	[idBibliotheque] [int] NULL,
	[idAdministrateur] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[administrationExemplaire]    Script Date: 15-06-20 20:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administrationExemplaire](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime2](7) NOT NULL,
	[action] [varchar](255) NOT NULL,
	[raison] [varchar](255) NOT NULL,
	[idExemplaire] [int] NULL,
	[idAdministrateur] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[administrationLivre]    Script Date: 15-06-20 20:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administrationLivre](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime2](7) NOT NULL,
	[action] [varchar](255) NOT NULL,
	[raison] [varchar](255) NOT NULL,
	[idLivre] [int] NULL,
	[idAdministrateur] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[administrationUtilisateur]    Script Date: 15-06-20 20:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administrationUtilisateur](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime2](7) NOT NULL,
	[action] [varchar](255) NOT NULL,
	[raison] [varchar](255) NOT NULL,
	[idUtilisateur] [int] NULL,
	[idAdministrateur] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[amende]    Script Date: 15-06-20 20:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[amende](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[montant] [float] NOT NULL,
	[paye] [bit] NOT NULL,
	[idUtilisateur] [int] NULL,
	[idLocation] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[avis]    Script Date: 15-06-20 20:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[avis](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[note] [float] NOT NULL,
	[commentaire] [varchar](max) NULL,
	[idUtilisateur] [int] NULL,
	[idLivre] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bibliotheque]    Script Date: 15-06-20 20:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bibliotheque](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](255) NOT NULL,
	[adresse] [varchar](255) NOT NULL,
	[telephone] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[web] [varchar](255) NULL,
	[description] [varchar](255) NULL,
	[amendeMontant] [float] NOT NULL,
	[cotisationPrix] [float] NOT NULL,
	[nbLocationMax] [int] NOT NULL,
	[dureePret] [int] NOT NULL,
	[isDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[communication]    Script Date: 15-06-20 20:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[communication](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime2](7) NOT NULL,
	[raison] [varchar](max) NOT NULL,
	[idUtilisateur] [int] NULL,
	[idAdministrateur] [int] NULL,
	[objet] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cotisation]    Script Date: 15-06-20 20:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cotisation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[idUtilisateur] [int] NULL,
	[idBibliotheque] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[etat]    Script Date: 15-06-20 20:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[etat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](255) NOT NULL,
	[description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exemplaire]    Script Date: 15-06-20 20:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exemplaire](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idLivre] [int] NOT NULL,
	[idBibliotheque] [int] NOT NULL,
	[idEtat] [int] NOT NULL,
	[disponible] [bit] NOT NULL,
	[isDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image]    Script Date: 15-06-20 20:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lien] [varchar](255) NOT NULL,
	[description] [varchar](255) NULL,
	[idLivre] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[livre]    Script Date: 15-06-20 20:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[livre](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](255) NOT NULL,
	[EAN] [varchar](255) NULL,
	[ISBN] [varchar](255) NULL,
	[edition] [varchar](255) NOT NULL,
	[prix] [float] NOT NULL,
	[synopsis] [varchar](max) NOT NULL,
	[numerique] [bit] NOT NULL,
	[auteur] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[livreTheme]    Script Date: 15-06-20 20:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[livreTheme](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idLivre] [int] NULL,
	[idTheme] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[location]    Script Date: 15-06-20 20:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[location](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dateDebut] [date] NOT NULL,
	[dateFin] [date] NOT NULL,
	[dateRetour] [date] NULL,
	[idExemplaire] [int] NULL,
	[idUtilisateur] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[responsable]    Script Date: 15-06-20 20:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[responsable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idAdministrateur] [int] NOT NULL,
	[idBibliotheque] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 15-06-20 20:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[theme]    Script Date: 15-06-20 20:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[theme](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[utilisateur]    Script Date: 15-06-20 20:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[utilisateur](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](255) NOT NULL,
	[prenom] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[login] [varchar](255) NOT NULL,
	[motDePasse] [varchar](255) NOT NULL,
	[dateNaissance] [date] NOT NULL,
	[adresse] [varchar](255) NOT NULL,
	[telephone] [varchar](255) NULL,
	[isDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[administrateur] ON 

INSERT [dbo].[administrateur] ([id], [nom], [prenom], [email], [login], [motDePasse], [dateNaissance], [adresse], [telephone], [idRole], [isDeleted]) VALUES (1, N'Praet', N'Benoît', N'benoit.praet@hotmail.be', N'Stimouk', N'$2y$12$UdHwwRnwh/bNO7Kgp9mv8uTZgSelTzKR2Cxi9OvM..my04xjw85gO', CAST(N'1996-10-29' AS Date), N'Rue Allard Cambier 1, 7160 Piéton', N'+32496147975', 1, 0)
INSERT [dbo].[administrateur] ([id], [nom], [prenom], [email], [login], [motDePasse], [dateNaissance], [adresse], [telephone], [idRole], [isDeleted]) VALUES (3, N'Sips', N'Muriel', N'pottekepis@hotmail.com', N'Mumu', N'$2y$12$T9lG7JtTLMu0JADyMWwMyOcdjNXe2LvBv8zY2bLIBrifpMR.xdWWq', CAST(N'1969-03-25' AS Date), N'Rue Allard Cambier 1, 7160 Piéton', N'+32477946092', 2, 0)
INSERT [dbo].[administrateur] ([id], [nom], [prenom], [email], [login], [motDePasse], [dateNaissance], [adresse], [telephone], [idRole], [isDeleted]) VALUES (4, N'Linus', N'Tux', N'tux@linus.be', N'Tux', N'$2y$12$eT3UBXSTcwBhhUwlgbS.durbl.v2VtBXaIzNn5j.TFvhvCzlilkZ2', CAST(N'1980-01-17' AS Date), N'Rue du pont 18, 6000 Charleroi', N'+1234567899', 3, 0)
SET IDENTITY_INSERT [dbo].[administrateur] OFF
GO
SET IDENTITY_INSERT [dbo].[administrationBiblio] ON 

INSERT [dbo].[administrationBiblio] ([id], [date], [action], [raison], [idBibliotheque], [idAdministrateur]) VALUES (21, CAST(N'2020-02-03T19:57:21.6090000' AS DateTime2), N'ADD', N'Nouvelle bibliothèque', 19, 1)
INSERT [dbo].[administrationBiblio] ([id], [date], [action], [raison], [idBibliotheque], [idAdministrateur]) VALUES (22, CAST(N'2020-02-03T20:00:34.7640000' AS DateTime2), N'UPDATE', N'testRaison', 19, 1)
INSERT [dbo].[administrationBiblio] ([id], [date], [action], [raison], [idBibliotheque], [idAdministrateur]) VALUES (23, CAST(N'2020-02-03T20:04:04.8850000' AS DateTime2), N'DELETE', N'Suppression bibliothèque', 19, 1)
INSERT [dbo].[administrationBiblio] ([id], [date], [action], [raison], [idBibliotheque], [idAdministrateur]) VALUES (27, CAST(N'2020-05-28T19:24:42.5820000' AS DateTime2), N'UPDATE', N'Correction accent', 1, 1)
INSERT [dbo].[administrationBiblio] ([id], [date], [action], [raison], [idBibliotheque], [idAdministrateur]) VALUES (28, CAST(N'2020-06-01T10:40:52.5130000' AS DateTime2), N'DELETE', N'Suppression bibliothèque', 19, 1)
INSERT [dbo].[administrationBiblio] ([id], [date], [action], [raison], [idBibliotheque], [idAdministrateur]) VALUES (29, CAST(N'2020-06-01T10:41:25.6820000' AS DateTime2), N'DELETE', N'Suppression bibliothèque', 2, 1)
INSERT [dbo].[administrationBiblio] ([id], [date], [action], [raison], [idBibliotheque], [idAdministrateur]) VALUES (30, CAST(N'2020-06-01T10:58:05.6300000' AS DateTime2), N'DELETE', N'Suppression bibliothèque', 19, 1)
INSERT [dbo].[administrationBiblio] ([id], [date], [action], [raison], [idBibliotheque], [idAdministrateur]) VALUES (31, CAST(N'2020-06-01T11:07:09.1120000' AS DateTime2), N'DELETE', N'Suppression bibliothèque', 19, 1)
INSERT [dbo].[administrationBiblio] ([id], [date], [action], [raison], [idBibliotheque], [idAdministrateur]) VALUES (32, CAST(N'2020-06-01T11:09:39.2020000' AS DateTime2), N'DELETE', N'Suppression bibliothèque', 19, 1)
INSERT [dbo].[administrationBiblio] ([id], [date], [action], [raison], [idBibliotheque], [idAdministrateur]) VALUES (33, CAST(N'2020-06-01T11:49:45.3830000' AS DateTime2), N'ADD', N'Nouvelle bibliothèque', 20, 1)
INSERT [dbo].[administrationBiblio] ([id], [date], [action], [raison], [idBibliotheque], [idAdministrateur]) VALUES (34, CAST(N'2020-06-01T11:51:01.2530000' AS DateTime2), N'DELETE', N'Suppression bibliothèque', 20, 1)
SET IDENTITY_INSERT [dbo].[administrationBiblio] OFF
GO
SET IDENTITY_INSERT [dbo].[administrationExemplaire] ON 

INSERT [dbo].[administrationExemplaire] ([id], [date], [action], [raison], [idExemplaire], [idAdministrateur]) VALUES (13, CAST(N'2020-02-03T20:17:40.8660000' AS DateTime2), N'ADD', N'Nouvel exemplaire', 11, 1)
INSERT [dbo].[administrationExemplaire] ([id], [date], [action], [raison], [idExemplaire], [idAdministrateur]) VALUES (14, CAST(N'2020-02-03T20:19:03.9580000' AS DateTime2), N'DELETE', N'Suppression exemplaire', 11, 1)
INSERT [dbo].[administrationExemplaire] ([id], [date], [action], [raison], [idExemplaire], [idAdministrateur]) VALUES (15, CAST(N'2020-06-08T18:30:41.5340000' AS DateTime2), N'UPDATE', N'test', 3, 1)
INSERT [dbo].[administrationExemplaire] ([id], [date], [action], [raison], [idExemplaire], [idAdministrateur]) VALUES (16, CAST(N'2020-06-08T18:51:43.2720000' AS DateTime2), N'ADD', N'Nouvel exemplaire', 12, 1)
INSERT [dbo].[administrationExemplaire] ([id], [date], [action], [raison], [idExemplaire], [idAdministrateur]) VALUES (17, CAST(N'2020-06-08T18:52:18.5900000' AS DateTime2), N'DELETE', N'Suppression exemplaire', 12, 1)
INSERT [dbo].[administrationExemplaire] ([id], [date], [action], [raison], [idExemplaire], [idAdministrateur]) VALUES (18, CAST(N'2020-06-10T13:10:08.5360000' AS DateTime2), N'ADD', N'Nouvel exemplaire', 13, 1)
SET IDENTITY_INSERT [dbo].[administrationExemplaire] OFF
GO
SET IDENTITY_INSERT [dbo].[administrationLivre] ON 

INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (6, CAST(N'2020-02-03T19:49:47.8510000' AS DateTime2), N'ADD', N'Nouveau livre', 5, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (7, CAST(N'2020-02-03T19:50:42.7440000' AS DateTime2), N'ADD', N'Nouveau livre', 6, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (8, CAST(N'2020-02-03T19:53:12.8380000' AS DateTime2), N'UPDATE', N'testRaison', 5, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (9, CAST(N'2020-06-04T17:55:31.1610000' AS DateTime2), N'UPDATE', N'testmodiflivre', 6, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (15, CAST(N'2020-06-04T17:56:39.0880000' AS DateTime2), N'UPDATE', N'testmodiflivre', 6, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (16, CAST(N'2020-06-04T17:57:02.5580000' AS DateTime2), N'UPDATE', N'testmodiflivre', 6, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (17, CAST(N'2020-06-04T18:13:55.2980000' AS DateTime2), N'UPDATE', N'test angular', 1, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (18, CAST(N'2020-06-04T18:15:12.6140000' AS DateTime2), N'UPDATE', N'ok', 1, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (19, CAST(N'2020-06-04T18:28:42.5640000' AS DateTime2), N'ADD', N'Nouveau livre', 7, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (20, CAST(N'2020-06-04T18:36:28.4460000' AS DateTime2), N'UPDATE', N'test', 1, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (21, CAST(N'2020-06-04T18:45:20.8070000' AS DateTime2), N'UPDATE', N'ok', 7, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (22, CAST(N'2020-06-04T18:47:07.4060000' AS DateTime2), N'UPDATE', N'test', 2, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (23, CAST(N'2020-06-04T19:42:03.8950000' AS DateTime2), N'UPDATE', N'test', 1, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (24, CAST(N'2020-06-04T19:42:37.8090000' AS DateTime2), N'UPDATE', N'test', 1, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (25, CAST(N'2020-06-04T19:43:21.3540000' AS DateTime2), N'UPDATE', N'test', 1, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (26, CAST(N'2020-06-04T19:44:20.4600000' AS DateTime2), N'UPDATE', N'test', 1, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (27, CAST(N'2020-06-04T19:45:24.9760000' AS DateTime2), N'UPDATE', N'Update nom Eragon', 1, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (28, CAST(N'2020-06-04T19:46:06.3060000' AS DateTime2), N'UPDATE', N'Update num', 1, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (29, CAST(N'2020-06-04T19:46:19.6350000' AS DateTime2), N'UPDATE', N'up', 1, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (30, CAST(N'2020-06-15T19:13:29.3530000' AS DateTime2), N'UPDATE', N'Mauvais ISBN', 1, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (31, CAST(N'2020-06-15T19:29:56.5640000' AS DateTime2), N'UPDATE', N'update', 2, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (32, CAST(N'2020-06-15T19:32:32.4950000' AS DateTime2), N'UPDATE', N'update', 3, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (33, CAST(N'2020-06-15T19:33:38.7220000' AS DateTime2), N'UPDATE', N'up', 3, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (34, CAST(N'2020-06-15T19:34:22.3990000' AS DateTime2), N'UPDATE', N'up', 3, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (35, CAST(N'2020-06-15T19:35:33.6120000' AS DateTime2), N'UPDATE', N'up', 3, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (36, CAST(N'2020-06-15T19:35:58.3680000' AS DateTime2), N'UPDATE', N'up', 3, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (37, CAST(N'2020-06-15T19:37:27.7290000' AS DateTime2), N'UPDATE', N'u', 3, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (38, CAST(N'2020-06-15T19:41:54.9990000' AS DateTime2), N'UPDATE', N'Up', 3, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (39, CAST(N'2020-06-15T19:44:14.8880000' AS DateTime2), N'UPDATE', N'Up', 5, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (40, CAST(N'2020-06-15T20:40:39.5680000' AS DateTime2), N'UPDATE', N'up', 6, 1)
INSERT [dbo].[administrationLivre] ([id], [date], [action], [raison], [idLivre], [idAdministrateur]) VALUES (41, CAST(N'2020-06-15T20:49:58.7890000' AS DateTime2), N'UPDATE', N'up', 7, 1)
SET IDENTITY_INSERT [dbo].[administrationLivre] OFF
GO
SET IDENTITY_INSERT [dbo].[administrationUtilisateur] ON 

INSERT [dbo].[administrationUtilisateur] ([id], [date], [action], [raison], [idUtilisateur], [idAdministrateur]) VALUES (11, CAST(N'2020-02-03T20:36:11.9000000' AS DateTime2), N'UPDATE', N'testRaison', 7, 1)
INSERT [dbo].[administrationUtilisateur] ([id], [date], [action], [raison], [idUtilisateur], [idAdministrateur]) VALUES (12, CAST(N'2020-02-03T20:38:05.1710000' AS DateTime2), N'DELETE', N'Suppression utilisateur', 7, 1)
SET IDENTITY_INSERT [dbo].[administrationUtilisateur] OFF
GO
SET IDENTITY_INSERT [dbo].[avis] ON 

INSERT [dbo].[avis] ([id], [note], [commentaire], [idUtilisateur], [idLivre]) VALUES (3, 8, N'Très bon livre', 7, 1)
SET IDENTITY_INSERT [dbo].[avis] OFF
GO
SET IDENTITY_INSERT [dbo].[bibliotheque] ON 

INSERT [dbo].[bibliotheque] ([id], [nom], [adresse], [telephone], [email], [web], [description], [amendeMontant], [cotisationPrix], [nbLocationMax], [dureePret], [isDeleted]) VALUES (1, N'Bibliotheque du T''chatpitre', N'Rue Saint-Germain 10, 7160 Chapelle-Lez-Herlaimont', N'064441709', N'bibliotheque@chapelle-lez-herlaimont.be', N'bibliothequechapelle.wixsite.com/bibliothequechapelle', N'Bibliothèque de Chapelle-Lez-Herlaimont', 10, 15, 4, 14, 0)
INSERT [dbo].[bibliotheque] ([id], [nom], [adresse], [telephone], [email], [web], [description], [amendeMontant], [cotisationPrix], [nbLocationMax], [dureePret], [isDeleted]) VALUES (2, N'Bibliotheque de Fontaine', N'Place de Wallonie 15, 6140 Fontaine-L''Evêque', N'071524193', N'bibliotheque@villedefontaine.be', N'bibliothequedefontaine-leveque.blogspot.com', N'Bibliotheque de Fontaine l''éveque', 15, 10, 2, 7, 0)
INSERT [dbo].[bibliotheque] ([id], [nom], [adresse], [telephone], [email], [web], [description], [amendeMontant], [cotisationPrix], [nbLocationMax], [dureePret], [isDeleted]) VALUES (19, N'testNomModif', N'testAdresse', N'123456789', N'test@test.test', N'test.test', N'testDescription', 10, 10, 5, 7, 0)
INSERT [dbo].[bibliotheque] ([id], [nom], [adresse], [telephone], [email], [web], [description], [amendeMontant], [cotisationPrix], [nbLocationMax], [dureePret], [isDeleted]) VALUES (20, N'testAngular', N'test', N'12345', N'test', N'test.test', N'test', 10, 15, 2, 7, 0)
SET IDENTITY_INSERT [dbo].[bibliotheque] OFF
GO
SET IDENTITY_INSERT [dbo].[communication] ON 

INSERT [dbo].[communication] ([id], [date], [raison], [idUtilisateur], [idAdministrateur], [objet]) VALUES (10, CAST(N'2020-02-03T19:08:50.7150000' AS DateTime2), N'Ceci est un message test au support', 7, 1, N'test support')
INSERT [dbo].[communication] ([id], [date], [raison], [idUtilisateur], [idAdministrateur], [objet]) VALUES (11, CAST(N'2020-02-03T19:08:53.3210000' AS DateTime2), N'Ceci est un message test au support', 7, 1, N'test support')
INSERT [dbo].[communication] ([id], [date], [raison], [idUtilisateur], [idAdministrateur], [objet]) VALUES (12, CAST(N'2020-02-10T10:17:24.4990000' AS DateTime2), N'testMessage', 7, 1, N'testObjet')
SET IDENTITY_INSERT [dbo].[communication] OFF
GO
SET IDENTITY_INSERT [dbo].[cotisation] ON 

INSERT [dbo].[cotisation] ([id], [date], [idUtilisateur], [idBibliotheque]) VALUES (8, CAST(N'2020-02-03' AS Date), 7, 1)
INSERT [dbo].[cotisation] ([id], [date], [idUtilisateur], [idBibliotheque]) VALUES (20, CAST(N'2020-06-10' AS Date), 7, 20)
SET IDENTITY_INSERT [dbo].[cotisation] OFF
GO
SET IDENTITY_INSERT [dbo].[etat] ON 

INSERT [dbo].[etat] ([id], [nom], [description]) VALUES (1, N'Neuf', N'Aucun pli ou autre dégat visible')
INSERT [dbo].[etat] ([id], [nom], [description]) VALUES (2, N'Légèrement abimé', N'Légères marques d''utilisation sur le livre')
SET IDENTITY_INSERT [dbo].[etat] OFF
GO
SET IDENTITY_INSERT [dbo].[exemplaire] ON 

INSERT [dbo].[exemplaire] ([id], [idLivre], [idBibliotheque], [idEtat], [disponible], [isDeleted]) VALUES (3, 1, 1, 2, 1, 0)
INSERT [dbo].[exemplaire] ([id], [idLivre], [idBibliotheque], [idEtat], [disponible], [isDeleted]) VALUES (4, 1, 2, 1, 1, 0)
INSERT [dbo].[exemplaire] ([id], [idLivre], [idBibliotheque], [idEtat], [disponible], [isDeleted]) VALUES (7, 2, 2, 2, 1, 0)
INSERT [dbo].[exemplaire] ([id], [idLivre], [idBibliotheque], [idEtat], [disponible], [isDeleted]) VALUES (8, 3, 1, 1, 1, 0)
INSERT [dbo].[exemplaire] ([id], [idLivre], [idBibliotheque], [idEtat], [disponible], [isDeleted]) VALUES (9, 2, 2, 2, 1, 0)
INSERT [dbo].[exemplaire] ([id], [idLivre], [idBibliotheque], [idEtat], [disponible], [isDeleted]) VALUES (11, 1, 1, 1, 0, 0)
INSERT [dbo].[exemplaire] ([id], [idLivre], [idBibliotheque], [idEtat], [disponible], [isDeleted]) VALUES (12, 1, 1, 1, 1, 1)
INSERT [dbo].[exemplaire] ([id], [idLivre], [idBibliotheque], [idEtat], [disponible], [isDeleted]) VALUES (13, 3, 20, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[exemplaire] OFF
GO
SET IDENTITY_INSERT [dbo].[image] ON 

INSERT [dbo].[image] ([id], [lien], [description], [idLivre]) VALUES (1, N'images/eragonFront.jpg', N'Couverture eragon', 1)
SET IDENTITY_INSERT [dbo].[image] OFF
GO
SET IDENTITY_INSERT [dbo].[livre] ON 

INSERT [dbo].[livre] ([id], [nom], [EAN], [ISBN], [edition], [prix], [synopsis], [numerique], [auteur]) VALUES (1, N'Eragon', N'', N'9780966621334', N'Bayard Jeunesse', 12.899999618530273, N'Histoire de dragons', 0, N'Christopher Paolini')
INSERT [dbo].[livre] ([id], [nom], [EAN], [ISBN], [edition], [prix], [synopsis], [numerique], [auteur]) VALUES (2, N'Harry Potter 1', N'2070584623', N'9782070584628', N'Gallimard jeunesse', 8.8999996185302734, N'Harry Potter est un garçon ordinaire. Mais le jour de ses onze ans, son existence bascule : un géant vient le chercher pour l emmener dans une école de sorciers. Quel mystère entoure donc sa naissance et qui est l effroyable V..., le mage dont personne n ose prononcer le nom ? Voler à cheval sur des balais, jeter des sorts, combattre les Trolls : Harry Potter se révèle un sorcier vraiment doué. Quand il décide, avec ses amis, d explorer les moindres recoins de son école, il va se trouver entraîné dans d extraordinaires aventures.', 0, N'J.K. Rowling')
INSERT [dbo].[livre] ([id], [nom], [EAN], [ISBN], [edition], [prix], [synopsis], [numerique], [auteur]) VALUES (3, N'Star Wars 1', N'284055383X', N'9782840553830', N'Delcourt', 5.5900001525878906, N'La menace fantôme', 0, N'Damaggio, Wiliamson')
INSERT [dbo].[livre] ([id], [nom], [EAN], [ISBN], [edition], [prix], [synopsis], [numerique], [auteur]) VALUES (5, N'Warcraft: Rise of the Horde', N'0743471385', N'9780743471381', N'Pocket Star', 9.5, N'Pour la horde !', 0, N'Christie Golden')
INSERT [dbo].[livre] ([id], [nom], [EAN], [ISBN], [edition], [prix], [synopsis], [numerique], [auteur]) VALUES (6, N'Le Trésor des pharaons', N'2070542882', N'9782070542888', N'Gallimard Jeunesse', 11.479999542236328, N'Un livre dont vous êtes le héros', 0, N'Herbert Brennan')
INSERT [dbo].[livre] ([id], [nom], [EAN], [ISBN], [edition], [prix], [synopsis], [numerique], [auteur]) VALUES (7, N'Battlestar Galactica', N'1845760972', N'9781845760977', N'Titan Books', 6.9800000190734863, N'Le companion officiel', 0, N'David Bassom')
INSERT [dbo].[livre] ([id], [nom], [EAN], [ISBN], [edition], [prix], [synopsis], [numerique], [auteur]) VALUES (8,N'Lord of the rings', N'2070515796', N'9782070515790', N'Folio junior',7.38000011444092, N'Dans les vertes prairies de La Comté, les Hobbits, ou Semi-hommes, vivaient en paix…',0, N'J.R.R. Tolkien')
INSERT [dbo].[livre] ([id], [nom], [EAN], [ISBN], [edition], [prix], [synopsis], [numerique], [auteur]) VALUES (9, N'HTML for dummies', N'1234', N'1568846479', N'IDG Books',4.48000001907349, N'Learn HTML',0, N'Ed Tittel')
INSERT [dbo].[livre] ([id], [nom], [EAN], [ISBN], [edition], [prix], [synopsis], [numerique], [auteur]) VALUES (10, N'L apprenti épouvanteur', N'2747017109', N'9782747017107', N'Bayard Jeunesse',10.4399995803833, N'Thomas Ward, jeune garçon de 12 et demie, septième fils d un septième fils, est confié à l Épouvanteur John Gregory',0, N'Joseph Delaney')
INSERT [dbo].[livre] ([id], [nom], [EAN], [ISBN], [edition], [prix], [synopsis], [numerique], [auteur]) VALUES (11, N'Peter Pan', N'0307001040', N'9780307001047', N'Golden Books',5.57000017166138, N'Late one night, high above London, a figure dressed in green soared across the starry sky.',0, N'Eugene Bradley Coco')
INSERT [dbo].[livre] ([id], [nom], [EAN], [ISBN], [edition], [prix], [synopsis], [numerique], [auteur]) VALUES (12, N'Jules Verne',' NOL16449220M', N'2080670506', N'Flammarion',10.3000001907349, N'Biographie',0, N'Herbert R. Lottman')
INSERT [dbo].[livre] ([id], [nom], [EAN], [ISBN], [edition], [prix], [synopsis], [numerique], [auteur]) VALUES (13, N'Bescherelle', N'2218717166', N'2218717166', N'Hatier',5.98000001907349, N'La conjugaison pour tous',0, N'Hatier')
INSERT [dbo].[livre] ([id], [nom], [EAN], [ISBN], [edition], [prix], [synopsis], [numerique], [auteur]) VALUES (14, N'Superman', N'0307100057', N'9780307100054', N'Golden Books',5.98000001907349, N'Super héros',0, N'Mike Parobeck')
INSERT [dbo].[livre] ([id], [nom], [EAN], [ISBN], [edition], [prix], [synopsis], [numerique], [auteur]) VALUES (15, N'Linux', N'0072129409', N'9780072129403', N'Osborne',7.55999994277954, N'The Complete Reference',0, N'Tim Parker')
INSERT [dbo].[livre] ([id], [nom], [EAN], [ISBN], [edition], [prix], [synopsis], [numerique], [auteur]) VALUES (16, N'Windows 10', N'1532951957', N'9781532951954', N' CreateSpace',7.46000003814697, N'The Best Guide How to Operate New Microsoft Windows 10',0, N'Peter Hoffman')

SET IDENTITY_INSERT [dbo].[livre] OFF
GO
SET IDENTITY_INSERT [dbo].[location] ON 

INSERT [dbo].[location] ([id], [dateDebut], [dateFin], [dateRetour], [idExemplaire], [idUtilisateur]) VALUES (41, CAST(N'2020-06-16' AS Date), CAST(N'2020-06-30' AS Date), NULL, 11, 7)
SET IDENTITY_INSERT [dbo].[location] OFF
GO
SET IDENTITY_INSERT [dbo].[responsable] ON 

INSERT [dbo].[responsable] ([id], [idAdministrateur], [idBibliotheque]) VALUES (2, 3, 1)
INSERT [dbo].[responsable] ([id], [idAdministrateur], [idBibliotheque]) VALUES (4, 4, 2)
SET IDENTITY_INSERT [dbo].[responsable] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([id], [nom]) VALUES (1, N'Manager général')
INSERT [dbo].[role] ([id], [nom]) VALUES (2, N'Manager')
INSERT [dbo].[role] ([id], [nom]) VALUES (3, N'Bibliothécaire')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[theme] ON 

INSERT [dbo].[theme] ([id], [nom]) VALUES (1, N'Fantastique')
INSERT [dbo].[theme] ([id], [nom]) VALUES (2, N'Thriller')
SET IDENTITY_INSERT [dbo].[theme] OFF
GO
SET IDENTITY_INSERT [dbo].[utilisateur] ON 

INSERT [dbo].[utilisateur] ([id], [nom], [prenom], [email], [login], [motDePasse], [dateNaissance], [adresse], [telephone], [isDeleted]) VALUES (1, N'Praet', N'Pascal', N'pottekepis@hotmail.com', N'papa', N'$2a$12$kWQZgIMmzkzC2m0GjW.iHOdkBczwoQhMavfbAlTPewOZfkyNqeSku', CAST(N'1969-07-19' AS Date), N'Rue Allard Cambier 1, 7160 Piéton', N'+32496147975', 0)
INSERT [dbo].[utilisateur] ([id], [nom], [prenom], [email], [login], [motDePasse], [dateNaissance], [adresse], [telephone], [isDeleted]) VALUES (2, N'Pepito', N'Blacky', N'blacky@dog.be', N'blacky', N'$2y$12$pYjOrbTI11gfr0e/rROlfO7YwuH8rernWLPZwZ7.yid/8kXNfurPW', CAST(N'2010-01-01' AS Date), N'Rue Allard Cambier 1, 7160 Piéton', NULL, 0)
INSERT [dbo].[utilisateur] ([id], [nom], [prenom], [email], [login], [motDePasse], [dateNaissance], [adresse], [telephone], [isDeleted]) VALUES (6, N'Ben', N'Praet', N'benoit@praet.dev', N'pottekepis', N'$2a$12$sws3uxrOkKqz9ejmoScI/eMmZcKlwqjPyVG.qAF07w5KgkjgMHZ6i', CAST(N'1996-10-29' AS Date), N'Rue de test 1, 1111 Test', N'123456789', 0)
INSERT [dbo].[utilisateur] ([id], [nom], [prenom], [email], [login], [motDePasse], [dateNaissance], [adresse], [telephone], [isDeleted]) VALUES (7, N'testNom', N'testPrenom', N'test@test.test', N'testLogin', N'$2a$12$5aO/sUN9GAPRYnl3no/UT.6iwXJ3OqnhukF5K0cjMJiByyhIYhPiG', CAST(N'1996-10-29' AS Date), N'Rue test n°1, 1111 testCity', N'123456789', 0)
INSERT [dbo].[utilisateur] ([id], [nom], [prenom], [email], [login], [motDePasse], [dateNaissance], [adresse], [telephone], [isDeleted]) VALUES (8, N'testLogin', N'angularprenom', N'angular@test.test', N't', N'$2a$12$in88J.KeBfIID0tYdhIIFewV8EogkZ4x5t13o1jWO8OKW58cXQUmK', CAST(N'1980-10-10' AS Date), N'z', N'z', 0)
INSERT [dbo].[utilisateur] ([id], [nom], [prenom], [email], [login], [motDePasse], [dateNaissance], [adresse], [telephone], [isDeleted]) VALUES (13, N'angularnom', N'angularprenom', N'angular@test.test', N'angularlogin', N'$2a$12$tTWWf.q4U0uFEl7V/a0TrO1.z3R0wkkhO5BXkNS1fBaC9BGcGxxfK', CAST(N'2000-01-01' AS Date), N'Rue angular', N'0123456789', 0)
INSERT [dbo].[utilisateur] ([id], [nom], [prenom], [email], [login], [motDePasse], [dateNaissance], [adresse], [telephone], [isDeleted]) VALUES (14, N'pingouin', N'manchot', N'tux@manchot.gnu', N'penguinmanchot', N'$2a$12$zIDhkaM5jlogay9dIwRKbOsen0BbUWY7.dZBtiRmi6fnlXFw3utem', CAST(N'2020-05-11' AS Date), N'ici', N'0123456789', 0)
SET IDENTITY_INSERT [dbo].[utilisateur] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__utilisat__7838F2728120FAB3]    Script Date: 15-06-20 20:54:33 ******/
ALTER TABLE [dbo].[utilisateur] ADD UNIQUE NONCLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[administrateur] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[bibliotheque] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[exemplaire] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[utilisateur] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[administrateur]  WITH CHECK ADD FOREIGN KEY([idRole])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[administrationAdmin]  WITH CHECK ADD FOREIGN KEY([idAdministrateurCible])
REFERENCES [dbo].[administrateur] ([id])
GO
ALTER TABLE [dbo].[administrationAdmin]  WITH CHECK ADD FOREIGN KEY([idAdministrateur])
REFERENCES [dbo].[administrateur] ([id])
GO
ALTER TABLE [dbo].[administrationBiblio]  WITH CHECK ADD FOREIGN KEY([idAdministrateur])
REFERENCES [dbo].[administrateur] ([id])
GO
ALTER TABLE [dbo].[administrationBiblio]  WITH CHECK ADD FOREIGN KEY([idBibliotheque])
REFERENCES [dbo].[bibliotheque] ([id])
GO
ALTER TABLE [dbo].[administrationExemplaire]  WITH CHECK ADD FOREIGN KEY([idAdministrateur])
REFERENCES [dbo].[administrateur] ([id])
GO
ALTER TABLE [dbo].[administrationExemplaire]  WITH CHECK ADD FOREIGN KEY([idExemplaire])
REFERENCES [dbo].[exemplaire] ([id])
GO
ALTER TABLE [dbo].[administrationLivre]  WITH CHECK ADD FOREIGN KEY([idAdministrateur])
REFERENCES [dbo].[administrateur] ([id])
GO
ALTER TABLE [dbo].[administrationLivre]  WITH CHECK ADD FOREIGN KEY([idLivre])
REFERENCES [dbo].[livre] ([id])
GO
ALTER TABLE [dbo].[administrationUtilisateur]  WITH CHECK ADD FOREIGN KEY([idAdministrateur])
REFERENCES [dbo].[administrateur] ([id])
GO
ALTER TABLE [dbo].[administrationUtilisateur]  WITH CHECK ADD FOREIGN KEY([idUtilisateur])
REFERENCES [dbo].[utilisateur] ([id])
GO
ALTER TABLE [dbo].[amende]  WITH CHECK ADD FOREIGN KEY([idLocation])
REFERENCES [dbo].[location] ([id])
GO
ALTER TABLE [dbo].[amende]  WITH CHECK ADD FOREIGN KEY([idUtilisateur])
REFERENCES [dbo].[utilisateur] ([id])
GO
ALTER TABLE [dbo].[avis]  WITH CHECK ADD FOREIGN KEY([idLivre])
REFERENCES [dbo].[livre] ([id])
GO
ALTER TABLE [dbo].[avis]  WITH CHECK ADD FOREIGN KEY([idUtilisateur])
REFERENCES [dbo].[utilisateur] ([id])
GO
ALTER TABLE [dbo].[communication]  WITH CHECK ADD FOREIGN KEY([idAdministrateur])
REFERENCES [dbo].[administrateur] ([id])
GO
ALTER TABLE [dbo].[communication]  WITH CHECK ADD FOREIGN KEY([idUtilisateur])
REFERENCES [dbo].[utilisateur] ([id])
GO
ALTER TABLE [dbo].[cotisation]  WITH CHECK ADD FOREIGN KEY([idBibliotheque])
REFERENCES [dbo].[bibliotheque] ([id])
GO
ALTER TABLE [dbo].[cotisation]  WITH CHECK ADD FOREIGN KEY([idUtilisateur])
REFERENCES [dbo].[utilisateur] ([id])
GO
ALTER TABLE [dbo].[exemplaire]  WITH CHECK ADD FOREIGN KEY([idBibliotheque])
REFERENCES [dbo].[bibliotheque] ([id])
GO
ALTER TABLE [dbo].[exemplaire]  WITH CHECK ADD FOREIGN KEY([idEtat])
REFERENCES [dbo].[etat] ([id])
GO
ALTER TABLE [dbo].[exemplaire]  WITH CHECK ADD FOREIGN KEY([idLivre])
REFERENCES [dbo].[livre] ([id])
GO
ALTER TABLE [dbo].[image]  WITH CHECK ADD FOREIGN KEY([idLivre])
REFERENCES [dbo].[livre] ([id])
GO
ALTER TABLE [dbo].[livreTheme]  WITH CHECK ADD FOREIGN KEY([idLivre])
REFERENCES [dbo].[livre] ([id])
GO
ALTER TABLE [dbo].[livreTheme]  WITH CHECK ADD FOREIGN KEY([idTheme])
REFERENCES [dbo].[theme] ([id])
GO
ALTER TABLE [dbo].[location]  WITH CHECK ADD FOREIGN KEY([idExemplaire])
REFERENCES [dbo].[exemplaire] ([id])
GO
ALTER TABLE [dbo].[location]  WITH CHECK ADD FOREIGN KEY([idUtilisateur])
REFERENCES [dbo].[utilisateur] ([id])
GO
ALTER TABLE [dbo].[responsable]  WITH CHECK ADD FOREIGN KEY([idAdministrateur])
REFERENCES [dbo].[administrateur] ([id])
GO
ALTER TABLE [dbo].[responsable]  WITH CHECK ADD FOREIGN KEY([idBibliotheque])
REFERENCES [dbo].[bibliotheque] ([id])
GO
USE [master]
GO
ALTER DATABASE [Bibliotheque] SET  READ_WRITE 
GO
