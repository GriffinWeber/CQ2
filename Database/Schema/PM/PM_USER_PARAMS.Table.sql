SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PM].[PM_USER_PARAMS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DATATYPE_CD] [varchar](50) NULL,
	[USER_ID] [varchar](50) NOT NULL,
	[PARAM_NAME_CD] [varchar](50) NOT NULL,
	[VALUE] [varchar](max) NULL,
	[CHANGE_DATE] [datetime] NULL,
	[ENTRY_DATE] [datetime] NULL,
	[CHANGEBY_CHAR] [varchar](50) NULL,
	[STATUS_CD] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
