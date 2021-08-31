SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CRC].[PATIENT_MAPPING](
	[PATIENT_IDE] [varchar](200) NOT NULL,
	[PATIENT_IDE_SOURCE] [varchar](50) NOT NULL,
	[PATIENT_NUM] [int] NOT NULL,
	[PATIENT_IDE_STATUS] [varchar](50) NULL,
	[PROJECT_ID] [varchar](50) NOT NULL,
	[UPLOAD_DATE] [datetime] NULL,
	[UPDATE_DATE] [datetime] NULL,
	[DOWNLOAD_DATE] [datetime] NULL,
	[IMPORT_DATE] [datetime] NULL,
	[SOURCESYSTEM_CD] [varchar](50) NULL,
	[UPLOAD_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PATIENT_IDE] ASC,
	[PATIENT_IDE_SOURCE] ASC,
	[PROJECT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [PM_ENCPNUM_IDX] ON [CRC].[PATIENT_MAPPING]
(
	[PATIENT_IDE] ASC,
	[PATIENT_IDE_SOURCE] ASC,
	[PATIENT_NUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PM_IDX_UPLOADID] ON [CRC].[PATIENT_MAPPING]
(
	[UPLOAD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PM_PATNUM_IDX] ON [CRC].[PATIENT_MAPPING]
(
	[PATIENT_NUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
