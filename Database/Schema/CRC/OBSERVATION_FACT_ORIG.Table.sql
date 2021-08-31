SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CRC].[OBSERVATION_FACT_ORIG](
	[ENCOUNTER_NUM] [int] NOT NULL,
	[PATIENT_NUM] [int] NOT NULL,
	[CONCEPT_CD] [varchar](50) NOT NULL,
	[PROVIDER_ID] [varchar](50) NOT NULL,
	[START_DATE] [datetime] NOT NULL,
	[MODIFIER_CD] [varchar](100) NOT NULL,
	[INSTANCE_NUM] [int] NOT NULL,
	[VALTYPE_CD] [varchar](50) NULL,
	[TVAL_CHAR] [varchar](255) NULL,
	[NVAL_NUM] [decimal](18, 5) NULL,
	[VALUEFLAG_CD] [varchar](50) NULL,
	[QUANTITY_NUM] [decimal](18, 5) NULL,
	[UNITS_CD] [varchar](50) NULL,
	[END_DATE] [datetime] NULL,
	[LOCATION_CD] [varchar](50) NULL,
	[OBSERVATION_BLOB] [varchar](max) NULL,
	[CONFIDENCE_NUM] [decimal](18, 5) NULL,
	[UPDATE_DATE] [datetime] NULL,
	[DOWNLOAD_DATE] [datetime] NULL,
	[IMPORT_DATE] [datetime] NULL,
	[SOURCESYSTEM_CD] [varchar](50) NULL,
	[UPLOAD_ID] [int] NULL,
	[TEXT_SEARCH_INDEX] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[PATIENT_NUM] ASC,
	[CONCEPT_CD] ASC,
	[MODIFIER_CD] ASC,
	[START_DATE] ASC,
	[ENCOUNTER_NUM] ASC,
	[INSTANCE_NUM] ASC,
	[PROVIDER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE CLUSTERED INDEX [OF_IDX_ClusteredConcept] ON [CRC].[OBSERVATION_FACT_ORIG]
(
	[CONCEPT_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [OF_IDX_ALLObservation_Fact] ON [CRC].[OBSERVATION_FACT_ORIG]
(
	[PATIENT_NUM] ASC,
	[ENCOUNTER_NUM] ASC,
	[CONCEPT_CD] ASC,
	[START_DATE] ASC,
	[PROVIDER_ID] ASC,
	[MODIFIER_CD] ASC,
	[INSTANCE_NUM] ASC,
	[VALTYPE_CD] ASC,
	[TVAL_CHAR] ASC,
	[NVAL_NUM] ASC,
	[VALUEFLAG_CD] ASC,
	[QUANTITY_NUM] ASC,
	[UNITS_CD] ASC,
	[END_DATE] ASC,
	[LOCATION_CD] ASC,
	[CONFIDENCE_NUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OF_IDX_Encounter_Patient] ON [CRC].[OBSERVATION_FACT_ORIG]
(
	[ENCOUNTER_NUM] ASC,
	[PATIENT_NUM] ASC,
	[INSTANCE_NUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [OF_IDX_Modifier] ON [CRC].[OBSERVATION_FACT_ORIG]
(
	[MODIFIER_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [OF_IDX_SOURCESYSTEM_CD] ON [CRC].[OBSERVATION_FACT_ORIG]
(
	[SOURCESYSTEM_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OF_IDX_Start_Date] ON [CRC].[OBSERVATION_FACT_ORIG]
(
	[START_DATE] ASC,
	[PATIENT_NUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OF_IDX_UPLOADID] ON [CRC].[OBSERVATION_FACT_ORIG]
(
	[UPLOAD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [OF_TEXT_SEARCH_UNIQUE] ON [CRC].[OBSERVATION_FACT_ORIG]
(
	[TEXT_SEARCH_INDEX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [CRC].[OBSERVATION_FACT_ORIG] ADD  DEFAULT ('@') FOR [MODIFIER_CD]
GO
ALTER TABLE [CRC].[OBSERVATION_FACT_ORIG] ADD  DEFAULT ((1)) FOR [INSTANCE_NUM]
GO
