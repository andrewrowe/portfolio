USE [master]
GO
/****** Object:  Database [TravelBlogCapstone]    Script Date: 6/27/2016 2:14:11 PM ******/
CREATE DATABASE [TravelBlogCapstone]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TravelBlogCapstone', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\TravelBlogCapstone.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TravelBlogCapstone_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\TravelBlogCapstone_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TravelBlogCapstone] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TravelBlogCapstone].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TravelBlogCapstone] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TravelBlogCapstone] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TravelBlogCapstone] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TravelBlogCapstone] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TravelBlogCapstone] SET ARITHABORT OFF 
GO
ALTER DATABASE [TravelBlogCapstone] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TravelBlogCapstone] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TravelBlogCapstone] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TravelBlogCapstone] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TravelBlogCapstone] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TravelBlogCapstone] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TravelBlogCapstone] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TravelBlogCapstone] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TravelBlogCapstone] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TravelBlogCapstone] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TravelBlogCapstone] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TravelBlogCapstone] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TravelBlogCapstone] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TravelBlogCapstone] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TravelBlogCapstone] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TravelBlogCapstone] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TravelBlogCapstone] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TravelBlogCapstone] SET RECOVERY FULL 
GO
ALTER DATABASE [TravelBlogCapstone] SET  MULTI_USER 
GO
ALTER DATABASE [TravelBlogCapstone] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TravelBlogCapstone] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TravelBlogCapstone] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TravelBlogCapstone] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TravelBlogCapstone] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TravelBlogCapstone]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](35) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Comment] [text] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Endorsements]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endorsements](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PostID] [int] NOT NULL,
 CONSTRAINT [PK_Endorsements] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pictures]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pictures](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PictureURL] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Pictures] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Posts]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UpdatedPostID] [int] NULL,
	[Title] [nvarchar](100) NULL,
	[PostContent] [text] NULL,
	[LastModifiedDate] [datetime2](7) NOT NULL,
	[InitialPostDate] [datetime2](7) NULL,
	[UpdatedPostDate] [datetime2](7) NULL,
	[PublishedDate] [datetime2](7) NOT NULL,
	[ExpiredDate] [datetime2](7) NULL,
	[UserID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[Remark] [nvarchar](max) NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Posts_Categories]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts_Categories](
	[CategoryID] [int] NOT NULL,
	[PostID] [int] NOT NULL,
 CONSTRAINT [PK_Post_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC,
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Posts_Tags]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts_Tags](
	[TagID] [int] NOT NULL,
	[PostID] [int] NOT NULL,
 CONSTRAINT [PK_Post_Tags] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC,
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StaticPages]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaticPages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[PageContent] [text] NOT NULL,
 CONSTRAINT [PK_StaticPages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](20) NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [CategoryName]) VALUES (1, N'Hotel')
