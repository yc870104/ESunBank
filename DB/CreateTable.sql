USE [ESunBank]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 2023/4/28 下午 10:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Comment ID] [int] IDENTITY(1,1) NOT NULL,
	[User ID] [int] NOT NULL,
	[Post ID] [int] NOT NULL,
	[Content] [ntext] NULL,
	[Created At] [date] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Comment ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 2023/4/28 下午 10:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Post ID] [int] IDENTITY(1,1) NOT NULL,
	[User ID] [int] NOT NULL,
	[Content] [ntext] NULL,
	[Image] [varchar](100) NULL,
	[Created At] [date] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Post ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2023/4/28 下午 10:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User ID] [int] IDENTITY(1,1) NOT NULL,
	[User Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [varchar](100) NOT NULL,
	[Cover Image] [varchar](100) NULL,
	[Biography] [ntext] NULL,
	[Phone Number] [varchar](20) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Post] ON 
GO
INSERT [dbo].[Post] ([Post ID], [User ID], [Content], [Image], [Created At]) VALUES (1, 1, N'測試測試', NULL, CAST(N'2023-04-28' AS Date))
GO
INSERT [dbo].[Post] ([Post ID], [User ID], [Content], [Image], [Created At]) VALUES (2, 1, N'測試測試測試測試', NULL, CAST(N'2023-04-28' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([User ID], [User Name], [Email], [Password], [Cover Image], [Biography], [Phone Number]) VALUES (1, N'TEST1', N'test1@gmail.com', N'$2a$10$5xpPv2naBMENAg6XGG2ih.h3F8xVPHl9VjVJjEYI13QkiPN12QySe', NULL, N'AAAA', N'0987654321')
GO
INSERT [dbo].[User] ([User ID], [User Name], [Email], [Password], [Cover Image], [Biography], [Phone Number]) VALUES (2, N'TEST2', N'test2@gamil.com', N'$2a$10$5xpPv2naBMENAg6XGG2ih.h3F8xVPHl9VjVJjEYI13QkiPN12QySe', NULL, N'BBB', N'0987654320')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Post] FOREIGN KEY([Post ID])
REFERENCES [dbo].[Post] ([Post ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Post]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([User ID])
REFERENCES [dbo].[User] ([User ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_User] FOREIGN KEY([User ID])
REFERENCES [dbo].[User] ([User ID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_User]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Post ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Post', @level2type=N'COLUMN',@level2name=N'Post ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Post', @level2type=N'COLUMN',@level2name=N'User ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'發佈文章內容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Post', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'圖片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Post', @level2type=N'COLUMN',@level2name=N'Image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'發佈時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Post', @level2type=N'COLUMN',@level2name=N'Created At'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'User ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'User Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者電子郵件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'封面照片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Cover Image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者的自我介紹' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Biography'
GO
