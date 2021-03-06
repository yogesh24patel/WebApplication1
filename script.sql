
/****** Object:  StoredProcedure [dbo].[updateemployeedata]    Script Date: 1/4/2019 12:08:37 AM ******/
DROP PROCEDURE [dbo].[updateemployeedata]
GO
/****** Object:  StoredProcedure [dbo].[selectemployeeedesignation]    Script Date: 1/4/2019 12:08:37 AM ******/
DROP PROCEDURE [dbo].[selectemployeeedesignation]
GO
/****** Object:  StoredProcedure [dbo].[selectemployeedata]    Script Date: 1/4/2019 12:08:37 AM ******/
DROP PROCEDURE [dbo].[selectemployeedata]
GO
/****** Object:  StoredProcedure [dbo].[insertemployeedata]    Script Date: 1/4/2019 12:08:37 AM ******/
DROP PROCEDURE [dbo].[insertemployeedata]
GO
/****** Object:  StoredProcedure [dbo].[deleteemployee]    Script Date: 1/4/2019 12:08:37 AM ******/
DROP PROCEDURE [dbo].[deleteemployee]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 1/4/2019 12:08:37 AM ******/
DROP TABLE [dbo].[employee]
GO
/****** Object:  Table [dbo].[designation]    Script Date: 1/4/2019 12:08:37 AM ******/
DROP TABLE [dbo].[designation]
GO
/****** Object:  Table [dbo].[designation]    Script Date: 1/4/2019 12:08:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[designation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](250) NULL,
 CONSTRAINT [PK_designation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[employee]    Script Date: 1/4/2019 12:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employee](
	[empid] [int] IDENTITY(1,1) NOT NULL,
	[empname] [varchar](250) NULL,
	[gender] [bit] NULL,
	[designationid] [int] NULL,
	[empemail] [varchar](250) NULL,
	[empsalary] [varchar](250) NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[empid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[deleteemployee]    Script Date: 1/4/2019 12:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deleteemployee]
	@empid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   	delete from employee where empid=@empid
END

GO
/****** Object:  StoredProcedure [dbo].[insertemployeedata]    Script Date: 1/4/2019 12:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertemployeedata]
	@empname varchar(250)=null,
	@gender bit,
	@designationid int=null,
	@empemail varchar(250)=null,
	@empsalary decimal(8,2)=null,
	@date datetime
as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into employee values(@empname,@gender,@designationid,@empemail,@empsalary,@date)
	
END

GO
/****** Object:  StoredProcedure [dbo].[selectemployeedata]    Script Date: 1/4/2019 12:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectemployeedata]
@empid int=0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(@empid=0)
	begin
    select * from employee e inner join designation d on e.designationid=d.id 
	end
	else if (@empid>0)
	begin
	select * from employee e inner join designation d on e.designationid=d.id where e.empid=@empid 
	end
END

GO
/****** Object:  StoredProcedure [dbo].[selectemployeeedesignation]    Script Date: 1/4/2019 12:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectemployeeedesignation]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

select * from designation
END

GO
/****** Object:  StoredProcedure [dbo].[updateemployeedata]    Script Date: 1/4/2019 12:08:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateemployeedata]
@empid int,
		@empname varchar(250)=null,
	@gender bit,
	@designationid int=null,
	@empemail varchar(250)=null,
	@empsalary decimal(8,2)=null,
	@date datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update employee set empname=@empname, gender=@gender, designationid=@designationid,empemail=@empemail,empsalary=@empsalary,[date]=@date where empid=@empid
END

GO
