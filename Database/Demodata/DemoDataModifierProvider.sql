insert into CRC.MODIFIER_DIMENSION select '\Admit Diagnosis\','0','Admit Diagnosis','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Metastisis\','TNM:METASTISIS','TNM Staging, Distant Metastisis','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Metastisis\M0\','TNM:M0','TNM Staging, No distant metastasis','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Metastisis\M1\','TNM:M1','TNM Staging, Distant metastasis is present','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Metastisis\M1\M1a\','TNM:M1a','TNM Staging, Metastasized to other lung; Malignant pleural effusion; or Malignant pericardial effusion','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Metastisis\M1\M1b\','TNM:M1b','TNM Staging, Metastasized to distant lymph nodes and / organs','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Nodes\','TNM:NODES','TNM Staging, Regional lymph nodes','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Nodes\N0\','TNM:N0','TNM Staging, No regional lymph node involvement','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Nodes\N1\','TNM:N1','TNM Staging, Involvement of regional lymph nodes / extent of spread','Involves lymph nodes within the lung and/or the hilar lymph nodes. Affected lymph nodes are on the same side as the primary tumor.',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Nodes\N2\','TNM:N2','TNM Staging, Involvement of regional lymph nodes / extent of spread','Involves lymph nodes around the carina or in the mediastinum. Affected lymph nodes are on the same side as the primary tumor.',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Nodes\N3\','TNM:N3','TNM Staging, Involvement of regional lymph nodes / extent of spread','Involves lymph nodes near the collarbone on either side, and/or spread to hilar or mediastinal lymph nodes on the side opposite the primary tumor',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Nodes\NX\','TNM:NX','TNM Staging, Regional lymph nodes cannot be evaluated','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Stage\','TNM:STAGE','TNM Staging, Stage Classification','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Stage\0\','TNM:STAGE0','Carcinoma in situ','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Stage\I\','TNM:STAGEI','Cancer is localized','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Stage\I\IA\','TNM:STAGEIA','Cancer is localized; tumor is no larger than 3 cm; No involvement of lymph nodes','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Stage\I\IB\','TNM:STAGEIB','Cancer is localized; tumor is between 3 and 5 cm; No involvement of lymph nodes','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Stage\II\','TNM:STAGEII','Cancer is localized, advanced within area','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Stage\II\IIA\','TNM:STAGEIIA','Cancer is localized; tumor is greater than 3 cm; Local lymph nodes may be involved','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Stage\II\IIB\','TNM:STAGEIIB','Cancer is localized; tumor is greater than 5 cm; Local lymph nodes may be involved; Multiple nodes may be involved','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Stage\III\','TNM:STAGEIII','Cancer is localized, advanced within area','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Stage\III\IIB\','TNM:STAGEIIIB','Cancer is localized;  tumor may have grown into surrounding structures; Regional lymph nodes may be involved; Multiple nodes may be involved','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Stage\III\IIIA\','TNM:STAGEIIIA','Cancer is localized; tumor may have grown into surrounding structures; Regional lymph nodes may be involved','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Stage\IV\','TNM:STAGEIV','Metastasized to distant lymph nodes and / organs','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Stage\Occult\','TNM:STAGE0','Cancer found in lung fluids but its location can''t be determined','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Tumor\','TNM:TUMOR','TNM Staging, Tumor Rating','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Tumor\T0\','TNM:T0','No evidence of primary tumor','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Tumor\T1\','TNM:T1','Tumor no greater than 3 cm','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Tumor\T1\T1a\','TNM:T1a','Tumor no greater than 2 cm','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Tumor\T1\T1b\','TNM:T1b','Tumor greater than 2 cm but less than 3 cm','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Tumor\T2\','TNM:T2','Tumor between 3  and 7 cm','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Tumor\T2\T2a\','TNM:T2a','Tumor no greater than 5 cm','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Tumor\T2\T2b\','TNM:T2b','Tumor greater than 5 cm but less than 7 cm','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Tumor\T3\','TNM:T3','Tumor greater than 7 cm','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Tumor\T4\','TNM:T4','Tumor grown into other areas or multiple nodules','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Tumor\Tis\','TNM:Tis','Carcinoma in situ','CIS; abnormal cells present but have not spread to neighboring tissue.',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Lung\TNM\Tumor\TX\','TNM:TX','Primary tumor cannot be evaluated','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Medication\Dose\','MED:DOSE','Medication Dose','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Medication\Frequency\','MED:FREQ','Medication Frequency','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Medication\Instructions\','MED:INST','Patient Instructions','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Medication\Route\','MED:ROUTE','Medication Route','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Medication\RxSig\','MED:SIG','Rx Sig','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Principal Diagnosis\','1','Principal Diagnosis','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Secondary Diagnosis\','2','Secondary Diagnosis','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Severity\Mild To Mod\','SNO:371923003','Severity: Mild to moderate','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Severity\Mild\','SNO:255604002','Severity: Mild','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Severity\Moderate To Severe\','SNO:371924009','Severity: Moderate to severe','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Severity\Moderate\','SNO:6736007','Severity: Moderate','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Severity\Severe\','SNO:24484000','Severity: Severe','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Severity\Severe\Fatal\','SNO:399166001','Severity: Fatal','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\Severity\Severe\Type I Hypersensitivity\','SNO:264774001','Severity: Type I Hypersensitivity','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Metastisis\','TNM:METASTISIS','TNM Staging, Distant Metastisis','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Metastisis\M0\','TNM:M0','TNM Staging, No distant metastasis','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Metastisis\M1\','TNM:M1','TNM Staging, Distant metastasis is present','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Metastisis\MX\','TNM:MX','TNM Staging, Distant metastasis cannot be evaluated','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Nodes\','TNM:NODES','TNM Staging, Regional lymph nodes','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Nodes\N0\','TNM:N0','TNM Staging, No regional lymph node involvement','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Nodes\N1\','TNM:N1','TNM Staging, Involvement of regional lymph nodes / extent of spread','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Nodes\N2\','TNM:N2','TNM Staging, Involvement of regional lymph nodes / extent of spread','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Nodes\N3\','TNM:N3','TNM Staging, Involvement of regional lymph nodes / extent of spread','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Nodes\NX\','TNM:NX','TNM Staging, Regional lymph nodes cannot be evaluated','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Stage\','TNM:STAGE','TNM Staging, Stage Classification','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Stage\0\','TNM:STAGE0','Carcinoma in situ','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Stage\I\','TNM:STAGEI','Cancer is localized','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Stage\II\','TNM:STAGEII','Cancer is localized, advanced within area','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Stage\III\','TNM:STAGEIII','Cancer is localized, advanced within area','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Stage\IV\','TNM:STAGEIV','Metastasized to distant lymph nodes and / organs','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Tumor\','TNM:TUMOR','TNM Staging, Tumor Rating','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Tumor\T0\','TNM:T0','No evidence of primary tumor','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Tumor\T1\','TNM:T1','Tumor small in size','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Tumor\T2\','TNM:T2','Tumor medium in size','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Tumor\T3\','TNM:T3','Tumor large in size','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Tumor\T4\','TNM:T4','Tumor very large in size','',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Tumor\Tis\','TNM:Tis','Carcinoma in situ','CIS; abnormal cells present but have not spread to neighboring tissue.',null,null,null,'DEMO',null
insert into CRC.MODIFIER_DIMENSION select '\TNM\Tumor\TX\','TNM:TX','Primary tumor cannot be evaluated','',null,null,null,'DEMO',null
GO




insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:PROVIDERS','\i2b2\Providers\','Providers',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:EMERGENCY','\i2b2\Providers\Emergency\','Emergency Medicine',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109062','\i2b2\Providers\Emergency\Burns, Frank, MD\','Burns, Frank, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109073','\i2b2\Providers\Emergency\Carter, John, MD\','Carter, John, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109071','\i2b2\Providers\Emergency\Greene, Mark, MD\','Greene, Mark, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109072','\i2b2\Providers\Emergency\Lewis, Susan, MD\','Lewis, Susan, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109065','\i2b2\Providers\Emergency\McIntyre, Trapper John, MD\','McIntyre, Trapper John, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109067','\i2b2\Providers\Emergency\Pierce, Benjamin Franklin, MD\','Pierce, Benjamin Franklin, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:GENETICS','\i2b2\Providers\Genetics\','Genetics',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109101','\i2b2\Providers\Genetics\Parker, James, MD, PhD','Parker, James, MD, PhD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:MEDICINE','\i2b2\Providers\Medicine\','Medicine',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:CARDIOLOGY','\i2b2\Providers\Medicine\Cardiology\','Cardiology',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109069','\i2b2\Providers\Medicine\Cardiology\Austin, Kate, MD\','Austin, Kate, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:INFECTIOUSDISEASE','\i2b2\Providers\Medicine\Infectious Disease\','Infectious Disease',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109077','\i2b2\Providers\Medicine\Infectious Disease\House, Gregory, MD\','House, Gregory, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:PRIMARYCARE','\i2b2\Providers\Medicine\Primary Care\','Primary Care',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109063','\i2b2\Providers\Medicine\Primary Care\Casey, Ben, MD\','Casey, Ben, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109098','\i2b2\Providers\Medicine\Primary Care\Cooper, Fitch, MD\','Cooper, Fitch, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109076','\i2b2\Providers\Medicine\Primary Care\Delgado, Luisa, MD\','Delgado, Luisa, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109075','\i2b2\Providers\Medicine\Primary Care\Hansen, Sydney, MD\','Hansen, Sydney, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109064','\i2b2\Providers\Medicine\Primary Care\Kildare, James, MD\','Kildare, James, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109061','\i2b2\Providers\Medicine\Primary Care\Kiley, Steven, MD\','Kiley, Steven, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109100','\i2b2\Providers\Medicine\Primary Care\O''Hara, Eleanor, MD\','O''Hara, Eleanor, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109060','\i2b2\Providers\Medicine\Primary Care\Welby, Marcus, MD\','Welby, Marcus, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109066','\i2b2\Providers\Medicine\Primary Care\Winchester, Charles Emerson, MD\','Winchester, Charles Emerson, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:PULMONARY','\i2b2\Providers\Medicine\Pulmonary\','Pulmonary',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109078','\i2b2\Providers\Medicine\Pulmonary\Cuddy, Lisa, MD\','Cuddy, Lisa, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109093','\i2b2\Providers\Medicine\Pulmonary\Fiscus, Wayne, MD\','Fiscus, Wayne, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109097','\i2b2\Providers\Medicine\Pulmonary\Gillespie, Leonard, MD\','Gillespie, Leonard, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109094','\i2b2\Providers\Medicine\Pulmonary\Morrison, Jack, MD\','Morrison, Jack, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:NEUROLOGY','\i2b2\Providers\Neurology\','Neurology',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109068','\i2b2\Providers\Neurology\Geiger, Jeffrey, MD\','Geiger, Jeffrey, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:NEUROSURGERY','\i2b2\Providers\Neurosurgery\','Neurosurgery',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109086','\i2b2\Providers\Neurosurgery\Shepherd, Derek. MD\','Shepherd, Derek. MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:OBGYN','\i2b2\Providers\OBGYN\','Obstetrics and Gynecology',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109087','\i2b2\Providers\OBGYN\Montgomery, Addison, MD\','Montgomery, Addison, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:ONCOLOGY','\i2b2\Providers\Oncology\','Oncology',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109099','\i2b2\Providers\Oncology\Tak, John, MD\','Tak, John, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109079','\i2b2\Providers\Oncology\Wilson, James, MD\','Wilson, James, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:ORTHOPAEDIC','\i2b2\Providers\Orthopaedic\','Orthopaedic',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109089','\i2b2\Providers\Orthopaedic\Torres, Callie, MD\','Torres, Callie, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:PEDIATRIC','\i2b2\Providers\Pediatrics\','Pediatric',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109091','\i2b2\Providers\Pediatrics\Robbins, Arizona, MD\','Robbins, Arizona, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109070','\i2b2\Providers\Pediatrics\Ross, Douglass, MD\','Ross, Douglass, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:PSYCHIATRY','\i2b2\Providers\Psychiatry\','Psychiatry',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109096','\i2b2\Providers\Psychiatry\Freeman, Sydney, MD\','Freeman, Sydney, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109092','\i2b2\Providers\Psychiatry\Gallagher, Jack, MD\','Gallagher, Jack, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109095','\i2b2\Providers\Psychiatry\Reid, Spencer, PhD','Reid, Spencer, PhD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:SURGERY','\i2b2\Providers\Surgery\','Surgery',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:GENSURG','\i2b2\Providers\Surgery\General\','General Surgery',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109084','\i2b2\Providers\Surgery\General\Bailey, Miranda, MD\','Bailey, Miranda, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109080','\i2b2\Providers\Surgery\General\Gray, Meredith, MD\','Gray, Meredith, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109081','\i2b2\Providers\Surgery\General\Karev, Alex, MD\','Karev, Alex, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109082','\i2b2\Providers\Surgery\General\Stevens, Izzie, MD\','Stevens, Izzie, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109085','\i2b2\Providers\Surgery\General\Webber, Richard, MD\','Webber, Richard, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:PLASTICSURG','\i2b2\Providers\Surgery\Plastic and Reconstructive\','Plastic and Reconstructive Surgery',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109088','\i2b2\Providers\Surgery\Plastic and Reconstructive\Sloan, Mark, MD\','Sloan, Mark, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:THORACICSURG','\i2b2\Providers\Surgery\Thoracic\','Thoracic Surgery',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109083','\i2b2\Providers\Surgery\Thoracic\Yang, Christina, MD\','Yang, Christina, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:TRAUMASURG','\i2b2\Providers\Surgery\Trauma\','Trauma Surgery',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109074','\i2b2\Providers\Surgery\Trauma\Benton, Peter, MD\','Benton, Peter, MD',null,null,null,null,'Demo',null
insert into CRC.PROVIDER_DIMENSION select 'LCS-I2B2:D000109090','\i2b2\Providers\Surgery\Trauma\Hunt, Owen, MD\','Hunt, Owen, MD',null,null,null,null,'Demo',null
GO




