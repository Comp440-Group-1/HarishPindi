USE [s16guest04]
GO
/****** Object:  Table [dbo].[branch]    Script Date: 5/2/2016 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[branch](
	[branch_id] [int] NOT NULL,
	[branch_name] [varchar](20) NOT NULL,
	[release_id] [int] NOT NULL,
 CONSTRAINT [pk_branch] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[city]    Script Date: 5/2/2016 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[city](
	[city_id] [int] NOT NULL,
	[city_name] [varchar](60) NOT NULL,
	[zip_code] [int] NULL,
	[state_id] [int] NULL,
	[country_id] [int] NULL,
 CONSTRAINT [pk_city] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[company]    Script Date: 5/2/2016 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[company](
	[company_id] [int] NOT NULL,
	[company_name] [varchar](50) NULL,
	[company_description] [varchar](150) NULL,
 CONSTRAINT [pk__company] PRIMARY KEY CLUSTERED 
(
	[company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[company_address]    Script Date: 5/2/2016 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[company_address](
	[address_id] [int] NOT NULL,
	[company_id] [int] NOT NULL,
	[street_number] [int] NULL,
	[street_name] [varchar](100) NULL,
	[city_id] [int] NOT NULL,
 CONSTRAINT [pk_company_address] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[company_product]    Script Date: 5/2/2016 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company_product](
	[company_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [pk_company_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[country]    Script Date: 5/2/2016 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[country](
	[country_id] [int] NOT NULL,
	[country_name] [varchar](60) NOT NULL,
 CONSTRAINT [pk_country] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer]    Script Date: 5/2/2016 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
	[customer_id] [int] NOT NULL,
	[first_name] [varchar](30) NULL,
	[last_name] [varchar](30) NULL,
	[company_id] [int] NOT NULL,
 CONSTRAINT [pk_customer] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer_download]    Script Date: 5/2/2016 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer_download](
	[customer_id] [int] NOT NULL,
	[downloaded_version] [int] NOT NULL,
	[download_date] [date] NOT NULL,
	[customer_release_id] [int] NOT NULL,
	[report_description] [varchar](220) NULL,
 CONSTRAINT [PK__customer__] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC,
	[download_date] ASC,
	[downloaded_version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer_email]    Script Date: 5/2/2016 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer_email](
	[customer_id] [int] NOT NULL,
	[email_id] [varchar](50) NULL,
 CONSTRAINT [pk_customer_email] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer_release]    Script Date: 5/2/2016 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer_release](
	[customer_release_id] [int] NOT NULL,
	[version_id] [int] NOT NULL,
	[release_date] [date] NOT NULL,
	[download_link] [varchar](200) NOT NULL,
	[download_description] [varchar](90) NULL,
 CONSTRAINT [pk_customer_release] PRIMARY KEY CLUSTERED 
(
	[customer_release_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[development_release]    Script Date: 5/2/2016 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[development_release](
	[release_id] [int] NOT NULL,
	[release_name] [varchar](20) NULL,
	[release_type] [varchar](40) NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[customer_release_id] [int] NOT NULL,
 CONSTRAINT [pk_development_release] PRIMARY KEY CLUSTERED 
(
	[release_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[feature]    Script Date: 5/2/2016 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[feature](
	[feature_id] [int] NOT NULL,
	[feature_name] [varchar](50) NULL,
	[feature_description] [varchar](80) NULL,
 CONSTRAINT [pk_feature] PRIMARY KEY CLUSTERED 
(
	[feature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[feature_iteration]    Script Date: 5/2/2016 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feature_iteration](
	[iteration_id] [int] NOT NULL,
	[feature_id] [int] NOT NULL,
 CONSTRAINT [PK__feature_iteration] PRIMARY KEY CLUSTERED 
(
	[iteration_id] ASC,
	[feature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[iteration]    Script Date: 5/2/2016 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[iteration](
	[iteration_id] [int] NOT NULL,
	[iteration_label] [varchar](20) NULL,
	[iteration_time] [varchar](20) NULL,
	[release_id] [int] NOT NULL,
 CONSTRAINT [pk_iteration] PRIMARY KEY CLUSTERED 
(
	[iteration_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[phone]    Script Date: 5/2/2016 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[phone](
	[phone_id] [int] NOT NULL,
	[phone_number] [varchar](15) NULL,
	[phone_type_id] [int] NULL,
	[customer_id] [int] NOT NULL,
 CONSTRAINT [pk_phone] PRIMARY KEY CLUSTERED 
(
	[phone_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[phone_type]    Script Date: 5/2/2016 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[phone_type](
	[phone_type_id] [int] NOT NULL,
	[phone_type] [varchar](10) NULL,
 CONSTRAINT [pk_phone_type] PRIMARY KEY CLUSTERED 
(
	[phone_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product]    Script Date: 5/2/2016 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [int] NOT NULL,
	[product_name] [varchar](50) NULL,
	[product_description] [varchar](120) NULL,
 CONSTRAINT [pk_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[release_feature]    Script Date: 5/2/2016 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[release_feature](
	[release_id] [int] NOT NULL,
	[feature_id] [int] NOT NULL,
	[feature_statue] [varchar](20) NULL,
 CONSTRAINT [PK__release_id_feature_id] PRIMARY KEY CLUSTERED 
(
	[release_id] ASC,
	[feature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[state]    Script Date: 5/2/2016 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[state](
	[state_id] [int] NOT NULL,
	[state_name] [varchar](60) NOT NULL,
 CONSTRAINT [pk_state] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[version]    Script Date: 5/2/2016 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[version](
	[version_id] [int] NOT NULL,
	[version_name] [varchar](90) NULL,
	[version_description] [varchar](70) NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [pk_version] PRIMARY KEY CLUSTERED 
(
	[version_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[version_feature]    Script Date: 5/2/2016 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[version_feature](
	[version_id] [int] NOT NULL,
	[feature_id] [int] NOT NULL,
 CONSTRAINT [PK__version_feature] PRIMARY KEY CLUSTERED 
(
	[version_id] ASC,
	[feature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[branch]  WITH CHECK ADD  CONSTRAINT [fk_branch_release_id] FOREIGN KEY([release_id])
REFERENCES [dbo].[development_release] ([release_id])
GO
ALTER TABLE [dbo].[branch] CHECK CONSTRAINT [fk_branch_release_id]
GO
ALTER TABLE [dbo].[city]  WITH CHECK ADD  CONSTRAINT [fk_city_country_id] FOREIGN KEY([country_id])
REFERENCES [dbo].[country] ([country_id])
GO
ALTER TABLE [dbo].[city] CHECK CONSTRAINT [fk_city_country_id]
GO
ALTER TABLE [dbo].[city]  WITH CHECK ADD  CONSTRAINT [fk_city_state_id] FOREIGN KEY([state_id])
REFERENCES [dbo].[state] ([state_id])
GO
ALTER TABLE [dbo].[city] CHECK CONSTRAINT [fk_city_state_id]
GO
ALTER TABLE [dbo].[company_address]  WITH CHECK ADD  CONSTRAINT [fk_company_address_city_id] FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([city_id])
GO
ALTER TABLE [dbo].[company_address] CHECK CONSTRAINT [fk_company_address_city_id]
GO
ALTER TABLE [dbo].[company_address]  WITH CHECK ADD  CONSTRAINT [fk_company_address_company_id] FOREIGN KEY([company_id])
REFERENCES [dbo].[company] ([company_id])
GO
ALTER TABLE [dbo].[company_address] CHECK CONSTRAINT [fk_company_address_company_id]
GO
ALTER TABLE [dbo].[company_product]  WITH CHECK ADD  CONSTRAINT [fk_company_product_company_id] FOREIGN KEY([company_id])
REFERENCES [dbo].[company] ([company_id])
GO
ALTER TABLE [dbo].[company_product] CHECK CONSTRAINT [fk_company_product_company_id]
GO
ALTER TABLE [dbo].[company_product]  WITH CHECK ADD  CONSTRAINT [fk_company_product_product_id] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[company_product] CHECK CONSTRAINT [fk_company_product_product_id]
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [fk_customer_company_id] FOREIGN KEY([company_id])
REFERENCES [dbo].[company] ([company_id])
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [fk_customer_company_id]
GO
ALTER TABLE [dbo].[customer_download]  WITH CHECK ADD  CONSTRAINT [fk_customer_download_customer_id] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[customer_download] CHECK CONSTRAINT [fk_customer_download_customer_id]
GO
ALTER TABLE [dbo].[customer_download]  WITH CHECK ADD  CONSTRAINT [fk_customer_download_customer_release_id] FOREIGN KEY([customer_release_id])
REFERENCES [dbo].[customer_release] ([customer_release_id])
GO
ALTER TABLE [dbo].[customer_download] CHECK CONSTRAINT [fk_customer_download_customer_release_id]
GO
ALTER TABLE [dbo].[customer_email]  WITH CHECK ADD  CONSTRAINT [fk_customer_email_customer_id] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[customer_email] CHECK CONSTRAINT [fk_customer_email_customer_id]
GO
ALTER TABLE [dbo].[customer_release]  WITH CHECK ADD  CONSTRAINT [fk_customer_release_version_id] FOREIGN KEY([version_id])
REFERENCES [dbo].[version] ([version_id])
GO
ALTER TABLE [dbo].[customer_release] CHECK CONSTRAINT [fk_customer_release_version_id]
GO
ALTER TABLE [dbo].[development_release]  WITH CHECK ADD  CONSTRAINT [fk_development_release_customer_release_id] FOREIGN KEY([customer_release_id])
REFERENCES [dbo].[customer_release] ([customer_release_id])
GO
ALTER TABLE [dbo].[development_release] CHECK CONSTRAINT [fk_development_release_customer_release_id]
GO
ALTER TABLE [dbo].[feature_iteration]  WITH CHECK ADD  CONSTRAINT [fk_feature_iteration_feature_id] FOREIGN KEY([feature_id])
REFERENCES [dbo].[feature] ([feature_id])
GO
ALTER TABLE [dbo].[feature_iteration] CHECK CONSTRAINT [fk_feature_iteration_feature_id]
GO
ALTER TABLE [dbo].[feature_iteration]  WITH CHECK ADD  CONSTRAINT [fk_feature_iteration_iteration_id] FOREIGN KEY([iteration_id])
REFERENCES [dbo].[iteration] ([iteration_id])
GO
ALTER TABLE [dbo].[feature_iteration] CHECK CONSTRAINT [fk_feature_iteration_iteration_id]
GO
ALTER TABLE [dbo].[iteration]  WITH CHECK ADD  CONSTRAINT [fk_iteration_release_id] FOREIGN KEY([release_id])
REFERENCES [dbo].[development_release] ([release_id])
GO
ALTER TABLE [dbo].[iteration] CHECK CONSTRAINT [fk_iteration_release_id]
GO
ALTER TABLE [dbo].[phone]  WITH CHECK ADD  CONSTRAINT [fk_phone_customer_id] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[phone] CHECK CONSTRAINT [fk_phone_customer_id]
GO
ALTER TABLE [dbo].[phone]  WITH CHECK ADD  CONSTRAINT [fk_phone_phone_type_id] FOREIGN KEY([phone_type_id])
REFERENCES [dbo].[phone_type] ([phone_type_id])
GO
ALTER TABLE [dbo].[phone] CHECK CONSTRAINT [fk_phone_phone_type_id]
GO
ALTER TABLE [dbo].[release_feature]  WITH CHECK ADD  CONSTRAINT [fk_release_feature_feature_id] FOREIGN KEY([feature_id])
REFERENCES [dbo].[feature] ([feature_id])
GO
ALTER TABLE [dbo].[release_feature] CHECK CONSTRAINT [fk_release_feature_feature_id]
GO
ALTER TABLE [dbo].[release_feature]  WITH CHECK ADD  CONSTRAINT [fk_release_feature_release_id] FOREIGN KEY([release_id])
REFERENCES [dbo].[development_release] ([release_id])
GO
ALTER TABLE [dbo].[release_feature] CHECK CONSTRAINT [fk_release_feature_release_id]
GO
ALTER TABLE [dbo].[version]  WITH CHECK ADD  CONSTRAINT [fk_version_product_id] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[version] CHECK CONSTRAINT [fk_version_product_id]
GO
ALTER TABLE [dbo].[version_feature]  WITH CHECK ADD  CONSTRAINT [fk_version_feature_feature_id] FOREIGN KEY([feature_id])
REFERENCES [dbo].[feature] ([feature_id])
GO
ALTER TABLE [dbo].[version_feature] CHECK CONSTRAINT [fk_version_feature_feature_id]
GO
ALTER TABLE [dbo].[version_feature]  WITH CHECK ADD  CONSTRAINT [fk_version_feature_version_id] FOREIGN KEY([version_id])
REFERENCES [dbo].[version] ([version_id])
GO
ALTER TABLE [dbo].[version_feature] CHECK CONSTRAINT [fk_version_feature_version_id]
GO
