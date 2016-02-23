USE [venture_market]
GO
/****** Object:  Table [dbo].[angel_investor]    Script Date: 23.02.2016 23:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[angel_investor](
	[investor_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](45) NULL,
	[last_name] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_angel_investor_investor_id] PRIMARY KEY CLUSTERED 
(
	[investor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[application]    Script Date: 23.02.2016 23:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[application](
	[application_id] [int] IDENTITY(1,1) NOT NULL,
	[startup_id] [int] NOT NULL,
	[state] [nvarchar](45) NOT NULL,
	[application_round] [int] NOT NULL,
	[invest_manager_id] [int] NULL,
 CONSTRAINT [PK_application_application_id] PRIMARY KEY CLUSTERED 
(
	[application_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[business_incubator]    Script Date: 23.02.2016 23:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[business_incubator](
	[incubator_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[number_of_seats] [int] NULL,
	[adress] [nvarchar](255) NULL,
	[website] [nvarchar](63) NULL,
 CONSTRAINT [PK_business_incubator_incubator_id] PRIMARY KEY CLUSTERED 
(
	[incubator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[development_stage]    Script Date: 23.02.2016 23:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[development_stage](
	[dev_stage_id] [int] NOT NULL,
	[stage] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_development_stage_dev_stage_id] PRIMARY KEY CLUSTERED 
(
	[dev_stage_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[investment_company]    Script Date: 23.02.2016 23:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[investment_company](
	[company_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[website] [nvarchar](63) NULL,
	[foundation_date] [date] NULL,
	[head_office_adress] [nvarchar](255) NULL,
	[ceo] [nvarchar](255) NULL,
 CONSTRAINT [PK_investment_company_company_id] PRIMARY KEY CLUSTERED 
(
	[company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [investment_company$id_UNIQUE] UNIQUE NONCLUSTERED 
(
	[company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [investment_company$title_UNIQUE] UNIQUE NONCLUSTERED 
(
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[investment_manager]    Script Date: 23.02.2016 23:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[investment_manager](
	[manager_id] [int] IDENTITY(1,1) NOT NULL,
	[last_name] [nvarchar](45) NOT NULL,
	[first_name] [nvarchar](45) NOT NULL,
	[investment_company_id] [int] NULL,
 CONSTRAINT [PK_investment_manager_manager_id] PRIMARY KEY CLUSTERED 
(
	[manager_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[round_investor]    Script Date: 23.02.2016 23:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[round_investor](
	[company_id] [int] NULL,
	[angel_id] [int] NULL,
	[round_id] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[round_of_funding]    Script Date: 23.02.2016 23:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[round_of_funding](
	[round_id] [int] IDENTITY(1,1) NOT NULL,
	[startup_id] [int] NOT NULL,
	[title] [nvarchar](45) NOT NULL,
	[total_investment] [decimal](10, 0) NULL,
 CONSTRAINT [PK_round_of_funding_round_id] PRIMARY KEY CLUSTERED 
(
	[round_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[startup]    Script Date: 23.02.2016 23:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[startup](
	[startup_id] [int] IDENTITY(1,1) NOT NULL,
	[titile] [nvarchar](45) NOT NULL,
	[description] [nvarchar](max) NULL,
	[business_model] [nvarchar](255) NULL,
	[competitors] [int] NULL,
	[marketing_strategy] [nvarchar](255) NULL,
	[total_investment] [decimal](10, 0) NULL,
	[website] [nvarchar](63) NULL,
	[foundation_date] [date] NULL,
	[twitter] [nvarchar](63) NULL,
	[ceo] [nvarchar](45) NULL,
	[business_incubator_id] [int] NULL,
	[development_stage_id] [int] NOT NULL,
 CONSTRAINT [PK_startup_startup_id] PRIMARY KEY CLUSTERED 
(
	[startup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [startup$id_UNIQUE] UNIQUE NONCLUSTERED 
(
	[startup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [startup$titile_UNIQUE] UNIQUE NONCLUSTERED 
(
	[titile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[angel_investor] ADD  DEFAULT (NULL) FOR [first_name]
GO
ALTER TABLE [dbo].[application] ADD  DEFAULT (NULL) FOR [invest_manager_id]
GO
ALTER TABLE [dbo].[business_incubator] ADD  DEFAULT (NULL) FOR [number_of_seats]
GO
ALTER TABLE [dbo].[business_incubator] ADD  DEFAULT (NULL) FOR [adress]
GO
ALTER TABLE [dbo].[business_incubator] ADD  DEFAULT (NULL) FOR [website]
GO
ALTER TABLE [dbo].[investment_company] ADD  DEFAULT (NULL) FOR [website]
GO
ALTER TABLE [dbo].[investment_company] ADD  DEFAULT (NULL) FOR [foundation_date]
GO
ALTER TABLE [dbo].[investment_company] ADD  DEFAULT (NULL) FOR [head_office_adress]
GO
ALTER TABLE [dbo].[investment_company] ADD  DEFAULT (NULL) FOR [ceo]
GO
ALTER TABLE [dbo].[investment_manager] ADD  DEFAULT (NULL) FOR [investment_company_id]
GO
ALTER TABLE [dbo].[round_investor] ADD  DEFAULT (NULL) FOR [company_id]
GO
ALTER TABLE [dbo].[round_investor] ADD  DEFAULT (NULL) FOR [angel_id]
GO
ALTER TABLE [dbo].[round_of_funding] ADD  DEFAULT (NULL) FOR [total_investment]
GO
ALTER TABLE [dbo].[startup] ADD  DEFAULT (NULL) FOR [business_model]
GO
ALTER TABLE [dbo].[startup] ADD  DEFAULT (NULL) FOR [competitors]
GO
ALTER TABLE [dbo].[startup] ADD  DEFAULT (NULL) FOR [marketing_strategy]
GO
ALTER TABLE [dbo].[startup] ADD  DEFAULT (NULL) FOR [total_investment]
GO
ALTER TABLE [dbo].[startup] ADD  DEFAULT (NULL) FOR [website]
GO
ALTER TABLE [dbo].[startup] ADD  DEFAULT (NULL) FOR [foundation_date]
GO
ALTER TABLE [dbo].[startup] ADD  DEFAULT (NULL) FOR [twitter]
GO
ALTER TABLE [dbo].[startup] ADD  DEFAULT (NULL) FOR [ceo]
GO
ALTER TABLE [dbo].[startup] ADD  DEFAULT (NULL) FOR [business_incubator_id]
GO
ALTER TABLE [dbo].[application]  WITH CHECK ADD  CONSTRAINT [application$application_ibfk_1] FOREIGN KEY([startup_id])
REFERENCES [dbo].[startup] ([startup_id])
GO
ALTER TABLE [dbo].[application] CHECK CONSTRAINT [application$application_ibfk_1]
GO
ALTER TABLE [dbo].[application]  WITH CHECK ADD  CONSTRAINT [application$application_ibfk_2] FOREIGN KEY([invest_manager_id])
REFERENCES [dbo].[investment_manager] ([manager_id])
GO
ALTER TABLE [dbo].[application] CHECK CONSTRAINT [application$application_ibfk_2]
GO
ALTER TABLE [dbo].[investment_manager]  WITH CHECK ADD  CONSTRAINT [investment_manager$investment_manager_ibfk_1] FOREIGN KEY([investment_company_id])
REFERENCES [dbo].[investment_company] ([company_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[investment_manager] CHECK CONSTRAINT [investment_manager$investment_manager_ibfk_1]
GO
ALTER TABLE [dbo].[round_investor]  WITH CHECK ADD  CONSTRAINT [round_investor$round_investor_ibfk_1] FOREIGN KEY([company_id])
REFERENCES [dbo].[investment_company] ([company_id])
GO
ALTER TABLE [dbo].[round_investor] CHECK CONSTRAINT [round_investor$round_investor_ibfk_1]
GO
ALTER TABLE [dbo].[round_investor]  WITH CHECK ADD  CONSTRAINT [round_investor$round_investor_ibfk_2] FOREIGN KEY([angel_id])
REFERENCES [dbo].[angel_investor] ([investor_id])
GO
ALTER TABLE [dbo].[round_investor] CHECK CONSTRAINT [round_investor$round_investor_ibfk_2]
GO
ALTER TABLE [dbo].[round_investor]  WITH CHECK ADD  CONSTRAINT [round_investor$round_investor_ibfk_3] FOREIGN KEY([round_id])
REFERENCES [dbo].[round_of_funding] ([round_id])
GO
ALTER TABLE [dbo].[round_investor] CHECK CONSTRAINT [round_investor$round_investor_ibfk_3]
GO
ALTER TABLE [dbo].[round_of_funding]  WITH CHECK ADD  CONSTRAINT [round_of_funding$round_of_funding_ibfk_1] FOREIGN KEY([startup_id])
REFERENCES [dbo].[startup] ([startup_id])
GO
ALTER TABLE [dbo].[round_of_funding] CHECK CONSTRAINT [round_of_funding$round_of_funding_ibfk_1]
GO
ALTER TABLE [dbo].[startup]  WITH CHECK ADD  CONSTRAINT [startup$startup_ibfk_1] FOREIGN KEY([business_incubator_id])
REFERENCES [dbo].[business_incubator] ([incubator_id])
GO
ALTER TABLE [dbo].[startup] CHECK CONSTRAINT [startup$startup_ibfk_1]
GO
ALTER TABLE [dbo].[startup]  WITH CHECK ADD  CONSTRAINT [startup$startup_ibfk_2] FOREIGN KEY([development_stage_id])
REFERENCES [dbo].[development_stage] ([dev_stage_id])
GO
ALTER TABLE [dbo].[startup] CHECK CONSTRAINT [startup$startup_ibfk_2]
GO
ALTER TABLE [dbo].[startup]  WITH CHECK ADD  CONSTRAINT [startup$startup_ibfk_3] FOREIGN KEY([competitors])
REFERENCES [dbo].[startup] ([startup_id])
GO
ALTER TABLE [dbo].[startup] CHECK CONSTRAINT [startup$startup_ibfk_3]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'venture_market.angel_investor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'angel_investor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'venture_market.application' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'application'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'venture_market.business_incubator' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'business_incubator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'venture_market.development_stage' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'development_stage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'venture_market.investment_company' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'investment_company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'venture_market.investment_manager' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'investment_manager'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'venture_market.round_investor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'round_investor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'venture_market.round_of_funding' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'round_of_funding'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'venture_market.startup' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'startup'
GO
