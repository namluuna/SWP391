USE [master]
GO
/****** Object:  Database [OSS]    Script Date: 3/28/2024 7:25:57 PM ******/
CREATE DATABASE [OSS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OSS', FILENAME = N'E:\SQL SEVER\MSSQL16.SQLEXPRESS\MSSQL\DATA\OSS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OSS_log', FILENAME = N'E:\SQL SEVER\MSSQL16.SQLEXPRESS\MSSQL\DATA\OSS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OSS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OSS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OSS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OSS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OSS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OSS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OSS] SET ARITHABORT OFF 
GO
ALTER DATABASE [OSS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OSS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OSS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OSS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OSS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OSS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OSS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OSS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OSS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OSS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OSS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OSS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OSS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OSS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OSS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OSS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OSS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OSS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OSS] SET  MULTI_USER 
GO
ALTER DATABASE [OSS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OSS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OSS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OSS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OSS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OSS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OSS] SET QUERY_STORE = ON
GO
ALTER DATABASE [OSS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [OSS]
GO
/****** Object:  Table [dbo].[account_active_tokens]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account_active_tokens](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_email] [nvarchar](50) NULL,
	[token] [varchar](255) NULL,
	[expiration_time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[administrative_regions]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administrative_regions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[name_en] [nvarchar](255) NOT NULL,
	[code_name] [nvarchar](255) NULL,
	[code_name_en] [nvarchar](255) NULL,
 CONSTRAINT [administrative_regions_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[administrative_units]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administrative_units](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](255) NULL,
	[full_name_en] [nvarchar](255) NULL,
	[short_name] [nvarchar](255) NULL,
	[short_name_en] [nvarchar](255) NULL,
	[code_name] [nvarchar](255) NULL,
	[code_name_en] [nvarchar](255) NULL,
 CONSTRAINT [administrative_units_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brands]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brands](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_items]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_items](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[product_detail_id] [int] NULL,
	[quantity] [int] NULL,
	[is_selected] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[colors]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[colors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[color_code] [nvarchar](500) NULL,
	[created_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[districts]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[districts](
	[code] [nvarchar](20) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[name_en] [nvarchar](255) NULL,
	[full_name] [nvarchar](255) NULL,
	[full_name_en] [nvarchar](255) NULL,
	[code_name] [nvarchar](255) NULL,
	[province_code] [nvarchar](20) NULL,
	[administrative_unit_id] [int] NULL,
 CONSTRAINT [districts_pkey] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[forms]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[groups]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[materials]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materials](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_detail_id] [int] NULL,
	[quantity] [int] NULL,
	[unit_price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_status]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_status](
	[id] [int] NULL,
	[status] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_code] [varchar](255) NULL,
	[customer_id] [int] NULL,
	[oder_date] [datetime] NULL,
	[order_status] [int] NULL,
	[delivery_address_id] [int] NULL,
	[delivery_date] [datetime] NULL,
	[payment_method] [int] NULL,
	[note] [nvarchar](500) NULL,
	[shipping_company_id] [int] NULL,
	[shipping_code] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[password_reset_tokens]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[password_reset_tokens](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_email] [nvarchar](50) NULL,
	[token] [varchar](255) NULL,
	[expiration_time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_details]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[color_id] [int] NULL,
	[size_id] [int] NULL,
	[inventory_number] [int] NULL,
	[image_url_1] [nvarchar](500) NULL,
	[image_url_2] [nvarchar](500) NULL,
	[image_url_3] [nvarchar](500) NULL,
	[image_url_4] [nvarchar](500) NULL,
	[created_at] [datetime] NULL,
	[edited_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[price] [int] NULL,
	[category_id] [int] NULL,
	[form_id] [int] NULL,
	[brand_id] [int] NULL,
	[material_id] [int] NULL,
	[group_id] [int] NULL,
	[created_at] [datetime] NULL,
	[edited_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provinces]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provinces](
	[code] [nvarchar](20) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[name_en] [nvarchar](255) NULL,
	[full_name] [nvarchar](255) NOT NULL,
	[full_name_en] [nvarchar](255) NULL,
	[code_name] [nvarchar](255) NULL,
	[administrative_unit_id] [int] NULL,
	[administrative_region_id] [int] NULL,
 CONSTRAINT [provinces_pkey] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shipping_companies]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shipping_companies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sizes]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sizes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_addresses]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_addresses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[province_code] [nvarchar](20) NOT NULL,
	[district_code] [nvarchar](20) NOT NULL,
	[ward_code] [nvarchar](20) NOT NULL,
	[address] [nvarchar](100) NULL,
	[created_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[is_default] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_contracts]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_contracts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[salary] [int] NULL,
	[start_date] [datetime] NULL,
	[slot] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
	[is_deleted] [tinyint] NOT NULL,
	[role] [tinyint] NOT NULL,
	[status] [tinyint] NOT NULL,
	[image_url] [varchar](255) NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wards]    Script Date: 3/28/2024 7:25:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wards](
	[code] [nvarchar](20) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[name_en] [nvarchar](255) NULL,
	[full_name] [nvarchar](255) NULL,
	[full_name_en] [nvarchar](255) NULL,
	[code_name] [nvarchar](255) NULL,
	[district_code] [nvarchar](20) NULL,
	[administrative_unit_id] [int] NULL,
 CONSTRAINT [wards_pkey] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[brands] ON 

INSERT [dbo].[brands] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (1, N'Nike', N'Nike là một trong những thương hiệu giày thể thao hàng đầu trên toàn thế giới, được biết đến với sự đa dạng, chất lượng và sáng tạo trong thiết kế sản phẩm. Thương hiệu này được thành lập vào năm 1964 bởi Bill Bowerman và Phil Knight với tên gọi Blue Ribbon Sports và sau đó đổi tên thành Nike vào năm 1971.  Nike chuyên sản xuất và phân phối giày thể thao, quần áo và các phụ kiện liên quan, phục vụ cho mọi nhu cầu của người chơi thể thao, từ các vận động viên chuyên nghiệp đến những người tập thể dục thường xuyên. Các sản phẩm của Nike bao gồm giày chạy bộ, giày bóng rổ, giày đá bóng, giày đua xe đạp, đồng phục đội tuyển quốc gia, áo thun, quần áo thể thao, ví, túi xách và nhiều sản phẩm khác.  Nike luôn nổi tiếng với việc áp dụng công nghệ tiên tiến vào thiết kế và sản xuất giày, như công nghệ đệm Air Max, công nghệ Flyknit, React Foam, và nhiều công nghệ khác, tạo ra những sản phẩm với hiệu suất tối ưu và thoải mái. Đồng thời, Nike cũng chú trọng vào việc thiết kế các sản phẩm mang tính biểu tượng, với nhiều dòng giày như Air Force 1, Air Jordan, và Cortez, góp phần tạo nên văn hóa thời trang thể thao độc đáo và phong cách.', CAST(N'2024-03-27T06:16:06.823' AS DateTime), NULL, CAST(N'2024-03-27T10:35:25.963' AS DateTime))
INSERT [dbo].[brands] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (2, N'Converse', N'Converse là một thương hiệu giày nổi tiếng trên toàn cầu, nổi bật với dòng giày canvas và cao cổ được biết đến như Chuck Taylor All Stars. Thương hiệu này được thành lập vào năm 1908 tại Malden, Massachusetts, Hoa Kỳ bởi Marquis Mills Converse và ban đầu chủ yếu sản xuất các sản phẩm như giày cao su và giày dép bảo hộ.  Tuy nhiên, nổi tiếng nhất của Converse là dòng giày Chuck Taylor All Stars, được ra mắt vào những năm 1920 và nhanh chóng trở thành biểu tượng của văn hóa thể thao và đường phố. Nhờ vào kiểu dáng đơn giản, nhưng vô cùng phong cách và dễ kết hợp với nhiều loại trang phục khác nhau, Chuck Taylor All Stars đã trở thành một trong những sản phẩm giày bán chạy nhất mọi thời đại.  Ngoài dòng sản phẩm Chuck Taylor, Converse cũng sản xuất nhiều dòng giày khác nhau, bao gồm giày skateboarding, giày thể thao, và giày thời trang. Mặc dù kiểu dáng của các sản phẩm có thể thay đổi, nhưng Converse luôn giữ vững phong cách đơn giản, tinh tế và phù hợp với nhiều đối tượng và phong cách cá nhân khác nhau.', CAST(N'2024-03-27T06:18:15.790' AS DateTime), NULL, NULL)
INSERT [dbo].[brands] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (3, N'Adidas', N'Adidas là một trong những thương hiệu giày thể thao hàng đầu trên toàn cầu, nổi tiếng với sự đa dạng, chất lượng và sáng tạo trong thiết kế sản phẩm. Thương hiệu này được thành lập vào năm 1949 bởi Adolf "Adi" Dassler ở Đức và đã trở thành biểu tượng của văn hóa thể thao và thời trang.  Adidas chuyên sản xuất và phân phối giày thể thao, quần áo và các phụ kiện liên quan, phục vụ cho mọi nhu cầu của người chơi thể thao, từ các vận động viên chuyên nghiệp đến những người tập thể dục thường xuyên. Các sản phẩm của Adidas bao gồm giày chạy bộ, giày bóng đá, giày tennis, quần áo thể thao, đồng phục đội tuyển quốc gia, áo thun, quần áo thể thao, ví, túi xách và nhiều sản phẩm khác.  Adidas luôn nổi tiếng với việc áp dụng công nghệ tiên tiến vào thiết kế và sản xuất giày, như công nghệ đệm Boost, công nghệ đế Continental Rubber cho độ bám tốt, và nhiều công nghệ khác, tạo ra những sản phẩm với hiệu suất tối ưu và thoải mái. Đồng thời, Adidas cũng chú trọng vào việc thiết kế các sản phẩm mang tính biểu tượng, với các dòng giày như Adidas Originals, Adidas Superstar, và Adidas Ultraboost, góp phần tạo nên văn hóa thời trang thể thao độc đáo và phong cách.', CAST(N'2024-03-27T09:43:31.413' AS DateTime), NULL, NULL)
INSERT [dbo].[brands] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (4, N'Vans', N'Vans là một trong những thương hiệu giày thể thao và thời trang nổi tiếng trên toàn cầu, được biết đến với kiểu dáng độc đáo và phổ biến trong văn hóa đường phố. Thương hiệu này được thành lập vào năm 1966 tại California, Hoa Kỳ bởi Paul Van Doren, James Van Doren, Gordon C. Lee và Serge D''Elia, và nhanh chóng trở thành một biểu tượng của văn hóa skateboard và thời trang đường phố.  Vans chuyên sản xuất và phân phối giày thể thao, quần áo và phụ kiện với những kiểu dáng đa dạng như giày skateboarding, giày đi xe đạp, giày thể thao và giày lười. Các sản phẩm của Vans thường mang tính biểu tượng với thiết kế đơn giản nhưng hiện đại.', CAST(N'2024-03-27T10:10:13.207' AS DateTime), NULL, NULL)
INSERT [dbo].[brands] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (5, N'VINTAS', N'Mẫu giày Vintas được định danh bởi 2 yếu tố: Tiền tố "vint" trong từ "Vintage” (Tạm dịch: cổ điển) và hậu tố "as" trong từ "Ananas”. Những đôi giày Ananas Vintas gợi nhắc về những mẫu giày từng gắn với Sài Gòn ở những thập niên trước.   Đây cũng là lý do mà dòng giày này được “nhuộm” những tông màu của quá khứ như xám, đen, nâu trầm, xanh denim, xanh cỏ cây, … Các tông màu thiên hướng dành cho giày nam và được các bạn nam khá yêu thích. ', CAST(N'2024-03-27T10:57:00.520' AS DateTime), NULL, NULL)
INSERT [dbo].[brands] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (6, N'PUMA', N'Puma là một thương hiệu thể thao hàng đầu trên toàn cầu, nổi tiếng với sự đa dạng, sáng tạo và phong cách trong thiết kế sản phẩm. Được thành lập vào năm 1948 bởi Rudolf Dassler ở Herzogenaurach, Đức, Puma đã trở thành một biểu tượng của văn hóa thể thao và thời trang đường phố. Puma chuyên sản xuất và phân phối giày thể thao, quần áo và phụ kiện thể thao, phục vụ cho mọi nhu cầu từ hoạt động thể chất đến thời trang hàng ngày.Puma nổi tiếng với việc thiết kế các sản phẩm mang tính sáng tạo và cá nhân, với các dòng giày và quần áo có kiểu dáng độc đáo và hiện đại.', CAST(N'2024-03-27T11:28:48.070' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[brands] OFF
GO
SET IDENTITY_INSERT [dbo].[cart_items] ON 

INSERT [dbo].[cart_items] ([id], [customer_id], [product_detail_id], [quantity], [is_selected]) VALUES (1, 6, 2, 3, 1)
INSERT [dbo].[cart_items] ([id], [customer_id], [product_detail_id], [quantity], [is_selected]) VALUES (2, 6, 1, 3, 1)
INSERT [dbo].[cart_items] ([id], [customer_id], [product_detail_id], [quantity], [is_selected]) VALUES (3, 6, 8, 1, 1)
SET IDENTITY_INSERT [dbo].[cart_items] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (1, N'Giày  thể thao', N'Giày Sneaker chính là tên gọi chung của các loại giày phục vụ cho mục đích thể thao như: chạy bộ, tập gym,..Đặc điểm của các loại giày sneaker là phần đế được gia công từ chất liệu cao su mềm và phần trên sẽ làm bằng vải hoặc da bạt, vì thế khi đi trên chân rất êm ái và mềm mại.

Sneaker là một tên gọi khác của “giày thể thao” dùng để chỉ các loại giày phục vụ cho vận động thể thao. Tuy trong nhiều môn thể thao chuyên biệt, các mẫu giày không gọi là sneaker.', NULL, NULL, NULL)
INSERT [dbo].[categories] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (2, N'giày đá bóng', N'Giày đá bóng là vật dụng không thể thiếu của các cầu thủ, cho dù đang thi đấu chuyên nghiệp hay phong trào. Ở thuở bình minh của môn thể thao vua, người ta thường sử dụng giày da thật, khá dày và nặng. Cho đến nay, giày dùng trong bóng đá là một thế giới đa dạng với rất nhiều chất liệu và công nghệ khác nhau.', NULL, NULL, NULL)
INSERT [dbo].[categories] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (3, N'Giày Lười', N'Giày lười, cũng được gọi là giày slip-on, là một loại giày mà không cần dây buộc hoặc khóa cài để mang. Thay vào đó, chúng có một phần upper mở rộng, dễ dàng cho người mang đưa chân vào và ra khỏi giày một cách nhanh chóng. Giày lười thường có kiểu dáng đơn giản, không có dây buộc hoặc khóa cài, giúp người mang tiết kiệm thời gian khi mặc và tháo giày. Phần upper của giày lười thường được thiết kế mở rộng với một miếng đệm hoặc đường gân đàn hồi ở phần mắt giày, giúp chúng dễ dàng co giãn để đưa chân vào và ra khỏi giày.', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[colors] ON 

INSERT [dbo].[colors] ([id], [name], [color_code], [created_at], [deleted_at], [updated_at]) VALUES (1, N'Màu xám nâu nhạt.', N'#a49c8e', CAST(N'2024-03-27T02:26:56.070' AS DateTime), NULL, CAST(N'2024-03-27T02:47:26.683' AS DateTime))
INSERT [dbo].[colors] ([id], [name], [color_code], [created_at], [deleted_at], [updated_at]) VALUES (2, N'Màu trắng vàng nhạt.', N'#fefbef', CAST(N'2024-03-27T02:31:16.107' AS DateTime), NULL, CAST(N'2024-03-27T02:48:23.803' AS DateTime))
INSERT [dbo].[colors] ([id], [name], [color_code], [created_at], [deleted_at], [updated_at]) VALUES (3, N'Màu xanh đậm.', N'#455851', CAST(N'2024-03-27T02:35:47.757' AS DateTime), NULL, CAST(N'2024-03-27T02:49:41.747' AS DateTime))
INSERT [dbo].[colors] ([id], [name], [color_code], [created_at], [deleted_at], [updated_at]) VALUES (4, N'Màu đen.', N'#000000', CAST(N'2024-03-27T02:38:36.083' AS DateTime), NULL, CAST(N'2024-03-27T02:49:50.550' AS DateTime))
INSERT [dbo].[colors] ([id], [name], [color_code], [created_at], [deleted_at], [updated_at]) VALUES (5, N'Màu trắng.', N'#FFFFFF', CAST(N'2024-03-27T02:38:48.060' AS DateTime), NULL, CAST(N'2024-03-27T02:49:54.787' AS DateTime))
INSERT [dbo].[colors] ([id], [name], [color_code], [created_at], [deleted_at], [updated_at]) VALUES (6, N'Màu xanh dương đậm.', N'#006964', CAST(N'2024-03-27T02:50:28.957' AS DateTime), NULL, NULL)
INSERT [dbo].[colors] ([id], [name], [color_code], [created_at], [deleted_at], [updated_at]) VALUES (7, N'Màu nâu nhạt pha vàng.', N'#ebd0a2', CAST(N'2024-03-27T02:51:54.887' AS DateTime), NULL, NULL)
INSERT [dbo].[colors] ([id], [name], [color_code], [created_at], [deleted_at], [updated_at]) VALUES (8, N'Màu xám trung bình.', N'#c3c3c3', CAST(N'2024-03-27T02:52:49.287' AS DateTime), NULL, NULL)
INSERT [dbo].[colors] ([id], [name], [color_code], [created_at], [deleted_at], [updated_at]) VALUES (9, N'Màu xanh lam đậm.', N'#1c487c', CAST(N'2024-03-27T02:53:26.900' AS DateTime), NULL, CAST(N'2024-03-27T02:53:56.320' AS DateTime))
INSERT [dbo].[colors] ([id], [name], [color_code], [created_at], [deleted_at], [updated_at]) VALUES (10, N'Màu nâu đậm.', N'#865439', CAST(N'2024-03-27T02:54:52.107' AS DateTime), NULL, NULL)
INSERT [dbo].[colors] ([id], [name], [color_code], [created_at], [deleted_at], [updated_at]) VALUES (11, N'Màu xanh lá cây đậm.', N'#6d9951', CAST(N'2024-03-27T02:55:43.470' AS DateTime), NULL, NULL)
INSERT [dbo].[colors] ([id], [name], [color_code], [created_at], [deleted_at], [updated_at]) VALUES (12, N'Màu tím nhạt đậm.', N'#8a5ca0', CAST(N'2024-03-27T02:56:54.510' AS DateTime), NULL, NULL)
INSERT [dbo].[colors] ([id], [name], [color_code], [created_at], [deleted_at], [updated_at]) VALUES (13, N'Màu hồng đậm.', N'#f1778a', CAST(N'2024-03-27T03:00:09.890' AS DateTime), NULL, NULL)
INSERT [dbo].[colors] ([id], [name], [color_code], [created_at], [deleted_at], [updated_at]) VALUES (14, N'Màu vàng nhạt.', N'#f5d255', CAST(N'2024-03-27T03:00:36.390' AS DateTime), NULL, NULL)
INSERT [dbo].[colors] ([id], [name], [color_code], [created_at], [deleted_at], [updated_at]) VALUES (15, N'Màu cam đậm.', N'#e9662c', CAST(N'2024-03-27T03:01:03.593' AS DateTime), NULL, NULL)
INSERT [dbo].[colors] ([id], [name], [color_code], [created_at], [deleted_at], [updated_at]) VALUES (16, N'Màu đỏ đậm.', N'#c10013', CAST(N'2024-03-27T03:01:39.950' AS DateTime), NULL, CAST(N'2024-03-27T10:28:56.803' AS DateTime))
INSERT [dbo].[colors] ([id], [name], [color_code], [created_at], [deleted_at], [updated_at]) VALUES (17, N'Màu xám đậm.', N'#464646', CAST(N'2024-03-27T03:02:07.040' AS DateTime), NULL, NULL)
INSERT [dbo].[colors] ([id], [name], [color_code], [created_at], [deleted_at], [updated_at]) VALUES (18, N'Màu xanh da trời', N'#00FFFF', CAST(N'2024-03-28T15:25:36.380' AS DateTime), NULL, CAST(N'2024-03-28T18:49:47.673' AS DateTime))
INSERT [dbo].[colors] ([id], [name], [color_code], [created_at], [deleted_at], [updated_at]) VALUES (19, N'Màu tím than', N'#000080', CAST(N'2024-03-28T15:31:34.387' AS DateTime), NULL, CAST(N'2024-03-28T18:49:57.823' AS DateTime))
INSERT [dbo].[colors] ([id], [name], [color_code], [created_at], [deleted_at], [updated_at]) VALUES (20, N'Màu đỏ', N'#FF0000', CAST(N'2024-03-28T18:51:53.050' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[colors] OFF
GO
SET IDENTITY_INSERT [dbo].[forms] ON 

INSERT [dbo].[forms] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (1, N'Low top', N'Low top là một kiểu dáng giày dép hoặc sneaker với phần trên được thiết kế cắt thấp, dưới mắt cá chân. Đặc điểm chính của kiểu dáng này là sự thoải mái và linh hoạt, cho phép người mang dễ dàng di chuyển và cảm thấy thoải mái trong mọi hoạt động. Low top thường có thiết kế đơn giản và dễ kết hợp với nhiều trang phục khác nhau, từ trang phục thể thao đến trang phục hàng ngày. Sự đa dạng về màu sắc và chất liệu của low top giúp chúng trở thành lựa chọn phổ biến trong việc tạo ra phong cách cá nhân và thể hiện phong cách riêng của người mang.', CAST(N'2024-03-27T03:39:43.780' AS DateTime), NULL, CAST(N'2024-03-27T03:44:09.390' AS DateTime))
INSERT [dbo].[forms] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (2, N'High top', N'High top là một kiểu dáng giày dép hoặc sneaker với phần trên được thiết kế cao, thường vượt qua mắt cá chân và bao phủ một phần của chân. Đặc điểm chính của kiểu dáng này là sự hỗ trợ và bảo vệ cho mắt cá chân và khu vực cổ chân, giúp người mang cảm thấy an toàn và ổn định trong mọi hoạt động. High top thường có thiết kế chắc chắn và mạnh mẽ, phù hợp cho việc tham gia các hoạt động thể thao hoặc hoạt động năng động khác. Đồng thời, với sự đa dạng về màu sắc và phong cách, high top cũng có thể là một phần của trang phục thời trang hàng ngày, tạo điểm nhấn cá nhân và phong cách cho người mang.', CAST(N'2024-03-27T03:47:49.860' AS DateTime), NULL, NULL)
INSERT [dbo].[forms] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (3, N'Slip-on ', N'Slip-on là một kiểu dáng giày dép hoặc sneaker không có dây buộc hoặc băng đeo, thiết kế để người mang có thể dễ dàng mang giày mà không cần phải thắt dây. Đặc điểm chính của kiểu dáng này là sự tiện lợi và thoải mái, giúp tiết kiệm thời gian và công sức khi đi lại. Slip-on thường có phần mặt trên linh hoạt và co giãn, tạo cảm giác ôm sát và thoải mái cho đôi chân. Kiểu dáng này thường được ưa chuộng trong các hoạt động hàng ngày, du lịch hoặc khi cần một đôi giày đơn giản và dễ mặc. Với sự đa dạng về kiểu dáng và chất liệu, slip-on có thể phù hợp với nhiều phong cách thời trang và là một lựa chọn phổ biến cho cả nam và nữ.', CAST(N'2024-03-27T03:50:23.787' AS DateTime), NULL, NULL)
INSERT [dbo].[forms] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (4, N'Mid top', N'Mid top là một kiểu dáng giày dép hoặc sneaker với phần trên được thiết kế vừa phải, nằm giữa kiểu dáng low top và high top. Đặc điểm chính của kiểu dáng này là sự kết hợp giữa sự thoải mái của low top và sự hỗ trợ của high top, tạo ra một trải nghiệm mang giày ổn định và linh hoạt. Mid top thường có thiết kế vừa đủ để che phủ phần cổ chân và mắt cá chân, tạo sự bảo vệ và ấm áp, đồng thời vẫn giữ được sự linh hoạt khi di chuyển. Kiểu dáng này thường được ưa chuộng trong việc tham gia các hoạt động thể thao như bóng rổ hoặc skateboarding, đồng thời cũng là một lựa chọn phổ biến cho trang phục thời trang hàng ngày. Với sự đa dạng về màu sắc và kiểu dáng, mid top có thể phản ánh phong cách cá nhân và được ưa chuộng bởi cả nam và nữ', CAST(N'2024-03-27T03:53:24.803' AS DateTime), NULL, NULL)
INSERT [dbo].[forms] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (5, N'Mule', N'Mule là một kiểu dáng giày dép hoặc giày xăng đan mà không có phần phủ ở phía sau gót chân, cho phép gót chân của người mang lộ ra. Đặc điểm chính của kiểu dáng này là sự thoải mái và tiện lợi, khiến cho người mang giày dễ dàng mà không cần phải thắt dây hoặc buộc nút. Mule thường có phần trước che phủ đầy đủ chân và gót chân, mang lại sự ấm áp và bảo vệ cho chân, đồng thời vẫn giữ được sự thoải mái khi di chuyển. Kiểu dáng này thường được ưa chuộng trong mùa hè hoặc trong những dịp gặp gỡ thân mật, và có thể được kết hợp với nhiều trang phục khác nhau từ trang phục hàng ngày đến trang phục dự tiệc. Với sự đa dạng về chất liệu và thiết kế, mule là một lựa chọn phổ biến và thời trang cho cả nam và nữ.', CAST(N'2024-03-27T03:55:38.540' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[forms] OFF
GO
SET IDENTITY_INSERT [dbo].[groups] ON 

INSERT [dbo].[groups] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (1, N'Phiên bản giới hạn.', N'Phiên bản giới hạn là một phiên bản đặc biệt của sản phẩm hoặc dịch vụ được thiết kế với một số lượng hoặc tính năng cụ thể, thường có sự hạn chế về số lượng sản phẩm được sản xuất hoặc số lượng người dùng có thể sử dụng. Phiên bản này được phát hành để tạo ra sự hiếm có và độc đáo, tăng giá trị và sự quan tâm từ người tiêu dùng.', CAST(N'2024-03-27T03:20:09.773' AS DateTime), NULL, CAST(N'2024-03-27T03:25:02.897' AS DateTime))
INSERT [dbo].[groups] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (2, N'Hàng mới về.', N'Hàng mới về là những sản phẩm mới được cập nhật và đưa vào bán hàng gần đây. Đây là những sản phẩm mới từ nhà sản xuất hoặc những mặt hàng mới được nhập khẩu vào cửa hàng. Sự cập nhật hàng mới về thường mang lại sự đa dạng và lựa chọn mới cho khách hàng, từ những xu hướng mới nhất cho đến những sản phẩm tiện ích cần thiết. ', CAST(N'2024-03-27T03:23:16.257' AS DateTime), NULL, NULL)
INSERT [dbo].[groups] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (3, N'Hàng giảm giá', N'Hàng giảm giá là những sản phẩm hoặc hàng hóa được cung cấp với giá bán thấp hơn so với giá ban đầu, thường là do sự giảm giá đặc biệt từ cửa hàng hoặc nhà sản xuất. Các mặt hàng này thường được giảm giá để tăng cơ hội tiêu thụ, loại bỏ hàng tồn kho, hoặc để thu hút sự chú ý từ phía khách hàng. Thông điệp ''Hàng giảm giá'' thường được sử dụng để thu hút sự quan tâm từ người mua và thúc đẩy việc mua sắm, đặc biệt là trong các kỳ bán hàng hoặc sự kiện khuyến mãi. ', CAST(N'2024-03-27T03:30:05.753' AS DateTime), NULL, NULL)
INSERT [dbo].[groups] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (4, N'Online only', N'Online only được sử dụng để chỉ những sản phẩm hoặc dịch vụ chỉ có sẵn để mua qua internet, không có sẵn tại các cửa hàng địa phương hay chi nhánh cụ thể. Các sản phẩm hoặc dịch vụ này thường chỉ có sẵn thông qua trang web của công ty hoặc các nền tảng mua sắm trực tuyến khác. Với thông điệp ''Online only'', khách hàng có thể cảm thấy khích lệ để thăm trang web của doanh nghiệp và khám phá các sản phẩm hoặc dịch vụ độc quyền mà họ không thể tìm thấy ở các cửa hàng truyền thống. Điều này cũng có thể tạo ra một trải nghiệm mua sắm tiện lợi và linh hoạt cho người tiêu dùng, đặc biệt là đối với những người thích mua sắm trực tuyến.', CAST(N'2024-03-27T03:32:57.027' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[groups] OFF
GO
SET IDENTITY_INSERT [dbo].[materials] ON 

INSERT [dbo].[materials] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (1, N'Canvas', N'Canvas là một loại vải được làm từ sợi cotton hoặc các sợi tự nhiên khác, có cấu trúc mật độ cao và bền bỉ. Chất liệu canvas thường được sử dụng để làm các sản phẩm như túi xách, giày dép, và trang trí nội thất do tính linh hoạt và độ bền cao của nó.

Với đặc tính kháng nước và khả năng chịu mài mòn tốt, canvas thường được lựa chọn cho các sản phẩm cần độ bền cao và có thể sử dụng trong nhiều điều kiện khác nhau. Đồng thời, canvas cũng có khả năng thấm hút và thoáng khí tốt, giúp sản phẩm giữ được sự thoải mái và mát mẻ khi sử dụng.

Ngoài ra, canvas có khả năng chịu nhiệt tốt và dễ dàng làm sạch, làm cho nó trở thành một chất liệu phổ biến trong nhiều ứng dụng khác nhau từ trang trí nhà cửa đến trang phục và phụ kiện thời trang. Chất liệu canvas thường mang lại cảm giác gần gũi, thân thiện và năng động, phù hợp cho nhiều đối tượng và phong cách sử dụng.', CAST(N'2024-03-27T05:35:57.027' AS DateTime), NULL, NULL)
INSERT [dbo].[materials] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (2, N'Suede| Da Lộn ', N'
Da lộn, hay còn được gọi là suede, là một loại chất liệu được làm từ bề mặt phía sau của da động vật như da bò, da dê hoặc da lợn. Chất liệu này có cấu trúc mềm mại và mịn màng, tạo cảm giác sang trọng và đẳng cấp khi sử dụng.

Với bề mặt mịn màng và không có lớp sơn phủ, da lộn thường mang lại vẻ đẹp tự nhiên và độ bền cao. Tuy nhiên, do tính chất dễ bị ảnh hưởng bởi nước và bụi bẩn, việc bảo quản và chăm sóc cho sản phẩm là rất quan trọng để giữ cho da lộn luôn mới và đẹp.

Da lộn thường được sử dụng để làm các sản phẩm thời trang như giày dép, túi xách, áo khoác và găng tay. Với vẻ đẹp tự nhiên và phong cách lịch lãm, sản phẩm từ da lộn thường được ưa chuộng trong các bữa tiệc hoặc sự kiện đặc biệt, đồng thời cũng phù hợp cho các hoạt động hàng ngày với sự thoải mái và phong cách.', CAST(N'2024-03-27T05:51:46.373' AS DateTime), NULL, CAST(N'2024-03-27T05:51:58.350' AS DateTime))
INSERT [dbo].[materials] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (3, N'Leather | Da', N'
Da là một trong những chất liệu tự nhiên phổ biến nhất được sử dụng trong sản xuất các sản phẩm thời trang và gia dụng. Chất liệu này được làm từ da của động vật như bò, dê, lợn, và có nhiều loại khác nhau tùy thuộc vào nguồn gốc và xử lý.

Da tự nhiên thường có độ bền cao và tuổi thọ dài, cùng với đó là vẻ đẹp tự nhiên và sang trọng. Đặc tính linh hoạt của da cho phép nó được sử dụng để tạo ra nhiều loại sản phẩm khác nhau từ giày dép, túi xách, áo khoác, ví cầm tay, và nhiều sản phẩm thời trang khác.

Ngoài ra, da cũng có khả năng thích ứng với nhiều loại môi trường và điều kiện sử dụng khác nhau, làm cho nó trở thành một chất liệu ưa chuộng trong nhiều mùa và hoàn cảnh. Tùy thuộc vào cách xử lý và làm mềm, da có thể có nhiều bề mặt khác nhau như da bóng, da mờ, da grain, và da nubuck, mang lại sự đa dạng cho người tiêu dùng khi lựa chọn sản phẩm.', CAST(N'2024-03-27T05:54:06.210' AS DateTime), NULL, NULL)
INSERT [dbo].[materials] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (4, N'Cotton', N'Cotton là một loại chất liệu tự nhiên phổ biến và được sử dụng rộng rãi trong ngành dệt may. Chất liệu này được làm từ sợi bông, được thu hoạch từ cây bông cotton, và có nhiều ưu điểm vượt trội. Với cấu trúc sợi mềm mại và thoáng khí, vải cotton mang lại sự thoải mái cho người mặc, đặc biệt là trong các môi trường nóng. Khả năng hút ẩm tốt giúp vải cotton thấm mồ hôi và làm mát cơ thể, làm cho nó trở thành lựa chọn lý tưởng cho quần áo hàng ngày, đặc biệt trong mùa hè.Với tính linh hoạt và đa dạng trong thiết kế, vải cotton được sử dụng để sản xuất nhiều loại sản phẩm như áo thun, quần áo, giường trải giường và đồ nội thất gia đình. Từ tính chất thoải mái đến khả năng chịu mài mòn và độ bền, Cotton là một chất liệu đa dụng và được ưa chuộng trong ngành thời trang và gia đình.', CAST(N'2024-03-27T05:57:31.480' AS DateTime), NULL, NULL)
INSERT [dbo].[materials] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (5, N'Flannel', N'Vải Flannel là một loại vải mềm mại, có cấu trúc dày và nổi bật với đặc tính giữ ấm tốt, thường được làm từ sợi bông cotton hoặc len. Chất liệu này thường được sử dụng để sản xuất các sản phẩm thời trang và trang trí nhà cửa, đặc biệt là trong các mùa lạnh.

Vải Flannel có bề mặt mềm mại và thoải mái, mang lại cảm giác êm ái và ấm áp khi tiếp xúc với da. Khả năng giữ ấm tốt của nó làm cho vải Flannel trở thành lựa chọn lý tưởng cho các sản phẩm như áo len, áo sơ mi, chăn, và ga trải giường trong mùa đông.

Ngoài ra, vải Flannel cũng dễ dàng chăm sóc và giặt giũ, thường không yêu cầu các biện pháp chăm sóc đặc biệt. Điều này làm cho sản phẩm từ vải Flannel có thể sử dụng lâu dài và giữ được vẻ đẹp ban đầu sau nhiều lần giặt.', CAST(N'2024-03-27T06:03:45.773' AS DateTime), NULL, NULL)
INSERT [dbo].[materials] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (6, N'Corduroy', N'Corduroy là một loại vải có bề mặt phẳng, được tạo thành từ các sợi vải dày và có đường rãnh chạy dọc, tạo ra các đường rãnh mềm mại và đặc trưng. Chất liệu này thường được làm từ cotton hoặc một hỗn hợp của cotton và polyester, và được sử dụng phổ biến trong sản xuất quần áo và trang trí nội thất.

Với cấu trúc dày và có các đường rãnh sâu, corduroy mang lại cảm giác ấm áp và thoải mái khi tiếp xúc với da. Đặc biệt, đường rãnh của corduroy tạo ra một vẻ đẹp và sự phong cách riêng biệt, làm cho sản phẩm từ chất liệu này trở nên độc đáo và thu hút. Với tính năng ấm áp, thoải mái và khả năng chịu mài mòn tốt, corduroy là một chất liệu phổ biến và được ưa chuộng trong việc làm đồng phục và trang trí, đồng thời mang lại sự sang trọng và phong cách cho sản phẩm cuối cùng.', CAST(N'2024-03-27T06:11:20.713' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[materials] OFF
GO
SET IDENTITY_INSERT [dbo].[product_details] ON 

INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (1, 3, 4, 9, 20, N'82587865-07bb-4e03-9b60-d3b322eb_752ee57e31e24725bcdbbd738946fe70.jpg', N'air-jordan-1-mid-shoes-7cdjgS.jpg', N'air-jordan-1-mid-white-shadow-55_c316b3f1f5374e4181c87ec50112b749.jpg', N'air-jordan-1-mid-white-shadow-554725-073-4.jpg', CAST(N'2024-03-27T07:33:30.620' AS DateTime), CAST(N'2024-03-27T07:55:39.750' AS DateTime), NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (2, 4, 4, 9, 15, N'converse.jpg', N'converse-1970s-black-1.jpg', N'ddd2deebe54d7d6b91281256563c7e41.jpg', N'nen-mua-giay-converse-classic-hay-1970s-7.jpg', CAST(N'2024-03-27T08:06:08.190' AS DateTime), CAST(N'2024-03-27T08:09:58.173' AS DateTime), NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (4, 5, 8, 6, 23, N'fb8396-060_38cc6a50713c4c4886d60825f50065c4_1024x1024.jpg', N'nms06548_2a9bba5b637a4c5b8fd27885666886aa_1024x1024.jpg', N'nms06552_e0330337eedc4413a3114f81ac4c1312_1024x1024.jpg', N'nms06553_fc73ab15c0d941baa896caab45d9a983_1024x1024.jpg', CAST(N'2024-03-27T08:32:46.770' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (5, 6, 5, 6, 20, N'162056-5.jpg', N'10_3a8f274bb8654dd181e311c02107ed5e_master.jpg', N'202556355-2.jpg', N'converse-chuck-taylor-all-star-70s-hi-white-162056c-os-girls-2_1_grande.jpg', CAST(N'2024-03-27T08:37:02.490' AS DateTime), CAST(N'2024-03-27T08:41:52.340' AS DateTime), NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (6, 7, 9, 6, 30, N'giay-the-thao-adidas-galaxy-6-shoes-gw4139-mau-xanh-duong-size-42-6454b5f52a5ff-05052023145325.jpg', N'img-6353.jpg', N'gw4139_9_63188d7ba5c543148e93617.jpg', N'adidas-buty-galaxy-6-gw4139-b73f.jpg', CAST(N'2024-03-27T09:57:38.267' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (7, 8, 4, 6, 16, N'giay-vans-authentic-mule-vn0a54f76bt-1.jpg', N'giay-vans-authentic-mule-vn0a54f76bt-4.jpg', N'giay-vans-authentic-mule-vn0a54f76bt-3.jpg', N'giay-vans-authentic-mule-vn0a54f76bt-2.jpg', CAST(N'2024-03-27T10:15:19.720' AS DateTime), CAST(N'2024-03-27T10:16:25.903' AS DateTime), NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (8, 9, 16, 8, 23, N'Air-Jordan-1-Low-Cardinal-Red-Pr.jpg', N'Giay-Jordan-1-low-gym-red-white-553558-611-53.jpg', N'giay-nike-jordan-1-low-gym-red-white-553558-611-mau-trang-do-size-44-5fc62ddc9c21f-01122020184948.jpg', N'nike-air-jordan-1-low-gym-red-553558-611-2_6f186af498c045659f126c312418640d_master-1.jpg', CAST(N'2024-03-27T10:29:31.720' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (9, 10, 2, 8, 26, N'833564-main-002.jpg', N'11231241512.jpg', N'ádasdasdas.jpg', N'sb-janoski-slip-skate-shoes-BxN7w6.jpg', CAST(N'2024-03-27T10:41:49.230' AS DateTime), CAST(N'2024-03-27T10:46:21.157' AS DateTime), NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (10, 11, 7, 6, 40, N'pro_AV00116_1.jpg', N'pro_AV00116_2.jpg', N'pro_AV00116_3.jpg', N'pro_AV00116_4.jpg', CAST(N'2024-03-27T11:00:01.750' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (11, 12, 13, 5, 50, N'Pro_AV00155_1.jpg', N'Pro_AV00155_2.jpg', N'Pro_AV00155_3.jpg', N'Pro_AV00155_4.jpg', CAST(N'2024-03-27T11:08:05.180' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (12, 13, 9, 5, 17, N'0021831_adidas-x-crazyfast-3-tf-marine-rush-xanh-duongtrang-id9338.jpg', N'0021833_adidas-x-crazyfast-3-tf-marine-rush-xanh-duongtrang-id9338.jpg', N'0021834_adidas-x-crazyfast-3-tf-marine-rush-xanh-duongtrang-id9338.jpg', N'0021836_adidas-x-crazyfast-3-tf-marine-rush-xanh-duongtrang-id9338.jpg', CAST(N'2024-03-27T11:20:04.590' AS DateTime), CAST(N'2024-03-27T11:21:03.403' AS DateTime), NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (13, 14, 4, 5, 60, N'01_374915_1_b622d15c43ee4f2e85180cbb5b850fd3.jpg', N'01_374915_6_930a29af0f72456fb48a3687764dc2ff.jpg', N'01_374915_2_d09fa0ccaca04aa48b06a73238cb9bd0.jpg', N'01_374915_5_1d3f12ca2cab4a86af5ce80bc873b494.jpg', CAST(N'2024-03-27T11:31:36.443' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (14, 3, 4, 8, 20, N'82587865-07bb-4e03-9b60-d3b322eb_752ee57e31e24725bcdbbd738946fe70.jpg', N'air-jordan-1-mid-shoes-7cdjgS.jpg', N'air-jordan-1-mid-white-shadow-55_c316b3f1f5374e4181c87ec50112b749.jpg', N'air-jordan-1-mid-white-shadow-554725-073-4.jpg', CAST(N'2024-03-27T07:33:30.620' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (15, 3, 4, 7, 20, N'82587865-07bb-4e03-9b60-d3b322eb_752ee57e31e24725bcdbbd738946fe70.jpg', N'air-jordan-1-mid-shoes-7cdjgS.jpg', N'air-jordan-1-mid-shoes-7cdjgS.jpg', N'air-jordan-1-mid-white-shadow-554725-073-4.jpg', CAST(N'2024-03-27T07:33:30.620' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (16, 3, 4, 6, 20, N'82587865-07bb-4e03-9b60-d3b322eb_752ee57e31e24725bcdbbd738946fe70.jpg', N'air-jordan-1-mid-shoes-7cdjgS.jpg', N'air-jordan-1-mid-shoes-7cdjgS.jpg', N'air-jordan-1-mid-white-shadow-554725-073-4.jpg', CAST(N'2024-03-27T07:33:30.620' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (17, 3, 4, 5, 20, N'82587865-07bb-4e03-9b60-d3b322eb_752ee57e31e24725bcdbbd738946fe70.jpg', N'air-jordan-1-mid-shoes-7cdjgS.jpg', N'air-jordan-1-mid-shoes-7cdjgS.jpg', N'air-jordan-1-mid-white-shadow-554725-073-4.jpg', CAST(N'2024-03-27T07:33:30.620' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (18, 3, 4, 4, 20, N'82587865-07bb-4e03-9b60-d3b322eb_752ee57e31e24725bcdbbd738946fe70.jpg', N'air-jordan-1-mid-shoes-7cdjgS.jpg', N'air-jordan-1-mid-shoes-7cdjgS.jpg', N'air-jordan-1-mid-white-shadow-554725-073-4.jpg', CAST(N'2024-03-27T07:33:30.620' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (19, 3, 5, 9, 30, N'joiuoijoi0.jpg', N'air_jordan_1_mid_triple_white_1695293304_65244c05_progressive.jpg', N'2429___hypebeast_com_image_2017_04_the_air_jordan_1_mid_goes_triple_white_1_81c548c798e04fe693a766ce8ff95674_master.jpg', N'imagjordan1231es.jpg', CAST(N'2024-03-28T18:30:50.357' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (20, 3, 5, 8, 30, N'joiuoijoi0.jpg', N'air_jordan_1_mid_triple_white_1695293304_65244c05_progressive.jpg', N'2429___hypebeast_com_image_2017_04_the_air_jordan_1_mid_goes_triple_white_1_81c548c798e04fe693a766ce8ff95674_master.jpg', N'imagjordan1231es.jpg', CAST(N'2024-03-28T18:33:56.527' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (21, 3, 5, 7, 30, N'joiuoijoi0.jpg', N'air_jordan_1_mid_triple_white_1695293304_65244c05_progressive.jpg', N'2429___hypebeast_com_image_2017_04_the_air_jordan_1_mid_goes_triple_white_1_81c548c798e04fe693a766ce8ff95674_master.jpg', N'imagjordan1231es.jpg', CAST(N'2024-03-28T18:34:24.160' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (22, 3, 5, 6, 30, N'joiuoijoi0.jpg', N'air_jordan_1_mid_triple_white_1695293304_65244c05_progressive.jpg', N'2429___hypebeast_com_image_2017_04_the_air_jordan_1_mid_goes_triple_white_1_81c548c798e04fe693a766ce8ff95674_master.jpg', N'imagjordan1231es.jpg', CAST(N'2024-03-28T18:35:44.767' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (23, 3, 5, 5, 30, N'joiuoijoi0.jpg', N'air_jordan_1_mid_triple_white_1695293304_65244c05_progressive.jpg', N'2429___hypebeast_com_image_2017_04_the_air_jordan_1_mid_goes_triple_white_1_81c548c798e04fe693a766ce8ff95674_master.jpg', N'imagjordan1231es.jpg', CAST(N'2024-03-28T18:38:08.803' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (24, 3, 5, 2, 40, N'joiuoijoi0.jpg', N'air_jordan_1_mid_triple_white_1695293304_65244c05_progressive.jpg', N'2429___hypebeast_com_image_2017_04_the_air_jordan_1_mid_goes_triple_white_1_81c548c798e04fe693a766ce8ff95674_master.jpg', N'imagjordan1231es.jpg', CAST(N'2024-03-28T18:39:16.163' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (25, 4, 4, 8, 20, N'converse.jpg', N'converse-1970s-black-1.jpg', N'ddd2deebe54d7d6b91281256563c7e41.jpg', N'nen-mua-giay-converse-classic-hay-1970s-7.jpg', CAST(N'2024-03-28T18:41:21.940' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (26, 4, 4, 7, 30, N'converse.jpg', N'converse-1970s-black-1.jpg', N'ddd2deebe54d7d6b91281256563c7e41.jpg', N'nen-mua-giay-converse-classic-hay-1970s-7.jpg', CAST(N'2024-03-28T18:44:44.473' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (27, 4, 4, 6, 0, N'converse.jpg', N'converse-1970s-black-1.jpg', N'ddd2deebe54d7d6b91281256563c7e41.jpg', N'nen-mua-giay-converse-classic-hay-1970s-7.jpg', CAST(N'2024-03-28T18:45:34.340' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (28, 4, 4, 5, 30, N'converse.jpg', N'converse-1970s-black-1.jpg', N'ddd2deebe54d7d6b91281256563c7e41.jpg', N'nen-mua-giay-converse-classic-hay-1970s-7.jpg', CAST(N'2024-03-28T18:46:24.607' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (29, 4, 4, 4, 30, N'converse.jpg', N'converse-1970s-black-1.jpg', N'ddd2deebe54d7d6b91281256563c7e41.jpg', N'nen-mua-giay-converse-classic-hay-1970s-7.jpg', CAST(N'2024-03-28T18:47:19.040' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (30, 5, 8, 9, 30, N'fb8396-060_38cc6a50713c4c4886d60825f50065c4_1024x1024.jpg', N'nms06548_2a9bba5b637a4c5b8fd27885666886aa_1024x1024.jpg', N'nms06552_e0330337eedc4413a3114f81ac4c1312_1024x1024.jpg', N'nms06553_fc73ab15c0d941baa896caab45d9a983_1024x1024.jpg', CAST(N'2024-03-28T18:59:41.660' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (31, 5, 8, 8, 10, N'fb8396-060_38cc6a50713c4c4886d60825f50065c4_1024x1024.jpg', N'nms06548_2a9bba5b637a4c5b8fd27885666886aa_1024x1024.jpg', N'nms06552_e0330337eedc4413a3114f81ac4c1312_1024x1024.jpg', N'nms06553_fc73ab15c0d941baa896caab45d9a983_1024x1024.jpg', CAST(N'2024-03-28T19:01:26.163' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (32, 5, 8, 7, 30, N'fb8396-060_38cc6a50713c4c4886d60825f50065c4_1024x1024.jpg', N'nms06548_2a9bba5b637a4c5b8fd27885666886aa_1024x1024.jpg', N'nms06552_e0330337eedc4413a3114f81ac4c1312_1024x1024.jpg', N'nms06553_fc73ab15c0d941baa896caab45d9a983_1024x1024.jpg', CAST(N'2024-03-28T19:02:09.010' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (33, 5, 8, 4, 15, N'fb8396-060_38cc6a50713c4c4886d60825f50065c4_1024x1024.jpg', N'nms06548_2a9bba5b637a4c5b8fd27885666886aa_1024x1024.jpg', N'nms06552_e0330337eedc4413a3114f81ac4c1312_1024x1024.jpg', N'nms06553_fc73ab15c0d941baa896caab45d9a983_1024x1024.jpg', CAST(N'2024-03-28T19:02:48.607' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (34, 6, 5, 7, 20, N'162056-5.jpg', N'10_3a8f274bb8654dd181e311c02107ed5e_master.jpg', N'202556355-2.jpg', N'converse-chuck-taylor-all-star-70s-hi-white-162056c-os-girls-2_1_grande.jpg', CAST(N'2024-03-28T19:02:48.607' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (35, 6, 5, 8, 20, N'162056-5.jpg', N'10_3a8f274bb8654dd181e311c02107ed5e_master.jpg', N'202556355-2.jpg', N'converse-chuck-taylor-all-star-70s-hi-white-162056c-os-girls-2_1_grande.jpg', CAST(N'2024-03-28T19:02:48.607' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (36, 6, 5, 9, 20, N'162056-5.jpg', N'10_3a8f274bb8654dd181e311c02107ed5e_master.jpg', N'202556355-2.jpg', N'converse-chuck-taylor-all-star-70s-hi-white-162056c-os-girls-2_1_grande.jpg', CAST(N'2024-03-28T19:02:48.607' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (37, 6, 5, 5, 15, N'162056-5.jpg', N'10_3a8f274bb8654dd181e311c02107ed5e_master.jpg', N'202556355-2.jpg', N'converse-chuck-taylor-all-star-70s-hi-white-162056c-os-girls-2_1_grande.jpg', CAST(N'2024-03-28T19:02:48.607' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (38, 5, 18, 9, 20, N'0021784_nike-zoom-mercurial-vapor-15-academy-tf-xanh-lo-tim-dj5635-300.jpg', N'0021785_nike-zoom-mercurial-vapor-15-academy-tf-xanh-lo-tim-dj5635-300.jpg', N'0021788_nike-zoom-mercurial-vapor-15-academy-tf-xanh-lo-tim-dj5635-300.jpg', N'0022077_nike-zoom-mercurial-vapor-15-academy-tf-xanh-lo-tim-dj5635-300.jpg', CAST(N'2024-03-28T19:07:07.517' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (39, 5, 18, 8, NULL, N'0021784_nike-zoom-mercurial-vapor-15-academy-tf-xanh-lo-tim-dj5635-300.jpg', N'0021785_nike-zoom-mercurial-vapor-15-academy-tf-xanh-lo-tim-dj5635-300.jpg', N'0021788_nike-zoom-mercurial-vapor-15-academy-tf-xanh-lo-tim-dj5635-300.jpg', N'0022077_nike-zoom-mercurial-vapor-15-academy-tf-xanh-lo-tim-dj5635-300.jpg', CAST(N'2024-03-28T19:07:07.517' AS DateTime), CAST(N'2024-03-28T19:14:47.967' AS DateTime), NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (40, 5, 18, 7, 35, N'0021784_nike-zoom-mercurial-vapor-15-academy-tf-xanh-lo-tim-dj5635-300.jpg', N'0021785_nike-zoom-mercurial-vapor-15-academy-tf-xanh-lo-tim-dj5635-300.jpg', N'0021788_nike-zoom-mercurial-vapor-15-academy-tf-xanh-lo-tim-dj5635-300.jpg', N'0022077_nike-zoom-mercurial-vapor-15-academy-tf-xanh-lo-tim-dj5635-300.jpg', CAST(N'2024-03-28T19:07:07.517' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (41, 5, 18, 6, 46, N'0021784_nike-zoom-mercurial-vapor-15-academy-tf-xanh-lo-tim-dj5635-300.jpg', N'0021785_nike-zoom-mercurial-vapor-15-academy-tf-xanh-lo-tim-dj5635-300.jpg', N'0021788_nike-zoom-mercurial-vapor-15-academy-tf-xanh-lo-tim-dj5635-300.jpg', N'0022077_nike-zoom-mercurial-vapor-15-academy-tf-xanh-lo-tim-dj5635-300.jpg', CAST(N'2024-03-28T19:07:07.517' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (42, 5, 20, 3, 20, N'0022140_nike-zoom-mercurial-vapor-15-academy-tf-mds-7-docam-fd1168-600.jpg', N'0022142_nike-zoom-mercurial-vapor-15-academy-tf-mds-7-docam-fd1168-600.jpg', N'0022144_nike-zoom-mercurial-vapor-15-academy-tf-mds-7-docam-fd1168-600.jpg', N'0022721_nike-zoom-mercurial-vapor-15-academy-tf-mds-7-docam-fd1168-600.jpg', CAST(N'2024-03-28T19:16:10.357' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (43, 5, 20, 4, 21, N'0022140_nike-zoom-mercurial-vapor-15-academy-tf-mds-7-docam-fd1168-600.jpg', N'0022142_nike-zoom-mercurial-vapor-15-academy-tf-mds-7-docam-fd1168-600.jpg', N'0022144_nike-zoom-mercurial-vapor-15-academy-tf-mds-7-docam-fd1168-600.jpg', N'0022721_nike-zoom-mercurial-vapor-15-academy-tf-mds-7-docam-fd1168-600.jpg', CAST(N'2024-03-28T19:16:10.357' AS DateTime), NULL, NULL)
INSERT [dbo].[product_details] ([id], [product_id], [color_id], [size_id], [inventory_number], [image_url_1], [image_url_2], [image_url_3], [image_url_4], [created_at], [edited_at], [deleted_at]) VALUES (44, 5, 20, 5, 43, N'0022140_nike-zoom-mercurial-vapor-15-academy-tf-mds-7-docam-fd1168-600.jpg', N'0022142_nike-zoom-mercurial-vapor-15-academy-tf-mds-7-docam-fd1168-600.jpg', N'0022144_nike-zoom-mercurial-vapor-15-academy-tf-mds-7-docam-fd1168-600.jpg', N'0022721_nike-zoom-mercurial-vapor-15-academy-tf-mds-7-docam-fd1168-600.jpg', CAST(N'2024-03-28T19:16:10.357' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[product_details] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [code], [name], [description], [price], [category_id], [form_id], [brand_id], [material_id], [group_id], [created_at], [edited_at], [deleted_at]) VALUES (3, N'NAJ01M-HT', N'Nike Air Jordan 1 Mid High Top', N'Nike Air Jordan 1 Mid là một phiên bản giữa của dòng giày Air Jordan 1 huyền thoại của Nike, được phát triển bởi ngôi sao bóng rổ Michael Jordan và ra mắt lần đầu vào năm 1985. Được thiết kế để mang lại sự kết hợp hoàn hảo giữa phong cách và hiệu suất, Air Jordan 1 Mid là một biểu tượng về sự đẳng cấp và phong cách đường phố.

Với kiểu dáng mid-top, Air Jordan 1 Mid cung cấp sự hỗ trợ vừa phải cho cổ chân và đồng thời giữ được vẻ đẹp cổ điển và độc đáo của dòng giày Jordan. Phần upper của giày thường được làm từ da hoặc các vật liệu tổng hợp, cùng với các chi tiết đặc trưng như swoosh logo của Nike và logo Jumpman của Air Jordan trên thân giày.

Đế giày của Air Jordan 1 Mid thường được thiết kế với công nghệ đệm Air hoặc foam để tăng cường sự thoải mái và đàn hồi, đồng thời cung cấp sự ổn định và độ bám tốt trên mọi bề mặt.

Với một loạt các biến thể màu sắc và phiên bản hợp tác, Air Jordan 1 Mid mang lại nhiều lựa chọn cho người sử dụng, từ phong cách cổ điển và thanh lịch cho đến các phiên bản phong cách đường phố và hiện đại.', 2300000, 1, 4, 1, 3, 2, CAST(N'2024-03-27T06:42:15.457' AS DateTime), CAST(N'2024-03-27T10:01:09.617' AS DateTime), NULL)
INSERT [dbo].[products] ([id], [code], [name], [description], [price], [category_id], [form_id], [brand_id], [material_id], [group_id], [created_at], [edited_at], [deleted_at]) VALUES (4, N'CCT1970B', N'Converse Chuck Taylor 1970 Black', N'Converse Chuck Taylor ''70 là một phiên bản nâng cấp của dòng giày Chuck Taylor All Star kinh điển của Converse, mang lại sự kết hợp hoàn hảo giữa phong cách cổ điển và hiện đại. Được ra mắt lần đầu vào năm 1970, Chuck Taylor ''70 đã trở thành một biểu tượng trong thế giới giày dép và văn hóa đường phố.

Với kiểu dáng high-top hoặc low-top, Chuck Taylor ''70 giữ lại các đặc điểm cơ bản của dòng Chuck Taylor gốc như đế cao su, phần upper canvas và logo Converse trên bảng mũi giày. Tuy nhiên, phiên bản này được cải tiến với một số điểm nhấn như độ dày tăng cường, chất liệu canvas chất lượng cao hơn và các chi tiết chắc chắn hơn, tạo ra cảm giác bền bỉ và chất lượng tốt hơn.

Đế giày của Chuck Taylor ''70 thường được thiết kế với lớp đệm EVA hoặc OrthoLite để cung cấp sự thoải mái và hỗ trợ tốt hơn cho đôi chân, đồng thời giữ lại vẻ đẹp cổ điển của dòng giày này.

Với một loạt các biến thể màu sắc và thiết kế độc đáo, Chuck Taylor ''70 là một lựa chọn phổ biến cho những người yêu thích phong cách đường phố và cá nhân. Dễ dàng kết hợp với nhiều loại trang phục khác nhau, từ quần jeans đến váy hoặc quần short, Chuck Taylor ''70 mang lại sự phong cách và sự tự tin cho người mang.', 2000000, 1, 2, 2, 1, 2, CAST(N'2024-03-27T07:19:59.483' AS DateTime), CAST(N'2024-03-27T10:01:49.967' AS DateTime), NULL)
INSERT [dbo].[products] ([id], [code], [name], [description], [price], [category_id], [form_id], [brand_id], [material_id], [group_id], [created_at], [edited_at], [deleted_at]) VALUES (5, N'NAZMV15', N'Nike Air Zoom Mercurial Vapor 15', N'Mercurial là dòng giày có tuổi đời dài thứ hai trong lịch sử Nike, chỉ đứng sau dòng giày Tiempo. Trong năm kỷ niệm 25 năm, hãng đã cho ra mắt phiên bản giới hạn Air Zoom Mercurial XXV với số lượng chỉ 2.500 đôi trên toàn thế giới, nhanh chóng nhận được sự quan tâm và yêu thích. Nike Air Zoom Mercurial Vapor 15 Academy TF XXV - Metallic Silver/Volt/Black là mẫu giày phổ thông phiên bản cổ cao dành cho sân cỏ nhân taọ 5-7 người. 

Chất liệu da tổng hợp NikeSkin mới được xử lý trở nên mềm và tăng tối đa khả năng cảm giác bóng cho người chơi.

Cổ giày rời dễ chịu thoải mái, hỗ trợ người chơi có form chân bè dễ dàng mang vào.

Phần đế đệm Airzoom êm ái và hạn chế phản lực bề mặt sân nhân tạo cứng tác động lên cổ chân và đầu gối.

Khuôn đế Nike Grind được tái chế từ rác nhựa nằm trong dự án loại bỏ sự lãng phí, khép lại vòng đời của sản phẩm nike bảo vệ môi trường. ', 1650000, 2, 1, 1, 2, 3, CAST(N'2024-03-27T08:26:34.893' AS DateTime), CAST(N'2024-03-27T10:03:03.380' AS DateTime), NULL)
INSERT [dbo].[products] ([id], [code], [name], [description], [price], [category_id], [form_id], [brand_id], [material_id], [group_id], [created_at], [edited_at], [deleted_at]) VALUES (6, N'CCT1970W', N'Converse Chuck Taylor 70 White', N'Converse Chuck Taylor ''70 là một phiên bản nâng cấp của dòng giày Chuck Taylor All Star kinh điển của Converse, mang lại sự kết hợp hoàn hảo giữa phong cách cổ điển và hiện đại. Được ra mắt lần đầu vào năm 1970, Chuck Taylor ''70 đã trở thành một biểu tượng trong thế giới giày dép và văn hóa đường phố.
', 2000000, 1, 2, 2, 1, 2, CAST(N'2024-03-27T08:40:59.463' AS DateTime), CAST(N'2024-03-27T10:02:23.940' AS DateTime), NULL)
INSERT [dbo].[products] ([id], [code], [name], [description], [price], [category_id], [form_id], [brand_id], [material_id], [group_id], [created_at], [edited_at], [deleted_at]) VALUES (7, N'AG-6 COTTON', N'Adidas Galaxy 6 - Cotton', N'Xỏ giày và xuất phát. Đôi giày chạy bộ adidas này sẽ giúp bạn luôn thoải mái dẫu cho ngày mới kéo dài vô tận. Đây là một đôi giày hàng ngày tuyệt vời, với thân giày bằng vải lưới siêu nhẹ và thoáng khí giúp đôi chân bạn luôn mát mẻ, cùng đế giữa Cloudfoam đàn hồi. Đế ngoài bằng cao su bám vững vàng trên mọi bề mặt, từ sân cỏ ẩm ướt tới sân đất nện. Bạn có thể thoải mái thay đổi kế hoạch mà không cần đổi giày.

Làm từ một loạt chất liệu tái chế, thân giày có chứa tối thiểu 50% thành phần tái chế. Sản phẩm này đại diện cho một trong số rất nhiều các giải pháp của chúng tôi hướng tới chấm dứt rác thải nhựa.', 1500000, 1, 1, 3, 4, 1, CAST(N'2024-03-27T09:51:58.503' AS DateTime), CAST(N'2024-03-27T10:04:34.127' AS DateTime), NULL)
INSERT [dbo].[products] ([id], [code], [name], [description], [price], [category_id], [form_id], [brand_id], [material_id], [group_id], [created_at], [edited_at], [deleted_at]) VALUES (8, N'VAMB-01V', N'Vans Authentic Mule Black- 01V', N'Nắm bắt làn sóng giày đạp gót, Vans Authentic Mule mang đến sự hiện đại với ngọai hình mới lạ, hợp thời được thiết kế dựa trên hình bóng của đôi giày mang tính di sản. Vẫn như những đôi Authentic khác, đôi giày này cũng có vẻ ngoài trẻ trung, năng động với kiểu dáng thấp cổ cùng phần dây thắt như những đôi Sneaker khác. Ngoài ra, phần đệm Ortholite cao cấp, êm ái với nhiều lỗ thoát khí tạo sự thông thoáng khi mang cũng như tạo cảm giác dễ chịu ngay cả khi vận động mạnh, mặt đế Waffle cổ điển kết hợp với đế ngoài bằng cao su màu trắng cùng đường viền đặc trưng xung quanh để đảm bảo vẫn duy trì độ bám và độ bền vốn nổi tiếng của Vans. Điểm khác biệt duy nhất ở đôi mule này chính là phần gót được cắt thấp đi so với ban đầu để người mang có thể dễ dàng xỏ vào và trông như đang đạp gót mà không hề làm mất đi form dáng của đôi giày. Đôi giày với phần gót thấp mang lại sự nhanh chóng khi mang xỏ, đồng thời giúp thông thoáng phần cổ chân cho bạn cảm giác thoải mái hơn. Bên cạnh đó, gót giày thấp còn không kém phần thời trang, và dễ dàng ứng dụng cho nhiều trường hợp khác nhau. Cuối cùng hoàn thiện cho thiết kế chính là phần màu sắc cơ bản chỉ là một gam màu nguyên bản để bạn tự do mix – match kết hợp với tem nhãn logo được đính ở các vị trí tiêu chuẩn, vừa tạo điểm nhấn vừa tăng nhận diện thương hiệu. Với sự kết hợp của tính tiện lợi và phong cách, đôi giày chính là mảnh ghép tô điểm cho phong cách của bạn thêm sống động.', 1000000, 3, 5, 4, 4, 3, CAST(N'2024-03-27T10:14:34.210' AS DateTime), CAST(N'2024-03-27T10:36:26.873' AS DateTime), NULL)
INSERT [dbo].[products] ([id], [code], [name], [description], [price], [category_id], [form_id], [brand_id], [material_id], [group_id], [created_at], [edited_at], [deleted_at]) VALUES (9, N'NAJ1L-GR', N'Nike Air Jordan 1 Low – Gym Red', N'Nike Air Jordan 1 Low - Gym Red là một phiên bản thấp hơn của biến thể kinh điển Air Jordan 1, được ra mắt lần đầu vào năm 1985. Được thiết kế với màu sắc rực rỡ và phong cách cá tính, phiên bản này mang đến sự kết hợp hoàn hảo giữa hiệu suất và phong cách đường phố.Air Jordan 1 Low có kiểu dáng thấp hơn so với phiên bản cao cổ, mang lại sự linh hoạt và thoải mái cho người mang, đồng thời tạo ra vẻ đẹp tinh tế và hiện đại."Gym Red" là một màu đỏ rực rỡ, là điểm nhấn chính của thiết kế, tạo nên vẻ nổi bật và đầy sức sống cho đôi giày.', 5000000, 1, 1, 1, 3, 3, CAST(N'2024-03-27T10:28:39.957' AS DateTime), NULL, NULL)
INSERT [dbo].[products] ([id], [code], [name], [description], [price], [category_id], [form_id], [brand_id], [material_id], [group_id], [created_at], [edited_at], [deleted_at]) VALUES (10, N'NSBJS', N'Nike SB Janoski+ Slip on', N'Nike SB Janoski+ Slip là một phiên bản slip-on của dòng giày skateboarding Nike SB Janoski, được thiết kế để mang lại sự tiện lợi và thoải mái cho người mang.  Nike SB Janoski+ Slip có kiểu dáng slip-on không cần dây buộc, giúp người mang dễ dàng đưa chân vào và ra khỏi giày một cách nhanh chóng và tiện lợi. Phần upper của giày thường được làm từ vật liệu canvas hoặc suede chất lượng cao, mang lại sự thoải mái và độ bền bỉ cho đôi chân.', 2499000, 3, 3, 1, 4, 3, CAST(N'2024-03-27T10:39:44.420' AS DateTime), NULL, NULL)
INSERT [dbo].[products] ([id], [code], [name], [description], [price], [category_id], [form_id], [brand_id], [material_id], [group_id], [created_at], [edited_at], [deleted_at]) VALUES (11, N'VF-LT-C', N'VINTAS FLANNEL - LOW TOP - CEMENT', N'Khoác lên thân giày một lớp áo mới theo đúng nghĩa đen với thiết kế đánh dấu sự xuất hiện lần đầu tiên của chất vải Flannel trên các dáng sản phẩm quen thuộc từ Ananas. Phát huy những ưu điểm thoải mái và bền bỉ từ chất vải Flannel “vạn người mê”, song hành cùng phối màu trầm ấm đặc trưng, Vintas Flannel Pack là lựa chọn thú vị dành cho những bạn trẻ ái mộ phong cách điềm đạm chững chạc nhưng vẫn đầy sức hút.', 690000, 1, 1, 5, 5, 4, CAST(N'2024-03-27T10:58:28.193' AS DateTime), NULL, NULL)
INSERT [dbo].[products] ([id], [code], [name], [description], [price], [category_id], [form_id], [brand_id], [material_id], [group_id], [created_at], [edited_at], [deleted_at]) VALUES (12, N'VSP-HT-RV', N'VINTAS SODA POP - HIGH TOP - RED VIOLET', N'Kết hợp giữa chất liệu corduroy cộng với màu đỏ đậm mang đầy nét cá tính. Mẫu sản phẩm này được rất nhiều bạn trẻ ở Việt Nam ưa chuộng. Kiểu dáng high top có kết hợp được với đa dạng quần áo, từ đó các bạn trẻ rất tin dùng mẫu giày này', 720000, 1, 2, 5, 6, 4, CAST(N'2024-03-27T11:06:45.583' AS DateTime), NULL, NULL)
INSERT [dbo].[products] ([id], [code], [name], [description], [price], [category_id], [form_id], [brand_id], [material_id], [group_id], [created_at], [edited_at], [deleted_at]) VALUES (13, N'AXC-3TFMR', N'Adidas X Crazyfast .3 TF Marine Rush', N'adidas X Crazyfast vẫn là mẫu giày dành cho các cầu thủ đam mê tốc độ. Đây là một bản nâng cấp dựa trên những thế hệ đi trước, cụ thể là phần trên giống với X Speeddflow trong khi phần đế giữ nguyên của X speedportal. Giày bóng đá adidas X Crazyfast .3 TF Marine Rush - Xanh Dương/Trắng - ID9338 chuyên sử dụng cho sân cỏ nhân tạo 5-7 người được ra mắt trong bộ sưu tập "Marine Rush" nổi bật với lớp áo màu xanh lam. Hoàn thiện đôi giày với nhãn hiệu Three Stripe 3 sọc màu trắng ở mặt bên thân giày.Phần thân giày được làm từ chất liệu vải vệt được phủ một lớp vật liệu có chứa tối thiểu 50% là thành phần tái chế, phần chất liệu này có độ co dãn tốt nhưng không kém phần mềm mại giúp vừa vặn với nhiều kiểu chân (chân hơi bè và chân thon).', 1599000, 2, 1, 3, 2, 3, CAST(N'2024-03-27T11:19:31.393' AS DateTime), NULL, NULL)
INSERT [dbo].[products] ([id], [code], [name], [description], [price], [category_id], [form_id], [brand_id], [material_id], [group_id], [created_at], [edited_at], [deleted_at]) VALUES (14, N'SCXXIT', N'Suede Classic XXI Trainers', N'Giày sneakers Suede Classic XXI Trainers xuất hiện vào năm 1968 và đã thay đổi cuộc chơi kể từ đó. Bật mí cho bạn, Suede Classic XXI Trainers đã được sử dụng bởi những tượng đài của mọi thế hệ và vẫn giữ nguyên phong cách cổ điển cho đến tận bây giờ. Hiện nay, đôi giày vẫn tiếp tục phát triển và được ưa chuộng bởi đông đảo quần chúng. Chính vì thế, bạn có thể cảm nhận được hơi thở của lịch sử khi mang đôi giày này trên chân.', 2499000, 1, 1, 6, 4, 1, CAST(N'2024-03-27T11:30:02.010' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[sizes] ON 

INSERT [dbo].[sizes] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (1, N'35', N'Kích thước "35" là một kích thước chuẩn được sử dụng để đo kích thước của giày hoặc dép, thường được áp dụng trong hệ thống kích thước châu Âu. Đây là một kích thước nhỏ, thường được liên kết với kích thước giày hoặc dép dành cho trẻ em hoặc người lớn có chân nhỏ, kích thước "35" thường tương đương với kích thước giày hoặc dép nhỏ, phù hợp với chân có chiều dài khoảng 21.6 cm hoặc ít hơn.Kích thước này thường được sản xuất và bán lẻ để đảm bảo rằng người mua có thể tìm thấy kích thước phù hợp và thoải mái cho đôi chân của mình.', CAST(N'2024-03-27T04:41:00.693' AS DateTime), NULL, CAST(N'2024-03-27T04:59:17.753' AS DateTime))
INSERT [dbo].[sizes] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (2, N'36', N'Kích thước "36" là một kích thước chuẩn được sử dụng để đo kích thước của giày hoặc dép, thường được áp dụng trong hệ thống kích thước châu Âu. Đây là một kích thước nhỏ đến vừa, thường phù hợp với chân có chiều dài khoảng 22.2 cm.Kích thước này thường được sản xuất và bán lẻ để đảm bảo rằng người mua có thể tìm thấy kích thước phù hợp và thoải mái cho đôi chân của mình.', CAST(N'2024-03-27T04:44:43.613' AS DateTime), NULL, CAST(N'2024-03-27T04:47:35.070' AS DateTime))
INSERT [dbo].[sizes] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (3, N'37', N'Kích thước "37" là một kích thước chuẩn được sử dụng để đo kích thước của giày hoặc dép, thường được áp dụng trong hệ thống kích thước châu Âu. Đây là một kích thước nhỏ đến vừa, thường phù hợp với chân có chiều dài khoảng 22.8 cm. Kích thước này thường được sản xuất và bán lẻ để đảm bảo rằng người mua có thể tìm thấy kích thước phù hợp và thoải mái cho đôi chân của mình.', CAST(N'2024-03-27T04:46:30.843' AS DateTime), NULL, NULL)
INSERT [dbo].[sizes] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (4, N'38', N'Kích thước "38" là một trong những kích thước chuẩn được sử dụng để đo kích thước của giày hoặc dép, thường áp dụng trong hệ thống kích thước châu Âu và nhiều quốc gia khác trên thế giới. Đây là một kích thước trung bình, phổ biến cho cả nam và nữ, thường phù hợp với chân có chiều dài khoảng 23.5 cm.Kích thước "38" thường được sản xuất và bán lẻ với sự đa dạng về kiểu dáng, chất liệu và thiết kế, đảm bảo rằng người mua có thể tìm thấy kích thước phù hợp và thoải mái cho đôi chân của mình, và cung cấp một lựa chọn phù hợp cho nhu cầu và phong cách cá nhân của họ.', CAST(N'2024-03-27T04:51:22.593' AS DateTime), NULL, NULL)
INSERT [dbo].[sizes] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (5, N'39', N'Kích thước "39" là một trong những kích thước chuẩn được sử dụng để đo kích thước của giày hoặc dép, thường áp dụng trong hệ thống kích thước châu Âu và nhiều quốc gia khác trên thế giới. Đây là một kích thước trung bình, phổ biến cho cả nam và nữ, thường phù hợp với chân có chiều dài khoảng 24 cm.Kích thước "39" thường được sản xuất và bán lẻ với sự đa dạng về kiểu dáng, chất liệu và thiết kế, đảm bảo rằng người mua có thể tìm thấy kích thước phù hợp và thoải mái cho đôi chân của mình, và cung cấp một lựa chọn phù hợp cho nhu cầu và phong cách cá nhân của họ.', CAST(N'2024-03-27T04:53:47.260' AS DateTime), NULL, NULL)
INSERT [dbo].[sizes] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (6, N'40', N'Kích thước "40" là một trong những kích thước chuẩn được sử dụng để đo kích thước của giày hoặc dép, thường áp dụng trong hệ thống kích thước châu Âu và nhiều quốc gia khác trên thế giới. Đây là một kích thước trung bình, phổ biến cho cả nam và nữ, thường phù hợp với chân có chiều dài khoảng 24.5 cm. Kích thước "40" thường được sản xuất và bán lẻ với sự đa dạng về kiểu dáng, chất liệu và thiết kế, đảm bảo rằng người mua có thể tìm thấy kích thước phù hợp và thoải mái cho đôi chân của mình, và cung cấp một lựa chọn phù hợp cho nhu cầu và phong cách cá nhân của họ.', CAST(N'2024-03-27T04:55:44.967' AS DateTime), NULL, NULL)
INSERT [dbo].[sizes] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (7, N'41', N'Kích thước "41" là một trong những kích thước chuẩn được sử dụng để đo kích thước của giày hoặc dép, thường áp dụng trong hệ thống kích thước châu Âu và nhiều quốc gia khác trên thế giới. Đây là một kích thước trung bình, phổ biến cho cả nam và nữ, thường phù hợp với chân có chiều dài khoảng 25 cm. Kích thước "41" thường được sản xuất và bán lẻ với sự đa dạng về kiểu dáng, chất liệu và thiết kế, đảm bảo rằng người mua có thể tìm thấy kích thước phù hợp và thoải mái cho đôi chân của mình, và cung cấp một lựa chọn phù hợp cho nhu cầu và phong cách cá nhân của họ.', CAST(N'2024-03-27T04:58:10.970' AS DateTime), NULL, NULL)
INSERT [dbo].[sizes] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (8, N'42', N'Kích thước "42" là một trong những kích thước chuẩn được sử dụng để đo kích thước của giày hoặc dép, thường áp dụng trong hệ thống kích thước châu Âu và nhiều quốc gia khác trên thế giới. Đây là một kích thước trung bình, phổ biến cho cả nam và nữ, thường phù hợp với chân có chiều dài khoảng 25.5 cm. Kích thước "42" thường được sản xuất và bán lẻ với sự đa dạng về kiểu dáng, chất liệu và thiết kế, đảm bảo rằng người mua có thể tìm thấy kích thước phù hợp và thoải mái cho đôi chân của mình, và cung cấp một lựa chọn phù hợp cho nhu cầu và phong cách cá nhân của họ.', CAST(N'2024-03-27T05:01:12.200' AS DateTime), NULL, NULL)
INSERT [dbo].[sizes] ([id], [name], [description], [created_at], [deleted_at], [updated_at]) VALUES (9, N'43', N'Kích thước "43" là một trong những kích thước chuẩn được sử dụng để đo kích thước của giày hoặc dép, thường áp dụng trong hệ thống kích thước châu Âu và nhiều quốc gia khác trên thế giới. Đây là một kích thước trung bình, phổ biến cho cả nam và nữ, thường phù hợp với chân có chiều dài khoảng 26 cm. Kích thước "43" thường được sản xuất và bán lẻ với sự đa dạng về kiểu dáng, chất liệu và thiết kế, đảm bảo rằng người mua có thể tìm thấy kích thước phù hợp và thoải mái cho đôi chân của mình, và cung cấp một lựa chọn phù hợp cho nhu cầu và phong cách cá nhân của họ.', CAST(N'2024-03-27T05:24:51.680' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[sizes] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [name], [email], [password], [phone], [is_deleted], [role], [status], [image_url], [created_at]) VALUES (1, N'Đỗ Đức Hiếu ', N'hieuddhe172149@fpt.edu.vn', N'$2a$10$jVxuslDZU65XeUULonKLMeR/cinKpwccAD5OpJSOtALWSFXNBeIJS', N'0969008647', 0, 2, 1, NULL, CAST(N'2024-03-27T02:12:08.400' AS DateTime))
INSERT [dbo].[users] ([id], [name], [email], [password], [phone], [is_deleted], [role], [status], [image_url], [created_at]) VALUES (2, N'Emma', N'Emma133@gmail.com', N'$2a$10$ZkPdJ7HSFtFjSp0osYvayub0L3RWn7djRfyMihcttC3XoZj/j0.0O', N'0969026257', 0, 1, 1, NULL, CAST(N'2024-03-27T11:51:38.210' AS DateTime))
INSERT [dbo].[users] ([id], [name], [email], [password], [phone], [is_deleted], [role], [status], [image_url], [created_at]) VALUES (6, N'John Rambo', N'JohnR@gmail.com', N'$2a$10$wyGgDw.9SKn6kct.aGpweuJKQ432r4gIVJtCGiJL/SJjMkYKHpTt2', N'0987878545', 0, 4, 1, NULL, CAST(N'2024-03-27T12:06:21.413' AS DateTime))
INSERT [dbo].[users] ([id], [name], [email], [password], [phone], [is_deleted], [role], [status], [image_url], [created_at]) VALUES (7, N'Tran Vuong', N'vuongmt124@gmail.com', N'$2a$10$b.y4IACO2KSRDSQN6CQBzuoVVUKA/iZg7Rb2/vDqcXhMBQsyiYHq6', N'0987065480', 1, 2, 0, NULL, CAST(N'2024-03-27T12:09:44.347' AS DateTime))
INSERT [dbo].[users] ([id], [name], [email], [password], [phone], [is_deleted], [role], [status], [image_url], [created_at]) VALUES (8, N'HIeu Do', N'hieudoe@gmail.com', N'$2a$10$3VxrMVtslD8YRVIg2am5neKB/ky0afj1vAA9Zi8bvLLeoUC6meqBm', N'0987654321', 0, 2, 1, NULL, CAST(N'2024-03-28T15:41:49.910' AS DateTime))
INSERT [dbo].[users] ([id], [name], [email], [password], [phone], [is_deleted], [role], [status], [image_url], [created_at]) VALUES (9, N'Tuan tien ti', N'tuantienti@gmail.com', N'$2a$10$R6VzSPR2C9jpLbbElDrVyOQNKNcLEwMthEbbTUOTpgCtzFsSyImHS', N'0987065408', 0, 2, 1, NULL, CAST(N'2024-03-28T15:54:24.507' AS DateTime))
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E61642F6B1E65]    Script Date: 3/28/2024 7:25:57 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[account_active_tokens]  WITH CHECK ADD  CONSTRAINT [account_active_tokens_email_fkey] FOREIGN KEY([user_email])
REFERENCES [dbo].[users] ([email])
GO
ALTER TABLE [dbo].[account_active_tokens] CHECK CONSTRAINT [account_active_tokens_email_fkey]
GO
ALTER TABLE [dbo].[cart_items]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[cart_items]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[cart_items]  WITH CHECK ADD FOREIGN KEY([product_detail_id])
REFERENCES [dbo].[product_details] ([id])
GO
ALTER TABLE [dbo].[cart_items]  WITH CHECK ADD FOREIGN KEY([product_detail_id])
REFERENCES [dbo].[product_details] ([id])
GO
ALTER TABLE [dbo].[districts]  WITH CHECK ADD  CONSTRAINT [districts_province_code_fkey] FOREIGN KEY([province_code])
REFERENCES [dbo].[provinces] ([code])
GO
ALTER TABLE [dbo].[districts] CHECK CONSTRAINT [districts_province_code_fkey]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([product_detail_id])
REFERENCES [dbo].[product_details] ([id])
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([product_detail_id])
REFERENCES [dbo].[product_details] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([delivery_address_id])
REFERENCES [dbo].[user_addresses] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([delivery_address_id])
REFERENCES [dbo].[user_addresses] ([id])
GO
ALTER TABLE [dbo].[password_reset_tokens]  WITH CHECK ADD  CONSTRAINT [password_reset_tokens_email_fkey] FOREIGN KEY([user_email])
REFERENCES [dbo].[users] ([email])
GO
ALTER TABLE [dbo].[password_reset_tokens] CHECK CONSTRAINT [password_reset_tokens_email_fkey]
GO
ALTER TABLE [dbo].[product_details]  WITH CHECK ADD  CONSTRAINT [product_detail_color_id_fkey] FOREIGN KEY([color_id])
REFERENCES [dbo].[colors] ([id])
GO
ALTER TABLE [dbo].[product_details] CHECK CONSTRAINT [product_detail_color_id_fkey]
GO
ALTER TABLE [dbo].[product_details]  WITH CHECK ADD  CONSTRAINT [product_detail_product_id_fkey] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[product_details] CHECK CONSTRAINT [product_detail_product_id_fkey]
GO
ALTER TABLE [dbo].[product_details]  WITH CHECK ADD  CONSTRAINT [product_detail_size_id_fkey] FOREIGN KEY([size_id])
REFERENCES [dbo].[sizes] ([id])
GO
ALTER TABLE [dbo].[product_details] CHECK CONSTRAINT [product_detail_size_id_fkey]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [product_brand_id_fkey] FOREIGN KEY([brand_id])
REFERENCES [dbo].[brands] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [product_brand_id_fkey]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [product_category_id_fkey] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [product_category_id_fkey]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [product_form_id_fkey] FOREIGN KEY([form_id])
REFERENCES [dbo].[forms] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [product_form_id_fkey]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [product_group_id_fkey] FOREIGN KEY([group_id])
REFERENCES [dbo].[groups] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [product_group_id_fkey]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [product_material_id_fkey] FOREIGN KEY([material_id])
REFERENCES [dbo].[materials] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [product_material_id_fkey]
GO
ALTER TABLE [dbo].[user_addresses]  WITH CHECK ADD  CONSTRAINT [user_address_district_code_fkey] FOREIGN KEY([district_code])
REFERENCES [dbo].[districts] ([code])
GO
ALTER TABLE [dbo].[user_addresses] CHECK CONSTRAINT [user_address_district_code_fkey]
GO
ALTER TABLE [dbo].[user_addresses]  WITH CHECK ADD  CONSTRAINT [user_address_province_code_fkey] FOREIGN KEY([province_code])
REFERENCES [dbo].[provinces] ([code])
GO
ALTER TABLE [dbo].[user_addresses] CHECK CONSTRAINT [user_address_province_code_fkey]
GO
ALTER TABLE [dbo].[user_addresses]  WITH CHECK ADD  CONSTRAINT [user_address_ward_code_fkey] FOREIGN KEY([ward_code])
REFERENCES [dbo].[wards] ([code])
GO
ALTER TABLE [dbo].[user_addresses] CHECK CONSTRAINT [user_address_ward_code_fkey]
GO
ALTER TABLE [dbo].[user_addresses]  WITH CHECK ADD  CONSTRAINT [user_fkey] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_addresses] CHECK CONSTRAINT [user_fkey]
GO
ALTER TABLE [dbo].[user_contracts]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[wards]  WITH CHECK ADD  CONSTRAINT [wards_district_code_fkey] FOREIGN KEY([district_code])
REFERENCES [dbo].[districts] ([code])
GO
ALTER TABLE [dbo].[wards] CHECK CONSTRAINT [wards_district_code_fkey]
GO
USE [master]
GO
ALTER DATABASE [OSS] SET  READ_WRITE 
GO