INSERT [dbo].[Categories] ([ID], [CategoryName]) VALUES (2, N'Restaurant')
INSERT [dbo].[Categories] ([ID], [CategoryName]) VALUES (3, N'Trip in Europe')
INSERT [dbo].[Categories] ([ID], [CategoryName]) VALUES (4, N'Trip in US')
INSERT [dbo].[Categories] ([ID], [CategoryName]) VALUES (5, N'Trip in Asia')
INSERT [dbo].[Categories] ([ID], [CategoryName]) VALUES (6, N'Organized trip')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([ID], [UpdatedPostID], [Title], [PostContent], [LastModifiedDate], [InitialPostDate], [UpdatedPostDate], [PublishedDate], [ExpiredDate], [UserID], [StatusID], [Remark]) VALUES (1, 6, N'Trip in Venice', N'Walk on the cobblestone streets and arched bridges of 
this pedestrian-friendly island city in northeastern Italy and let your senses guide you. 
Hear the water lap against the gondolas in the canals. Breathe in the aroma of fresh 
Italian food and taste quality wine on the restaurant terraces. Feel the sun warm 
your skin as you wander through St. Mark Square (Piazza San Marco) and listen to street 
musicians perform serenades to lovers. Even in the cooler winter months, Venice is bustling. 
Summer days can get hot and crowded, while autumn and spring are usually the most pleasant times to visit. 
It is easy to visit all premier attractions in just a few days. St. Mark’s Square is magnificent and a 
good place to start. Two of Venice’s most spectacular buildings, St. Mark’s Basilica (Basilica di San Marco) 
and the Doge’s Palace (Palazzo Ducale), rub shoulders at the east end of the square. 
Find the best example of Venice’s Byzantine influence in the basilica, with its ornate golden mosaics 
and elaborate domes. The palace impresses with ostentatious displays of wealth and power.', CAST(N'2015-03-15 00:00:00.0000000' AS DateTime2), CAST(N'2015-03-15 00:00:00.0000000' AS DateTime2), NULL, CAST(N'2015-03-15 00:00:00.0000000' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[Posts] ([ID], [UpdatedPostID], [Title], [PostContent], [LastModifiedDate], [InitialPostDate], [UpdatedPostDate], [PublishedDate], [ExpiredDate], [UserID], [StatusID], [Remark]) VALUES (2, NULL, N'Adventure with Bruno in Paris', N'In true French style, Paris combines the classic and the modern. Classic landmarks include the ancient Notre Dame cathedral, Arc de Triomphe the Eiffel Tower, and contemporary architectural achievements such as the La Défense district. 
The city is divided into 20 arrondissements, or districts, which spiral clockwise from the city’s center. Paris is also split by the river Seine into the Left and Right Banks. Each arrondissement and area of Paris has its own character and flair. Le Marais is best known for medieval architecture, intimate wine bars and a diverse community. Luxembourg has a special old-world charm, enchanting gardens, and proximity to the upscale St-Germain-des-Prés. Montmartre is famous for its cobbled streets, the Moulin Rouge and magnificent Basilique du Sacré Cœur (Basilica of the Sacred Heart).', CAST(N'2016-02-08 00:00:00.0000000' AS DateTime2), CAST(N'2016-02-09 00:00:00.0000000' AS DateTime2), NULL, CAST(N'2016-02-15 00:00:00.0000000' AS DateTime2), NULL, 3, 1, NULL)
INSERT [dbo].[Posts] ([ID], [UpdatedPostID], [Title], [PostContent], [LastModifiedDate], [InitialPostDate], [UpdatedPostDate], [PublishedDate], [ExpiredDate], [UserID], [StatusID], [Remark]) VALUES (4, NULL, N'Grand Canyon Package', N'Carved millions of years ago by the Colorado River and natural geological processes, the Grand Canyon’s stark beauty, rusty, desert colors and glorious sunsets pull tourists from across the globe. For Las Vegas visitors, this national treasure is a manageable overnight trip at about 227 miles (365 kilometers) from the city.
The canyon’s easily accessible south rim is the most popular spot with visitors. Much of the Grand Canyon National Park’s infrastructure is based here, including the Canyon View Information Plaza, which includes the Grand Canyon Visitor Center. Here you’ll find helpful guides, brochures, audiovisual displays and interactive features about the area’s fascinating history, geology and wildlife. Hop on the free shuttle bus (cost included in the entry fee to the national park) to visit other museums and viewpoints around the south rim.', CAST(N'2016-04-23 00:00:00.0000000' AS DateTime2), CAST(N'2016-03-18 00:00:00.0000000' AS DateTime2), CAST(N'2016-04-23 00:00:00.0000000' AS DateTime2), CAST(N'2016-04-23 00:00:00.0000000' AS DateTime2), CAST(N'2016-12-31 00:00:00.0000000' AS DateTime2), 1, 1, NULL)
INSERT [dbo].[Posts] ([ID], [UpdatedPostID], [Title], [PostContent], [LastModifiedDate], [InitialPostDate], [UpdatedPostDate], [PublishedDate], [ExpiredDate], [UserID], [StatusID], [Remark]) VALUES (5, NULL, N'El Nacional Restaurant, Barcelona', N'<h2> A New culinary Concept </h2> El Nacional represents an innovative concept that will mark a turning point in culinary trends. 4 areas, 4 bars and a thousand ways to feed the soul. That is El Nacional. A meat restaurant, a fish restaurant, a tapas and rice restaurant and a fast deli restaurant. Four distinct areas, as well as 4 bars specialised in: beer, wine, cava and cocktails, making El Nacional Barcelona restaurant of the moment, a place to immerse oneself in local life in the city.
A multi-zone culinary establishment, where each of the sections has its own unique characteristics, creating the sensation that there are different experiences to be had within the same restaurant.', CAST(N'2016-06-23 00:00:00.0000000' AS DateTime2), NULL, NULL, CAST(N'2016-07-15 00:00:00.0000000' AS DateTime2), NULL, 5, 2, NULL)
INSERT [dbo].[Posts] ([ID], [UpdatedPostID], [Title], [PostContent], [LastModifiedDate], [InitialPostDate], [UpdatedPostDate], [PublishedDate], [ExpiredDate], [UserID], [StatusID], [Remark]) VALUES (6, NULL, N'Caesars Palace, Las Vegas', N'Caesars Palace is a AAA Four Diamond luxury hotel and casino in Paradise, Nevada, United States, situated on the west side of the Las Vegas Strip, between Bellagio and the Mirage. The Palace was established in 1966 by Jay Sarno, who sought to create an opulent facility that gave guests a sense of life during the Roman Empire. It contains many statues, columns and iconography typical of Hollywood Roman period productions, including a 20-foot (6.1 m) statue of Julius Caesar near the entrance.', CAST(N'2016-06-23 00:00:00.0000000' AS DateTime2), NULL, NULL, CAST(N'2016-06-23 00:00:00.0000000' AS DateTime2), NULL, 3, 4, NULL)
INSERT [dbo].[Posts] ([ID], [UpdatedPostID], [Title], [PostContent], [LastModifiedDate], [InitialPostDate], [UpdatedPostDate], [PublishedDate], [ExpiredDate], [UserID], [StatusID], [Remark]) VALUES (7, NULL, N'Trip In Venice', N'Walk on the cobblestone streets and arched bridges of 
this pedestrian-friendly island city in northeastern Italy and let your senses guide you. 
Hear the water lap against the gondolas in the canals. Breathe in the aroma of fresh 
Italian food and taste quality wine on the restaurant terraces. Feel the sun warm 
your skin as you wander through St. Mark Square (Piazza San Marco) and listen to street 
musicians perform serenades to lovers. Even in the cooler winter months, Venice is bustling. 
Summer days can get hot and crowded, while autumn and spring are usually the most pleasant times to visit. 
It is easy to visit all premier attractions in just a few days. St. Mark’s Square is magnificent and a 
good place to start. Two of Venice’s most spectacular buildings, St. Mark’s Basilica (Basilica di San Marco) 
and the Doge’s Palace (Palazzo Ducale), rub shoulders at the east end of the square. 
Find the best example of Venice’s Byzantine influence in the basilica, with its ornate golden mosaics 
and elaborate domes. The palace impresses with ostentatious displays of wealth and power. Don’t miss treasures such as the Chiesa Santa Maria dei Miracoli, a 15th-century marble church. Take a ferry ride to the islands of Murano and Burano. Both are known for their artisans who work with glass and lace respectively. The islands make for a peaceful day trip away from the chaotic but irresistible heart of Venice.
Savor your days in the Floating City and enjoy the Italian passion for food, romance and style.', CAST(N'2016-06-19 00:00:00.0000000' AS DateTime2), CAST(N'2015-03-15 00:00:00.0000000' AS DateTime2), NULL, CAST(N'2016-06-23 00:00:00.0000000' AS DateTime2), NULL, 1, 3, NULL)
INSERT [dbo].[Posts] ([ID], [UpdatedPostID], [Title], [PostContent], [LastModifiedDate], [InitialPostDate], [UpdatedPostDate], [PublishedDate], [ExpiredDate], [UserID], [StatusID], [Remark]) VALUES (9, 0, N'sadff', N'<p>asdfasdf</p>', CAST(N'2016-06-27 10:12:35.9100000' AS DateTime2), CAST(N'2016-06-27 10:12:37.1400000' AS DateTime2), NULL, CAST(N'2016-06-22 00:00:00.0000000' AS DateTime2), NULL, 1, 2, NULL)
INSERT [dbo].[Posts] ([ID], [UpdatedPostID], [Title], [PostContent], [LastModifiedDate], [InitialPostDate], [UpdatedPostDate], [PublishedDate], [ExpiredDate], [UserID], [StatusID], [Remark]) VALUES (10, NULL, N'asdff', N'<p>asdfadf</p>', CAST(N'2016-06-27 10:25:36.9600000' AS DateTime2), CAST(N'2016-06-27 10:25:38.1170000' AS DateTime2), NULL, CAST(N'2016-06-23 00:00:00.0000000' AS DateTime2), NULL, 1, 2, NULL)
INSERT [dbo].[Posts] ([ID], [UpdatedPostID], [Title], [PostContent], [LastModifiedDate], [InitialPostDate], [UpdatedPostDate], [PublishedDate], [ExpiredDate], [UserID], [StatusID], [Remark]) VALUES (11, NULL, N'asdffsdf', N'<p>asdfadfs</p>', CAST(N'2016-06-27 10:26:39.9600000' AS DateTime2), CAST(N'2016-06-27 10:26:39.9600000' AS DateTime2), NULL, CAST(N'2016-06-23 00:00:00.0000000' AS DateTime2), NULL, 1, 2, NULL)
INSERT [dbo].[Posts] ([ID], [UpdatedPostID], [Title], [PostContent], [LastModifiedDate], [InitialPostDate], [UpdatedPostDate], [PublishedDate], [ExpiredDate], [UserID], [StatusID], [Remark]) VALUES (12, NULL, N'sdfgsdfgsdf', N'<p>dfgdfgsdfg</p>', CAST(N'2016-06-27 10:27:01.7570000' AS DateTime2), CAST(N'2016-06-27 10:27:01.7570000' AS DateTime2), NULL, CAST(N'2016-06-23 00:00:00.0000000' AS DateTime2), NULL, 1, 2, NULL)
INSERT [dbo].[Posts] ([ID], [UpdatedPostID], [Title], [PostContent], [LastModifiedDate], [InitialPostDate], [UpdatedPostDate], [PublishedDate], [ExpiredDate], [UserID], [StatusID], [Remark]) VALUES (13, NULL, N'dfhgadfg', N'<p>adfgadfg</p>', CAST(N'2016-06-27 10:27:31.1530000' AS DateTime2), CAST(N'2016-06-27 10:27:31.1530000' AS DateTime2), NULL, CAST(N'2016-06-23 00:00:00.0000000' AS DateTime2), NULL, 1, 2, NULL)
INSERT [dbo].[Posts] ([ID], [UpdatedPostID], [Title], [PostContent], [LastModifiedDate], [InitialPostDate], [UpdatedPostDate], [PublishedDate], [ExpiredDate], [UserID], [StatusID], [Remark]) VALUES (14, NULL, N'tnhtyhm', N'<p>jyhmhy</p>', CAST(N'2016-06-27 10:29:38.7130000' AS DateTime2), CAST(N'2016-06-27 10:29:38.7130000' AS DateTime2), NULL, CAST(N'2016-06-28 00:00:00.0000000' AS DateTime2), NULL, 1, 2, NULL)
INSERT [dbo].[Posts] ([ID], [UpdatedPostID], [Title], [PostContent], [LastModifiedDate], [InitialPostDate], [UpdatedPostDate], [PublishedDate], [ExpiredDate], [UserID], [StatusID], [Remark]) VALUES (15, NULL, N'njynyuj', N'<p>yjmny</p>', CAST(N'2016-06-27 10:29:53.0070000' AS DateTime2), CAST(N'2016-06-27 10:29:53.0070000' AS DateTime2), NULL, CAST(N'2016-06-27 00:00:00.0000000' AS DateTime2), NULL, 1, 2, NULL)
INSERT [dbo].[Posts] ([ID], [UpdatedPostID], [Title], [PostContent], [LastModifiedDate], [InitialPostDate], [UpdatedPostDate], [PublishedDate], [ExpiredDate], [UserID], [StatusID], [Remark]) VALUES (16, NULL, N'rttr', N'<p>fgddfggdfdfg</p>', CAST(N'2016-06-27 10:30:23.7800000' AS DateTime2), CAST(N'2016-06-27 10:30:23.7800000' AS DateTime2), NULL, CAST(N'2016-06-24 00:00:00.0000000' AS DateTime2), NULL, 1, 2, NULL)
INSERT [dbo].[Posts] ([ID], [UpdatedPostID], [Title], [PostContent], [LastModifiedDate], [InitialPostDate], [UpdatedPostDate], [PublishedDate], [ExpiredDate], [UserID], [StatusID], [Remark]) VALUES (17, NULL, N'trdft', N'<p>sdfgsdfg</p>', CAST(N'2016-06-27 10:36:54.6770000' AS DateTime2), CAST(N'2016-06-27 10:36:54.6770000' AS DateTime2), NULL, CAST(N'2016-06-23 00:00:00.0000000' AS DateTime2), NULL, 1, 2, NULL)
INSERT [dbo].[Posts] ([ID], [UpdatedPostID], [Title], [PostContent], [LastModifiedDate], [InitialPostDate], [UpdatedPostDate], [PublishedDate], [ExpiredDate], [UserID], [StatusID], [Remark]) VALUES (18, NULL, N'asdasdfasdfsdf', N'<p>asdfasdfasdf</p>', CAST(N'2016-06-27 10:37:38.0230000' AS DateTime2), CAST(N'2016-06-27 10:37:38.0230000' AS DateTime2), NULL, CAST(N'2016-06-30 00:00:00.0000000' AS DateTime2), NULL, 1, 2, NULL)
INSERT [dbo].[Posts] ([ID], [UpdatedPostID], [Title], [PostContent], [LastModifiedDate], [InitialPostDate], [UpdatedPostDate], [PublishedDate], [ExpiredDate], [UserID], [StatusID], [Remark]) VALUES (19, NULL, N'nghj', N'<p>ghjghjgjhgh</p>', CAST(N'2016-06-27 10:38:35.6870000' AS DateTime2), CAST(N'2016-06-27 10:38:35.6870000' AS DateTime2), NULL, CAST(N'2016-06-22 00:00:00.0000000' AS DateTime2), NULL, 1, 2, NULL)
INSERT [dbo].[Posts] ([ID], [UpdatedPostID], [Title], [PostContent], [LastModifiedDate], [InitialPostDate], [UpdatedPostDate], [PublishedDate], [ExpiredDate], [UserID], [StatusID], [Remark]) VALUES (20, NULL, N'jjhghjjh', N'<p>ghghjhgh</p>', CAST(N'2016-06-27 10:54:49.5270000' AS DateTime2), CAST(N'2016-06-27 10:39:42.6900000' AS DateTime2), NULL, CAST(N'2016-06-22 00:00:00.0000000' AS DateTime2), NULL, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Posts] OFF
INSERT [dbo].[Posts_Categories] ([CategoryID], [PostID]) VALUES (1, 6)
INSERT [dbo].[Posts_Categories] ([CategoryID], [PostID]) VALUES (2, 5)
INSERT [dbo].[Posts_Categories] ([CategoryID], [PostID]) VALUES (3, 1)
INSERT [dbo].[Posts_Categories] ([CategoryID], [PostID]) VALUES (3, 2)
INSERT [dbo].[Posts_Categories] ([CategoryID], [PostID]) VALUES (3, 7)
INSERT [dbo].[Posts_Categories] ([CategoryID], [PostID]) VALUES (4, 4)
INSERT [dbo].[Posts_Categories] ([CategoryID], [PostID]) VALUES (6, 2)
INSERT [dbo].[Posts_Categories] ([CategoryID], [PostID]) VALUES (6, 4)
INSERT [dbo].[Posts_Tags] ([TagID], [PostID]) VALUES (2, 1)
INSERT [dbo].[Posts_Tags] ([TagID], [PostID]) VALUES (2, 7)
INSERT [dbo].[Posts_Tags] ([TagID], [PostID]) VALUES (3, 4)
INSERT [dbo].[Posts_Tags] ([TagID], [PostID]) VALUES (4, 4)
INSERT [dbo].[Posts_Tags] ([TagID], [PostID]) VALUES (4, 6)
INSERT [dbo].[Posts_Tags] ([TagID], [PostID]) VALUES (6, 1)
INSERT [dbo].[Posts_Tags] ([TagID], [PostID]) VALUES (6, 2)
INSERT [dbo].[Posts_Tags] ([TagID], [PostID]) VALUES (6, 7)
INSERT [dbo].[Posts_Tags] ([TagID], [PostID]) VALUES (8, 2)
INSERT [dbo].[Posts_Tags] ([TagID], [PostID]) VALUES (8, 5)
INSERT [dbo].[Posts_Tags] ([TagID], [PostID]) VALUES (8, 6)
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([ID], [StatusName]) VALUES (1, N'Approved')
INSERT [dbo].[Status] ([ID], [StatusName]) VALUES (2, N'PendingNew')
INSERT [dbo].[Status] ([ID], [StatusName]) VALUES (3, N'PendingUpdate')
INSERT [dbo].[Status] ([ID], [StatusName]) VALUES (4, N'Draft')
INSERT [dbo].[Status] ([ID], [StatusName]) VALUES (5, N'Deleted')
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([ID], [TagName]) VALUES (1, N'beach')
INSERT [dbo].[Tags] ([ID], [TagName]) VALUES (2, N'sea')
INSERT [dbo].[Tags] ([ID], [TagName]) VALUES (3, N'montain')
INSERT [dbo].[Tags] ([ID], [TagName]) VALUES (4, N'hot')
INSERT [dbo].[Tags] ([ID], [TagName]) VALUES (5, N'cold')
INSERT [dbo].[Tags] ([ID], [TagName]) VALUES (6, N'love')
INSERT [dbo].[Tags] ([ID], [TagName]) VALUES (7, N'cheap')
INSERT [dbo].[Tags] ([ID], [TagName]) VALUES (8, N'expensive')
SET IDENTITY_INSERT [dbo].[Tags] OFF
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Post] FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([ID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Post]
GO
ALTER TABLE [dbo].[Endorsements]  WITH CHECK ADD  CONSTRAINT [FK_Endorsements_Post] FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([ID])
GO
ALTER TABLE [dbo].[Endorsements] CHECK CONSTRAINT [FK_Endorsements_Post]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Status]
GO
ALTER TABLE [dbo].[Posts_Categories]  WITH CHECK ADD  CONSTRAINT [FK_Post_Categories_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Posts_Categories] CHECK CONSTRAINT [FK_Post_Categories_Categories]
GO
ALTER TABLE [dbo].[Posts_Categories]  WITH CHECK ADD  CONSTRAINT [FK_Post_Categories_Post] FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([ID])
GO
ALTER TABLE [dbo].[Posts_Categories] CHECK CONSTRAINT [FK_Post_Categories_Post]
GO
ALTER TABLE [dbo].[Posts_Tags]  WITH CHECK ADD  CONSTRAINT [FK_Post_Tags_Post] FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([ID])
GO
ALTER TABLE [dbo].[Posts_Tags] CHECK CONSTRAINT [FK_Post_Tags_Post]
GO
ALTER TABLE [dbo].[Posts_Tags]  WITH CHECK ADD  CONSTRAINT [FK_Post_Tags_Tags] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([ID])
GO
ALTER TABLE [dbo].[Posts_Tags] CHECK CONSTRAINT [FK_Post_Tags_Tags]
GO
/****** Object:  StoredProcedure [dbo].[AddCategoryPost]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCategoryPost]
(
	@PostID int,
	@CategoryID int
)
AS

INSERT INTO Posts_Categories (PostID, CategoryID)
VALUES (@PostID, @CategoryID)


GO
/****** Object:  StoredProcedure [dbo].[AddComment]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddComment]
(
	@PostID int,
	@UserID int,
	@Comment nvarchar(MAX)
) AS
INSERT INTO Comments (PostID, UserID, Comment)
VALUES (@PostID, @UserID, @Comment)






GO
/****** Object:  StoredProcedure [dbo].[AddEndorsement]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddEndorsement]
(
	@PostID int,
	@UserID int
) AS
INSERT INTO Endorsements (UserID, PostID)
VALUES (@UserID, @PostID)






GO
/****** Object:  StoredProcedure [dbo].[AddNewPost]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddNewPost]
(
	@UpdatedPostID int null,
	@Title varchar(100),
	@PostContent text,
	@LastModifiedDate datetime2(7),
	@PublishedDate datetime2(7),
	@ExpiredDate datetime2(7) null,
	@UserID int,
	@StatusId int,
	@InitialPostDate datetime2(7)
)AS

INSERT INTO Posts(UpdatedPostID, Title, PostContent, LastModifiedDate, InitialPostDate, PublishedDate, ExpiredDate, UserID, StatusID)
VALUES (@UpdatedPostID, @Title, @PostContent, @LastModifiedDate, @InitialPostDate, @PublishedDate, @ExpiredDate, @UserID, @StatusId)





GO
/****** Object:  StoredProcedure [dbo].[AddTag]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddTag]
(
	@TagName nvarchar(20),
	@TagID int OUTPUT
) AS
INSERT INTO Tags (TagName)
VALUES (@TagName)

SET @TagID = Scope_Identity()
RETURN






GO
/****** Object:  StoredProcedure [dbo].[AddTagPost]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddTagPost]
(
	@TagID int,
	@PostID int
)
AS
INSERT INTO Posts_Tags (TagID, PostID)
VALUES (@TagID, @PostID)


GO
/****** Object:  StoredProcedure [dbo].[ApprovePost]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ApprovePost]
(
	@PostId int
) AS
DELETE FROM Posts
WHERE UpdatedPostID = @PostId

UPDATE Posts
SET StatusID = 1
WHERE ID = @PostId

GO
/****** Object:  StoredProcedure [dbo].[DisapprovePost]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DisapprovePost]
(
	@PostId int,
	@Remark nvarchar(250)
) AS
UPDATE Posts
SET Remark = @Remark, StatusID = 4
WHERE ID = @PostId

GO
/****** Object:  StoredProcedure [dbo].[RemovePostTags]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemovePostTags]
(
	@PostID int
)
AS
DELETE
FROM Posts
WHERE Posts.ID = @PostID

DELETE
FROM Posts_Tags
WHERE Posts_Tags.PostID = @PostID


GO
/****** Object:  StoredProcedure [dbo].[SelectAllPosts]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllPosts]
AS
SELECT *
FROM Posts
ORDER BY LastModifiedDate DESC


GO
/****** Object:  StoredProcedure [dbo].[SelectApprovedPosts]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectApprovedPosts]
(
	@EmployeeID int
) AS
SELECT *
FROM Posts
WHERE Posts.StatusID = 1 and Posts.UserID = @EmployeeID
ORDER BY LastModifiedDate DESC






GO
/****** Object:  StoredProcedure [dbo].[SelectDraftsAndPendingPosts]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectDraftsAndPendingPosts]
(
	@EmployeeID int
)
AS
SELECT *
FROM Posts
WHERE (Posts.StatusID = 2 or Posts.StatusID = 3 or Posts.StatusID = 4)
AND Posts.UserID = @EmployeeID
ORDER BY LastModifiedDate DESC





GO
/****** Object:  StoredProcedure [dbo].[SelectOnlinePosts]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectOnlinePosts]
AS
SELECT *
FROM Posts
INNER JOIN Endorsements ON Endorsements.PostID = Posts.ID
INNER JOIN Posts_Tags ON Posts.ID = Posts_Tags.PostID
INNER JOIN Tags ON Tags.ID = Posts_Tags.TagID
INNER JOIN Posts_Categories ON Posts.ID = Posts_Categories.PostID
INNER JOIN Categories ON Categories.ID = Posts_Categories.CategoryID
WHERE StatusID = 1 AND PublishedDate <= GetDate()
ORDER BY PublishedDate DESC



GO
/****** Object:  StoredProcedure [dbo].[SelectPendingPosts]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectPendingPosts]
AS
SELECT *
FROM Posts
WHERE StatusID = 2 or StatusID = 3
ORDER BY LastModifiedDate ASC





GO
/****** Object:  StoredProcedure [dbo].[SelectPost]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectPost]
(
	@PostID int
) AS
SELECT *
FROM Posts
INNER JOIN Comments ON Comments.PostID = Posts.ID
INNER JOIN Endorsements ON Endorsements.PostID = Posts.ID
INNER JOIN Posts_Tags ON Posts_Tags.PostID = Posts.ID
INNER JOIN Tags ON Posts_Tags.TagID = Tags.ID
INNER JOIN Posts_Categories ON Posts_Categories.PostID = Posts.ID
INNER JOIN Categories ON Categories.ID = Posts_Categories.CategoryID
WHERE Posts.ID = @PostID


GO
/****** Object:  StoredProcedure [dbo].[Top3SelectOnlinePosts]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Top3SelectOnlinePosts]
AS
SELECT TOP (3) *
FROM Posts
INNER JOIN Endorsements ON Endorsements.PostID = Posts.ID
INNER JOIN Posts_Tags ON Posts.ID = Posts_Tags.PostID
INNER JOIN Tags ON Tags.ID = Posts_Tags.TagID
INNER JOIN Posts_Categories ON Posts.ID = Posts_Categories.PostID
INNER JOIN Categories ON Categories.ID = Posts_Categories.CategoryID
WHERE StatusID = 1 AND PublishedDate <= GetDate()
ORDER BY PublishedDate DESC


GO
/****** Object:  StoredProcedure [dbo].[UpdatePostStatus]    Script Date: 6/27/2016 2:14:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePostStatus]
(
	@PostID int,
	@StatusID int
) AS

UPDATE Posts
SET Posts.StatusID = @StatusID
WHERE Posts.ID = @PostID

UPDATE Posts
SET Posts.LastModifiedDate = GetDate()
WHERE Posts.ID = @PostID




GO
USE [master]
GO
ALTER DATABASE [TravelBlogCapstone] SET  READ_WRITE 
GO
