SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CRC].[QT_PRIVILEGE](
	[PROTECTION_LABEL_CD] [varchar](1500) NOT NULL,
	[DATAPROT_CD] [varchar](1000) NULL,
	[HIVEMGMT_CD] [varchar](1000) NULL,
	[PLUGIN_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PROTECTION_LABEL_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
