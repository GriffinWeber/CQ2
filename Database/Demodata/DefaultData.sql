-- **********************************************************
-- **********************************************************
-- **** General i2b2 lookup tables
-- **********************************************************
-- **********************************************************

INSERT INTO [CRC].[QT_PRIVILEGE]
	SELECT 'PDO_WITH_BLOB','DATA_DEID','USER',NULL
	UNION ALL SELECT 'PDO_WITHOUT_BLOB','DATA_LDS','USER',NULL
	UNION ALL SELECT 'SETFINDER_QRY_PROTECTED','DATA_PROT','USER',NULL
	UNION ALL SELECT 'SETFINDER_QRY_WITH_DATAOBFSC','DATA_OBFSC','USER',NULL
	UNION ALL SELECT 'SETFINDER_QRY_WITH_LGTEXT','DATA_DEID','USER',NULL
	UNION ALL SELECT 'SETFINDER_QRY_WITHOUT_DATAOBFSC','DATA_AGG','USER',NULL
	UNION ALL SELECT 'UPLOAD','DATA_OBFSC','MANAGER',NULL

INSERT INTO [CRC].[QT_QUERY_RESULT_TYPE]
	SELECT '1','PATIENTSET','Patient set','LIST','LA',NULL
	UNION ALL SELECT '2','PATIENT_ENCOUNTER_SET','Encounter set','LIST','LA',NULL
	UNION ALL SELECT '3','XML','Generic query result','CATNUM','LH',NULL
	UNION ALL SELECT '4','PATIENT_COUNT_XML','Number of patients','CATNUM','LA',NULL
	UNION ALL SELECT '5','PATIENT_GENDER_COUNT_XML','Gender patient breakdown','CATNUM','LA',NULL
	UNION ALL SELECT '6','PATIENT_VITALSTATUS_COUNT_XML','Vital Status patient breakdown','CATNUM','LA',NULL
	UNION ALL SELECT '7','PATIENT_RACE_COUNT_XML','Race patient breakdown','CATNUM','LA',NULL
	UNION ALL SELECT '8','PATIENT_AGE_COUNT_XML','Age patient breakdown','CATNUM','LA',NULL
	UNION ALL SELECT '9','PATIENTSET','Timeline','LIST','LA',NULL

INSERT INTO [CRC].[QT_QUERY_STATUS_TYPE]
	SELECT '1','QUEUED',' WAITING IN QUEUE TO START PROCESS'
	UNION ALL SELECT '2','PROCESSING','PROCESSING'
	UNION ALL SELECT '3','FINISHED','FINISHED'
	UNION ALL SELECT '4','ERROR','ERROR'
	UNION ALL SELECT '5','INCOMPLETE','INCOMPLETE'
	UNION ALL SELECT '6','COMPLETED','COMPLETED'
	UNION ALL SELECT '7','MEDIUM_QUEUE','MEDIUM QUEUE'
	UNION ALL SELECT '8','LARGE_QUEUE','LARGE QUEUE'
	UNION ALL SELECT '9','CANCELLED','CANCELLED'
	UNION ALL SELECT '10','TIMEDOUT','TIMEDOUT'

INSERT INTO [PM].[PM_ROLE_REQUIREMENT]
	SELECT 'PM_CELL_DATA','@','@','MANAGER',NULL,NULL,NULL,NULL,'A'
	UNION ALL SELECT 'PM_CELL_PARAMS','@','@','MANAGER',NULL,NULL,NULL,NULL,'A'
	UNION ALL SELECT 'PM_GLOBAL_PARAMS','@','@','ADMIN',NULL,NULL,NULL,NULL,'A'
	UNION ALL SELECT 'PM_HIVE_DATA','@','@','ADMIN',NULL,NULL,NULL,NULL,'A'
	UNION ALL SELECT 'PM_HIVE_PARAMS','@','@','ADMIN',NULL,NULL,NULL,NULL,'A'
	UNION ALL SELECT 'PM_PROJECT_DATA','@','@','MANAGER',NULL,NULL,NULL,NULL,'A'
	UNION ALL SELECT 'PM_PROJECT_PARAMS','@','@','MANAGER',NULL,NULL,NULL,NULL,'A'
	UNION ALL SELECT 'PM_PROJECT_USER_PARAMS','@','@','MANAGER',NULL,NULL,NULL,NULL,'A'
	UNION ALL SELECT 'PM_PROJECT_USER_ROLES','@','@','MANAGER',NULL,NULL,NULL,NULL,'A'
	UNION ALL SELECT 'PM_USER_DATA','@','@','ADMIN',NULL,NULL,NULL,NULL,'A'
	UNION ALL SELECT 'PM_USER_PARAMS','@','@','ADMIN',NULL,NULL,NULL,NULL,'A'


-- **********************************************************
-- **********************************************************
-- **** Data needed by CQ2 software
-- **********************************************************
-- **********************************************************

-- Customize XML to change query methods and sort order
INSERT INTO [PM].[PM_CELL_PARAMS] (DATATYPE_CD, CELL_ID, PROJECT_PATH, PARAM_NAME_CD, VALUE, CAN_OVERRIDE, CHANGE_DATE, ENTRY_DATE, CHANGEBY_CHAR, STATUS_CD)
	SELECT 'XML', 'CRC', '/', 'QUERY_OPTIONS_XML', '<QueryMethods><QueryMethod ID="MINHASH15">Accurate estimate (~1% error, fast)</QueryMethod><QueryMethod ID="MINHASH8">Fast estimate (~10% error, faster)</QueryMethod><QueryMethod ID="EXACT">No sampling (exact result, slow)</QueryMethod></QueryMethods>', 1, NULL, NULL, NULL, 'A'

-- Toggle between Y/N to set whether the query engine uses the CQ2 derived data tables
INSERT INTO [CRC].[CQ2_PARAMS]
	SELECT 'USE_CQ2_TABLES', 'Y'
	UNION ALL SELECT 'USE_CQ2_SKETCH_TABLES', 'Y'

-- Defines how CQ2 generates PDO XML
INSERT INTO [CRC].[PDO_OUTPUT_SET_METADATA]
	SELECT 'concept','concept_blob','CONCEPT_BLOB','4','0','0','1','0','string','1','Concept Blob','0',NULL,NULL,NULL
	UNION ALL SELECT 'concept','concept_cd','CONCEPT_CD','2','1','0','0','0','string','0','Concept Code','0',NULL,NULL,NULL
	UNION ALL SELECT 'concept','concept_path','CONCEPT_PATH','1','1','0','0','0','string','0','Concept Path','0',NULL,NULL,NULL
	UNION ALL SELECT 'concept','download_date','DOWNLOAD_DATE','6','0','0','0','1','dateTime','0','Download Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'concept','import_date','IMPORT_DATE','7','0','0','0','1','dateTime','0','Import Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'concept','name_char','NAME_CHAR','3','0','0','0','0','string','0','Name Char','0',NULL,NULL,NULL
	UNION ALL SELECT 'concept','sourcesystem_cd','SOURCESYSTEM_CD','8','0','0','0','1','string','0','Sourcesystem Code','0',NULL,NULL,NULL
	UNION ALL SELECT 'concept','update_date','UPDATE_DATE','5','0','0','0','1','dateTime','0','Update Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'concept','upload_id','UPLOAD_ID','9','0','0','0','1','int','0','Upload ID','0',NULL,NULL,NULL
	UNION ALL SELECT 'eid','download_date','DOWNLOAD_DATE','5','0','0','0','1','dateTime','0','Download Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'eid','event_id','ENCOUNTER_IDE','1','1','0','0','0','string','0','Event ID','0',NULL,'encounter_ide_source','encounter_ide_status'
	UNION ALL SELECT 'eid','import_date','IMPORT_DATE','6','0','0','0','1','dateTime','0','Import Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'eid','patient_id','PATIENT_IDE','2','0','0','0','0','string','0','Patient Ide','0',NULL,'patient_ide_source','patient_ide_status'
	UNION ALL SELECT 'eid','sourcesystem_cd','SOURCESYSTEM_CD','7','0','0','0','1','string','0','Sourcesystem Code','0',NULL,NULL,NULL
	UNION ALL SELECT 'eid','update_date','UPDATE_DATE','4','0','0','0','1','dateTime','0','Update Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'eid','upload_date','UPLOAD_DATE','3','0','0','0','1','dateTime','0','Upload Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'eid','upload_id','UPLOAD_ID','8','0','0','0','1','int','0','Upload ID','0',NULL,NULL,NULL
	UNION ALL SELECT 'event','active_status_cd','ACTIVE_STATUS_CD','3','0','1','0','0','string','0','Active Status Code','0',NULL,NULL,NULL
	UNION ALL SELECT 'event','download_date','DOWNLOAD_DATE','12','0','0','0','1','dateTime','0','Download Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'event','end_date','END_DATE','5','0','1','0','0','dateTime','0','End Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'event','event_id','ENCOUNTER_IDE','1','1','0','0','0','string','0','Event ID','0',NULL,'encounter_ide_source','encounter_ide_status'
	UNION ALL SELECT 'event','import_date','IMPORT_DATE','13','0','0','0','1','dateTime','0','Import Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'event','inout_cd','INOUT_CD','6','0','1','0','0','string','0','Inout Code','0',NULL,NULL,NULL
	UNION ALL SELECT 'event','length_of_stay','LENGTH_OF_STAY','9','0','1','0','0','int','0','Length of Stay','0',NULL,NULL,NULL
	UNION ALL SELECT 'event','location_cd','LOCATION_CD','7','0','1','0','0','string','0','Location Code','0',NULL,NULL,NULL
	UNION ALL SELECT 'event','location_path','LOCATION_PATH','8','0','1','0','0','string','0','Location Path','0',NULL,NULL,NULL
	UNION ALL SELECT 'event','patient_id','PATIENT_IDE','2','0','0','0','0','string','0','Patient Ide','0',NULL,'patient_ide_source',NULL
	UNION ALL SELECT 'event','sourcesystem_cd','SOURCESYSTEM_CD','14','0','0','0','1','string','0','Sourcesystem Code','0',NULL,NULL,NULL
	UNION ALL SELECT 'event','start_date','START_DATE','4','0','1','0','0','dateTime','0','Start Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'event','update_date','UPDATE_DATE','11','0','0','0','1','dateTime','0','Update Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'event','upload_id','UPLOAD_ID','15','0','0','0','1','int','0','Upload ID','0',NULL,NULL,NULL
	UNION ALL SELECT 'event','visit_blob','VISIT_BLOB','10','0','1','1','0','string','1','Visit Blob','0',NULL,NULL,NULL
	UNION ALL SELECT 'modifier','download_date','DOWNLOAD_DATE','6','0','0','0','1','dateTime','0','Download Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'modifier','import_date','IMPORT_DATE','7','0','0','0','1','dateTime','0','Import Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'modifier','modifier_blob','MODIFIER_BLOB','4','0','0','1','0','string','1','Modifier Blob','0',NULL,NULL,NULL
	UNION ALL SELECT 'modifier','modifier_cd','MODIFIER_CD','2','1','0','0','0','string','0','Modifier Code','0',NULL,NULL,NULL
	UNION ALL SELECT 'modifier','modifier_path','MODIFIER_PATH','1','1','0','0','0','string','0','Modifier Path','0',NULL,NULL,NULL
	UNION ALL SELECT 'modifier','name_char','NAME_CHAR','3','0','0','0','0','string','0','Name Char','0',NULL,NULL,NULL
	UNION ALL SELECT 'modifier','sourcesystem_cd','SOURCESYSTEM_CD','8','0','0','0','1','string','0','Sourcesystem Code','0',NULL,NULL,NULL
	UNION ALL SELECT 'modifier','update_date','UPDATE_DATE','5','0','0','0','1','dateTime','0','Update Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'modifier','upload_id','UPLOAD_ID','9','0','0','0','1','int','0','Upload ID','0',NULL,NULL,NULL
	UNION ALL SELECT 'observation','concept_cd','CONCEPT_CD','3','1','0','0','0','string','0','Concept Code','0','concept_name_col',NULL,NULL
	UNION ALL SELECT 'observation','confidence_num','CONFIDENCE_NUM','17','0','0','0','0','decimal','0','Confidence Num','0',NULL,NULL,NULL
	UNION ALL SELECT 'observation','download_date','DOWNLOAD_DATE','19','0','0','0','1','dateTime','0','Download Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'observation','end_date','END_DATE','14','0','0','0','0','dateTime','0','End Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'observation','event_id','ENCOUNTER_IDE','1','1','0','0','0','string','0','Event ID','0',NULL,'encounter_ide_source','encounter_ide_status'
	UNION ALL SELECT 'observation','import_date','IMPORT_DATE','20','0','0','0','1','dateTime','0','Import Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'observation','instance_num','INSTANCE_NUM','7','1','0','0','0','int','0','Instance Num','0',NULL,NULL,NULL
	UNION ALL SELECT 'observation','location_cd','LOCATION_CD','15','0','0','0','0','string','0','Location Code','0',NULL,NULL,NULL
	UNION ALL SELECT 'observation','modifier_cd','MODIFIER_CD','6','1','0','0','0','string','0','Modifier Code','0','modifier_name_char',NULL,NULL
	UNION ALL SELECT 'observation','nval_num','NVAL_NUM','10','0','0','0','0','decimal','0','Nval Num','0',NULL,NULL,NULL
	UNION ALL SELECT 'observation','observation_blob','OBSERVATION_BLOB','16','0','0','1','0','string','1','Observation Blob','0',NULL,NULL,NULL
	UNION ALL SELECT 'observation','observer_cd','PROVIDER_ID','4','1','0','0','0','string','0','Provider ID','0','provider_name_char',NULL,NULL
	UNION ALL SELECT 'observation','patient_id','PATIENT_IDE','2','0','0','0','0','string','0','Patient Ide','0',NULL,'patient_ide_source','patient_ide_status'
	UNION ALL SELECT 'observation','quantity_num','QUANTITY_NUM','12','0','0','0','0','decimal','0','Quantity Num','0',NULL,NULL,NULL
	UNION ALL SELECT 'observation','sourcesystem_cd','SOURCESYSTEM_CD','21','0','0','0','1','string','0','Sourcesystem Code','0',NULL,NULL,NULL
	UNION ALL SELECT 'observation','start_date','START_DATE','5','1','0','0','0','dateTime','0','Start Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'observation','tval_char','TVAL_CHAR','9','0','0','0','0','string','0','Tval Char','0',NULL,NULL,NULL
	UNION ALL SELECT 'observation','units_cd','UNITS_CD','13','0','0','0','0','string','0','Units Code','0',NULL,NULL,NULL
	UNION ALL SELECT 'observation','update_date','UPDATE_DATE','18','0','0','0','1','dateTime','0','Update Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'observation','upload_id','UPLOAD_ID','22','0','0','0','1','int','0','Upload ID','0',NULL,NULL,NULL
	UNION ALL SELECT 'observation','valtype_cd','VALTYPE_CD','8','0','0','0','0','string','0','Valtype Code','0',NULL,NULL,NULL
	UNION ALL SELECT 'observation','valueflag_cd','VALUEFLAG_CD','11','0','0','0','0','string','0','Valueflag Code','0',NULL,NULL,NULL
	UNION ALL SELECT 'observer','download_date','DOWNLOAD_DATE','6','0','0','0','1','dateTime','0','Download Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'observer','import_date','IMPORT_DATE','7','0','0','0','1','dateTime','0','Import Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'observer','name_char','NAME_CHAR','3','0','0','0','0','string','0','Name Char','0',NULL,NULL,NULL
	UNION ALL SELECT 'observer','observer_cd','PROVIDER_ID','1','1','0','0','0','string','0','Provider ID','0',NULL,NULL,NULL
	UNION ALL SELECT 'observer','provider_blob','PROVIDER_BLOB','4','0','0','1','0','string','1','Provider Blob','0',NULL,NULL,NULL
	UNION ALL SELECT 'observer','provider_path','PROVIDER_PATH','2','1','0','0','0','string','0','Provider Path','0',NULL,NULL,NULL
	UNION ALL SELECT 'observer','sourcesystem_cd','SOURCESYSTEM_CD','8','0','0','0','1','string','0','Sourcesystem Code','0',NULL,NULL,NULL
	UNION ALL SELECT 'observer','update_date','UPDATE_DATE','5','0','0','0','1','dateTime','0','Update Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'observer','upload_id','UPLOAD_ID','9','0','0','0','1','int','0','Upload ID','0',NULL,NULL,NULL
	UNION ALL SELECT 'patient','age_in_years_num','AGE_IN_YEARS_NUM','6','0','1','0','0','int','0','Age','0',NULL,NULL,NULL
	UNION ALL SELECT 'patient','birth_date','BIRTH_DATE','3','0','1','0','0','dateTime','0','Birth Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'patient','death_date','DEATH_DATE','4','0','1','0','0','dateTime','0','Death Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'patient','download_date','DOWNLOAD_DATE','16','0','0','0','1','dateTime','0','Download Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'patient','import_date','IMPORT_DATE','17','0','0','0','1','dateTime','0','Import Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'patient','income_cd','INCOME_CD','13','0','1','0','0','string','0','Income','0',NULL,NULL,NULL
	UNION ALL SELECT 'patient','language_cd','LANGUAGE_CD','7','0','1','0','0','string','0','Language','0',NULL,NULL,NULL
	UNION ALL SELECT 'patient','marital_status_cd','MARITAL_STATUS_CD','9','0','1','0','0','string','0','Marital Status','0',NULL,NULL,NULL
	UNION ALL SELECT 'patient','patient_blob','PATIENT_BLOB','14','0','1','1','0','string','1','Patient Blob','0',NULL,NULL,NULL
	UNION ALL SELECT 'patient','patient_id','PATIENT_IDE','1','1','0','0','0','string','0','Patient ID','0',NULL,'patient_ide_source','patient_ide_status'
	UNION ALL SELECT 'patient','race_cd','RACE_CD','8','0','1','0','0','string','0','Race','0',NULL,NULL,NULL
	UNION ALL SELECT 'patient','religion_cd','RELIGION_CD','10','0','1','0','0','string','0','Religion','0',NULL,NULL,NULL
	UNION ALL SELECT 'patient','sex_cd','SEX_CD','5','0','1','0','0','string','0','Gender','0',NULL,NULL,NULL
	UNION ALL SELECT 'patient','sourcesystem_cd','SOURCESYSTEM_CD','18','0','0','0','1','string','0','Source System','0',NULL,NULL,NULL
	UNION ALL SELECT 'patient','statecityzip_path','STATECITYZIP_PATH','12','0','1','0','0','string','0','Zip Code Hierarchy','0',NULL,NULL,NULL
	UNION ALL SELECT 'patient','update_date','UPDATE_DATE','15','0','0','0','1','dateTime','0','Update Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'patient','upload_id','UPLOAD_ID','19','0','0','0','1','int','0','Upload ID','0',NULL,NULL,NULL
	UNION ALL SELECT 'patient','vital_status_cd','VITAL_STATUS_CD','2','0','1','0','0','string','0','Date Accuracy Code','0',NULL,NULL,NULL
	UNION ALL SELECT 'patient','zip_cd','ZIP_CD','11','0','1','0','0','string','0','Zip Code','0',NULL,NULL,NULL
	UNION ALL SELECT 'pid','download_date','DOWNLOAD_DATE','4','0','0','0','1','dateTime','0','Download Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'pid','import_date','IMPORT_DATE','5','0','0','0','1','dateTime','0','Import Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'pid','patient_id','PATIENT_IDE','1','1','0','0','0','string','0','Patient ID','0',NULL,'patient_ide_source','patient_ide_status'
	UNION ALL SELECT 'pid','patient_map_id','PATIENT_MAP_ID','8','0','0','0','0','xmlExact','0','Patient Map ID','0',NULL,NULL,NULL
	UNION ALL SELECT 'pid','sourcesystem_cd','SOURCESYSTEM_CD','6','0','0','0','1','string','0','Sourcesystem Code','0',NULL,NULL,NULL
	UNION ALL SELECT 'pid','update_date','UPDATE_DATE','3','0','0','0','1','dateTime','0','Update Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'pid','upload_date','UPLOAD_DATE','2','0','0','0','1','dateTime','0','Upload Date','0',NULL,NULL,NULL
	UNION ALL SELECT 'pid','upload_id','UPLOAD_ID','7','0','0','0','1','int','0','Upload ID','0',NULL,NULL,NULL


-- **********************************************************
-- **********************************************************
-- **** Project and user tables
-- **********************************************************
-- **********************************************************

-------------------------------------------------------------
-- HIVE
-------------------------------------------------------------

INSERT INTO [HIVE].[SERVICE_LOOKUP]
	SELECT 'PMService', 'PM', NULL
	UNION ALL SELECT 'OntologyService', 'ONT', 'HIVE.ONT_DB_LOOKUP'
	UNION ALL SELECT 'QueryToolService', 'CRC', 'HIVE.CRC_DB_LOOKUP'
	UNION ALL SELECT 'WorkplaceService', 'WORK', 'HIVE.WORK_DB_LOOKUP'

INSERT INTO [HIVE].[CRC_DB_LOOKUP]
	SELECT 'i2b2demo','/Demo/','@','CRC','','SQLSERVER','CRC',NULL,NULL,NULL,NULL,'A'

INSERT INTO [HIVE].[ONT_DB_LOOKUP]
	SELECT 'i2b2demo','/Demo/','@','ONT','','SQLSERVER','ONT',NULL,NULL,NULL,NULL,'A'

INSERT INTO [HIVE].[WORK_DB_LOOKUP]
	SELECT 'i2b2demo','/Demo/','@','WORK','','SQLSERVER','WORK',NULL,NULL,NULL,NULL,'A'

-------------------------------------------------------------
-- PM
-------------------------------------------------------------

INSERT INTO [PM].[PM_HIVE_DATA]
	SELECT 'i2b2','http://www.i2b2.org','i2b2demo','PRODUCTION','1',NULL,NULL,NULL,'A'

INSERT INTO [PM].[PM_CELL_DATA]
	SELECT 'CRC','/','Data Repository','REST','http://localhost/i2b2/services/?/QueryToolService/','1',NULL,NULL,NULL,'A'
	UNION ALL SELECT 'ONT','/','Ontology Cell','REST','http://localhost/i2b2/services/?/OntologyService/','1',NULL,NULL,NULL,'A'
	UNION ALL SELECT 'WORK','/','Workplace Cell','REST','http://localhost/i2b2/services/?/WorkplaceService/','1',NULL,NULL,NULL,'A'

INSERT INTO [PM].[PM_PROJECT_DATA]
	SELECT 'Demo','i2b2 Demo','http://www.i2b2.org',NULL,'/Demo/',NULL,NULL,NULL,NULL,'A'

INSERT INTO [PM].[PM_USER_DATA]
	SELECT 'AGG_SERVICE_ACCOUNT','AGG_SERVICE_ACCOUNT','9117d59a69dc49807671a51f10ab7f',NULL,NULL,NULL,NULL,NULL,'A'
	UNION ALL SELECT 'demo','i2b2 User','9117d59a69dc49807671a51f10ab7f',NULL,NULL,NULL,NULL,NULL,'A'
	UNION ALL SELECT 'i2b2','i2b2 Admin','9117d59a69dc49807671a51f10ab7f',NULL,NULL,NULL,NULL,NULL,'A'

INSERT INTO [PM].[PM_PROJECT_USER_ROLES]
	SELECT '@','i2b2','ADMIN',NULL,NULL,NULL,'A'
	UNION ALL SELECT 'Demo','AGG_SERVICE_ACCOUNT','DATA_AGG',NULL,NULL,NULL,'A'
	UNION ALL SELECT 'Demo','AGG_SERVICE_ACCOUNT','DATA_OBFSC',NULL,NULL,NULL,'A'
	UNION ALL SELECT 'Demo','AGG_SERVICE_ACCOUNT','MANAGER',NULL,NULL,NULL,'A'
	UNION ALL SELECT 'Demo','AGG_SERVICE_ACCOUNT','USER',NULL,NULL,NULL,'A'
	UNION ALL SELECT 'Demo','demo','DATA_AGG',NULL,NULL,NULL,'A'
	UNION ALL SELECT 'Demo','demo','DATA_DEID',NULL,NULL,NULL,'A'
	UNION ALL SELECT 'Demo','demo','DATA_LDS',NULL,NULL,NULL,'A'
	UNION ALL SELECT 'Demo','demo','DATA_OBFSC',NULL,NULL,NULL,'A'
	UNION ALL SELECT 'Demo','demo','DATA_PROT',NULL,NULL,NULL,'A'
	UNION ALL SELECT 'Demo','demo','EDITOR',NULL,NULL,NULL,'A'
	UNION ALL SELECT 'Demo','demo','USER',NULL,NULL,NULL,'A'
	UNION ALL SELECT 'Demo','i2b2','DATA_OBFSC',NULL,NULL,NULL,'A'
	UNION ALL SELECT 'Demo','i2b2','MANAGER',NULL,NULL,NULL,'A'
	UNION ALL SELECT 'Demo','i2b2','USER',NULL,NULL,NULL,'A'

-------------------------------------------------------------
-- WORK
-------------------------------------------------------------

INSERT INTO [WORK].[WORKPLACE_ACCESS]
	SELECT 'demo','WORKPLACE','N','0','@','@','@','N','0',NULL,'CA ','@',NULL,NULL,NULL
	UNION ALL SELECT 'demo','WORKPLACE','N','0','SHARED','shared','demo','Y','100',NULL,'CA ','SHARED',NULL,NULL,NULL


-- **********************************************************
-- **********************************************************
-- **** Ontology related tables
-- **********************************************************
-- **********************************************************

INSERT INTO [CRC].[QT_BREAKDOWN_PATH]
	SELECT 'PATIENT_GENDER_COUNT_XML','\\i2b2_DEMO\i2b2\Demographics\Gender\',NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_RACE_COUNT_XML','\\i2b2_DEMO\i2b2\Demographics\Race\',NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_VITALSTATUS_COUNT_XML','\\i2b2_DEMO\i2b2\Demographics\Vital Status\',NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_AGE_COUNT_XML','\\i2b2_DEMO\i2b2\Demographics\Age\',NULL,NULL,NULL

INSERT INTO [ONT].[SCHEMES]
	SELECT '(null)','None','No scheme'
	UNION ALL SELECT 'DEM|AGE:','DEM|AGE','Age of patient from demographics data'
	UNION ALL SELECT 'DEM|DATE:','DEM|DATE','Patient date of birth from demographics data'
	UNION ALL SELECT 'DEM|LANGUAGE:','DEM|LANGUAGE','Primary language spoken by patient'
	UNION ALL SELECT 'DEM|MARITAL:','DEM|MARITAL','Marital Status of patient'
	UNION ALL SELECT 'DEM|RACE:','DEM|RACE','Race of patient'
	UNION ALL SELECT 'DEM|RELIGION:','DEM|RELIGION','Religion of patient'
	UNION ALL SELECT 'DEM|SEX:','DEM|SEX','Gender of patient'
	UNION ALL SELECT 'DEM|VITAL:','DEM|VITAL','Vital status of patient'
	UNION ALL SELECT 'DEM|ZIPCODE:','DEM|ZIPCODE',NULL
	UNION ALL SELECT 'DSG-NLP:','DSG-NLP','Natural Language Processing Data'
	UNION ALL SELECT 'ICD10:','ICD10','ICD10 code for diagnoses'
	UNION ALL SELECT 'ICD9:','ICD9','ICD9 code for diagnoses and procedures'
	UNION ALL SELECT 'LCS-I2B2:','LCS-I2B2',NULL
	UNION ALL SELECT 'LOINC:','LOINC','Lab codes'
	UNION ALL SELECT 'NDC:','NDC','National Drug Code'
	UNION ALL SELECT 'UMLS:','UMLS','United Medical Language System'

INSERT INTO [ONT].[TABLE_ACCESS]
	SELECT 'i2b2_DEMO','I2B2','N',NULL,'1','\i2b2\Demographics\','Demographics','N','CA ',NULL,NULL,NULL,'concept_cd','concept_dimension','concept_path','T','LIKE','\i2b2\Demographics\',NULL,'Demographics',NULL,NULL,NULL,NULL
	UNION ALL SELECT 'i2b2_DIAG','I2B2','N',NULL,'1','\i2b2\Diagnoses\','Diagnoses','N','FA ',NULL,NULL,NULL,'concept_cd','concept_dimension','concept_path','T','LIKE','\i2b2\Diagnoses\',NULL,'Diagnoses',NULL,NULL,NULL,NULL
	UNION ALL SELECT 'i2b2_LABS','I2B2','N',NULL,'1','\i2b2\Labtests\','Laboratory Tests','N','FA ',NULL,NULL,NULL,'concept_cd','concept_dimension','concept_path','T','LIKE','\i2b2\Labtests\',NULL,'Labtests',NULL,NULL,NULL,NULL
	UNION ALL SELECT 'i2b2_MEDS','I2B2','N',NULL,'1','\i2b2\Medications\','Medications','N','FA ',NULL,NULL,NULL,'concept_cd','concept_dimension','concept_path','T','LIKE','\i2b2\Medications\',NULL,'Medications',NULL,NULL,NULL,NULL
	UNION ALL SELECT 'i2b2_PROC','I2B2','N',NULL,'1','\i2b2\Procedures\','Procedures','N','FA ',NULL,NULL,NULL,'concept_cd','concept_dimension','concept_path','T','LIKE','\i2b2\Procedures\',NULL,'Procedures',NULL,NULL,NULL,NULL
	UNION ALL SELECT 'i2b2_PROV','I2B2','N',NULL,'1','\i2b2\Providers\','Providers','N','FA ',NULL,NULL,NULL,'concept_cd','concept_dimension','concept_path','T','LIKE','\i2b2\Providers\',NULL,'Providers',NULL,NULL,NULL,NULL
	UNION ALL SELECT 'i2b2_VISIT','I2B2','N',NULL,'1','\i2b2\Visit Details\','Visit Details','N','CA ',NULL,NULL,NULL,'concept_cd','concept_dimension','concept_path','T','LIKE','\i2b2\Visit Details\',NULL,'Visit Details',NULL,NULL,NULL,NULL

INSERT INTO [CRC].[CODE_LOOKUP]
	SELECT 'OBSERVATION_FACT','MODIFIER_CD','0','Admitting',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'OBSERVATION_FACT','MODIFIER_CD','1','Primary',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'OBSERVATION_FACT','MODIFIER_CD','2','Secondary',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:@','Not Recorded-@',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:7a','Seventh Day Adventist-7A',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:7th day advent','Seventh Day Adventist-7TH DAY ADVENT',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:ac','Advent Christian-AC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:aca','Armenian Catholic-ACA',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:acat','Armenian Catholic-ACAT',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:advent christian','Advent Christian-ADVENT CHRISTIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:ag','Agnostic-AG',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:agnostic','Agnostic-AGNOSTIC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:ai','American Indian-AI',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:amer indian','American Indian-AMER INDIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:an','Anglican-AN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:anglican','Anglican-ANGLICAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:armenian catholic','Armenian Catholic-ARMENIAN CATHOLIC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:as','Assembly of God-AS',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:assemb of god','Assembly of God-ASSEMB OF GOD',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:at','Atheist-AT',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:ath','Atheist-ATH',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:atheist','Atheist-ATHEIST',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:ba','Bahai-BA',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:bahai','Bahai-BAHAI',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:baptist','Baptist-BAPTIST',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:bp','Baptist-BP',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:bu','Buddhist-BU',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:buddhist','Buddhist-BUDDHIST',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:ca','Catholic-CA',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:car','Charismatic-CAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:catholic','Catholic-CATHOLIC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:ch','Christian-CH',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:charismatic','Charismatic-CHARISMATIC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:christian','Christian-CHRISTIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:christian science','Christian Scientist-CHRISTIAN SCIENCE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:church of england','Church of England',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:church of god','Church of God',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:co','Congregational-CO',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:congragational','Congregational-CONGRAGATIONAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:congregational','Congregational-CONGREGATIONAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:cor','Christian Orth',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:cs','Christian Scientist-CS',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:dc','Disciples Of Christ-DC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:de','Deferred-DE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:deferred','Deferred-DEFERRED',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:disciples of christ','Disciples Of Christ-DISCIPLES OF CHRIST',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:eastern orthodox','Eastern Orthodox-EASTERN ORTHODOX',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:ec','Evangelical Christian-EC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:eo','Eastern Orthodox-EO',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:ep','Episcopal-EP',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:episcopal','Episcopal-EPISCOPAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:evang. christian','Evangelical Christian-EVANG. CHRISTIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:go','Greek Orthodox-GO',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:greek orthodox','Greek Orthodox-GREEK ORTHODOX',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:hi','Hindu-HI',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:hindu','Hindu-HINDU',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:is','Islamic-IS',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:islamic','Islamic-ISLAMIC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:jehov. witness','Jehovah''s Witness-JEHOV. WITNESS',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:jehov.witness','Jehovah''s Witness-JEHOV.WITNESS',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:jewish','Jewish',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:jh','Jewish',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:jv','Jehovah''s Witness-JV',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:jw','Jehovah''s Witness-JW',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:lu','Lutheran-LU',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:lutheran','Lutheran-LUTHERAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:maronite catholic','Maronite Catholic-MC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:mc','Maronite Catholic-MARONITE CATHOLIC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:me','Methodist-ME',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:melkite catholic','Melkite Catholic-MELKITE CATHOLIC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:mennonite','Mennonite',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:methodist','Methodist-METHODIST',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:mkc','Melkite Catholic-MKC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:mo','Mormon-MO',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:mormon (lds)','Mormon-MORMON (LDS)',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:ms','Moslem',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:mu','Muslim-MU',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:muslim','Muslim-MUSLIM',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:na','Nazarene-NAZ',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:naf','Not Affiliated',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:nazarene','Nazarene-NAZARENE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:nd','Non-denominational-ND',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:ndn','Non-denominational-NDN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:no','None-NO',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:no pref','No Preference-NO PREF',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:no visit','No Visit',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:non-denom','Non-denominational-NON-DENOM',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:none','None-NONE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:np','Not Recorded-NP',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:nsp','No Preference-NSP',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:oc','Orthodox Christian-OC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:or','Orthodox-OR',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:orthodox','Orthodox-ORTHODOX',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:orthodox christian','Orthodox Christian-ORTHODOX CHRISTIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:ot','Other-OT',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:other','Other-OTHER',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:pe','Pentecostal-PE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:pentecostal','Pentecostal-PENTECOSTAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:pr','Protestant-PR',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:presbyterian','Presbyterian-PRESBYTERIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:protestant','Protestant-PROTESTANT',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:ps','Presbyterian-PS',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:qu','Quaker-QU',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:quaker','Quaker-QUAKER',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:rc','Roman Catholic-RC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:ref','Not Recorded-REF',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:religious science','Religious Science-RS',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:ro','Russian Orthodox-RO',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:roman catholic','Roman Catholic-ROMAN CATHOLIC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:rs','Religious Science-RELIGIOUS SCIENCE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:russian orth.','Russian Orthodox-RUSSIAN ORTH.',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:sa','Salvation Army-SA',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:salv. army','Salvation Army-SALV. ARMY',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:sb','Southern Baptist-SB',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:sci','Scientology-SCI',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:scientology','Scientology-SCIENTOLOGY',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:sd','Seventh Day Adventist-SD',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:si','Sikh-SI',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:sikh','Sikh-SIKH',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:southern baptist','Southern Baptist-SOUTHERN BAPTIST',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:sp','Spiritualist-SP',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:spiritualist','Spiritualist-SPIRITUALIST',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:swe','Swedenborgia-SWE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:swedenborgian','Swedenborgian-SWEDENBORGIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:ua','Unaffiliated',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:ucc','United Church of Christ-UCC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:un','Unknown-UN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:unitarian','Unitarian-UNITARIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:unitarian univers.','Unitarian Universal-UNITARIAN UNIVERS.',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:united church christ','United Church of Christ-UNITED CHURCH CHRIST',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:united church of christ','United Church of Christ-UNITED CHURCH  OF CHRIST',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:unknown','Unknown-UNKNOWN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:uu','Unitarian-UU',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:uv','Unitarian Universal-UV',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:wi','Wiccan-WI',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:wiccan','Wiccan-WICCAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:zor','Zoroastrian-ZOR',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','RELIGION_CD','DEM|RELIGION:zoroastrian','Zoroastrian-ZOROASTRIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','SEX_CD','DEM|SEX:@','Unknown-@',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','SEX_CD','DEM|SEX:f','Female',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','SEX_CD','DEM|SEX:m','Male',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','SEX_CD','DEM|SEX:u','Unknown-U',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','VITAL_STATUS_CD','DEM|VITAL:@','Not recorded',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','VITAL_STATUS_CD','DEM|VITAL:n','Living',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','VITAL_STATUS_CD','DEM|VITAL:x','Deferred',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'PATIENT_DIMENSION','VITAL_STATUS_CD','DEM|VITAL:y','Deceased',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:@','Not recorded-@',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:abo','Aborigines-ABO',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:aborigines','Aborigines-ABORIGINES',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:alba','Albanian-ALBA',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:albanian','Albanian-ALBANIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:amer. sign lang','American Sign Language-AMER. SIGN LANG',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:amha','Ethiopian-Amharic-AMHA',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:arab','Arabic-ARAB',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:arabic','Arabic-ARABIC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:arme','Armenian-ARME',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:armenian','Armenian-ARMENIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:asl','American Sign Language-ASL',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:beng','Bengali-BENG',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:bengali','Bengali-BENGALI',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:bosn','Bosnian-BOSN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:bosnian','Bosnian-BOSNIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:bulg','Bulgarian-BULG',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:bulgarian','Bulgarian-BULGARIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:burm','Burmese-BURM',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:burmese','Burmese-BURMESE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:camb','Cambodian-CAMB',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:cambodian','Cambodian-CAMBODIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:cant','Chinese-Cantonese-CANT',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:cape','Cape Verdean-CAPE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:cape verd-creole','Cape Verdean Creole-CAPE VERD-CREOLE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:cape verd-portuguese','Cape Verdean Portugese-CAPE VERD-PORTUGUESE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:cape verdean','Cape Verdean-CAPE VERDEAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:capp','Cape Verdean Portugese-CAPP',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:ccv','Cape Verdean Creole-CCV',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:chin','Chinese-CHIN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:chinese','Chinese-CHINESE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:chinese-cant.','Chinese-Cantonese-CHINESE-CANT.',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:chinese-mand.','Chinese-Mandarin-CHINESE-MAND.',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:chinese-toisan','Chinese-Toisan-CHINESE-TOISAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:creo','Creole French',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:creole','Creole',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:czech','Czech-CZECH',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:czek','Czech-CZEK',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:dane','Danish-DANE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:danish','Danish-DANISH',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:dutc','Dutch-DUTC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:dutch','Dutch-DUTCH',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:engl','English-ENGL',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:english','English-ENGLISH',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:erit','Eritrean-ERIT',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:eritrean','Eritrean-ERITREAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:ethiopian-amharic','Ethiopian-Amharic-ETHIOPIAN-AMHARIC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:ethiopian-tigrinya','Ethiopian-Tigrinia-ETHIOPIAN-TIGRINYA',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:fars','Farsi-FARS',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:farsi-persian','Farsi-FARSI-PERSIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:frc','French Canadian',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:frcr','French Creole-FRCR',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:fren','French-FREN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:french','French-FRENCH',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:french creole','French Creole-FRENCH CREOLE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:germ','German-GERM',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:german','German-GERMAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:greek','Greek-GREEK',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:grek','Greek-GREK',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:guga','Gujarat-GUGA',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:gugarati','Gujarati-GUGARATI',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:haitian','Haitian-HAITIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:haitian-fr.creole','Haitian French Creole-HAITIAN-FR.CREOLE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:hati','Haitian-HATI',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:hc','Haitian French Creole-HC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:hebr','Hebrew-HEBR',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:hebrew','Hebrew-HEBREW',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:hindi','Hindi-HINDI',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:hmong','Hmong-HMONG',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:hndi','Hindi-HNDI',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:hung','Hungarian-HUNG',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:hungarian','Hungarian-HUNGARIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:indian-native','Native Indian-INDIAN-NATIVE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:islandic','Islandic-ISLANDIC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:isle','Islandic-ISLE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:ital','Italian-ITAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:italian','Italian-ITALIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:japa','Japanese-JAPA',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:japanese','Japanese-JAPANESE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:kn','KN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:kore','Korean-KORE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:korean','Korean-KOREAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:laot','Laotian-LAOT',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:laotian','Laotian-LAOTIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:latv','Latvian-LATV',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:latvian','Latvian-LATVIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:libe','Liberian-LIBE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:liberian','Liberian-LIBERIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:lith','Lithuanian-LITH',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:lithuanian','Lithuanian-LITHUANIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:mand','Chinese-Mandarin-MAND',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:mong','Hmong-MONG',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:mute','Mute / Illiterate',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:na','Native Indian-NA',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:natv','Native Indian-NATV',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:nav','Navajo-NAV',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:navajo','Navajo-NAVAJO',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:nez','Nez Perce-NEZ',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:nez perce','Nez Perce-NEZ PERCE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:nige','Nigerian-NIGE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:nigerian','Nigerian-NIGERIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:norw','Norwegian-NORW',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:norwegian','Norwegian-NORWEGIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:othe','Other-OTHE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:other','Other-OTHER',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:pol','Polish-POL',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:polish','Polish-POLISH',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:por','Portuguese-POR',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:port','Portuguese-PORT',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:portuguese','Portuguese-PORTUGUESE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:prci','Persian Farsi',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:punj','Punjabi-PUNJ',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:punjabi','Punjabi-PUNJABI',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:rom','Romanian-ROM',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:romanian','Romanian-ROMANIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:russ','Russian-RUSS',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:russian','Russian-RUSSIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:ser','Serbo-Croation-SER',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:serbo-croatian','Serbo-Croation-SERBO-CROATIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:shnd','Shonal Ndebele-SHND',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:shonal ndebele','Shonal Ndebele-SHONAL NDEBELE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:sign','Sign Language-SIGN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:sign lang','Sign Language-SIGN LANG',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:soma','Somalian-SOMA',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:somalian','Somalian-SOMALIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:span','Spanish-SPAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:span-engl','Spanish English-SPAN-ENGL',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:spanish','Spanish-SPANISH',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:spen','Spanish English-SPEN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:swah','Swahil-SWAH',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:swahili','Swahil-SWAHILI',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:swed','Swedish-SWED',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:swedish','Swedish-SWEDISH',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:taga','Tagalag-TAGA',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:tagalag','Tagalag-TAGALAG',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:tagalog','Tagalog',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:taiw','Taiwanese-TAIW',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:taiwanese','Taiwanese-TAIWANESE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:tami','Tamil-TAMI',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:tamil','Tamil-TAMIL',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:test','Not recorded-TEST',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:thai','Thai',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:tibe','Tibetan-TIBE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:tibetan','Tibetan-TIBETAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:tigr','Ethiopian-Tigrinia-TIGR',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:tois','Chinese-Toisan-TOIS',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:turk','Turkish-TURK',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:turkish','Turkish-TURKISH',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:u','Not recorded-U',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:ukra','Ukranian\UKRA',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:ukrainian','Ukranian\UKRAINIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:unknown','Unknown-UNKNOWN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:urdu','Urdu',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:viet','Vietnamese-VIET',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:vietnamese','Vietnamese-VIETNAMESE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:ydsh','Yiddish-YDSH',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:yiddish','Yiddish-YIDDISH',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:yugo','Yugoslavian-YUGO',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','LANGUAGE_CD','DEM|LANGUAGE:yugoslavian','Yugoslavian-YUGOSLAVIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:@','Not Recorded-@',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:a','Asian-A',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:al','Aleutian-AL',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:aleutian','Aleutian-ALEUTIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:amer. indian','American Indian-AMER. INDIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:api','Asian Pacific Islander-API',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:asian','Asian-ASIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:asian/pac. isl','Asian Pacific Islander-ASIAN PAC ISL',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:b','Black-B',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:black','Black-BLACK',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:c','White-C',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:d','Not Recorded-D',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:deferred','Not Recorded-DEFERRED',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:es','Eskimo-ES',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:eskimo','Eskimo-ESKIMO',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:h','Hispanic-H',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:hib','Hispanic Black-HIB',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:his/black','Hispanic Black-HIS BLACK',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:his/white','Hispanic White-HIS WHITE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:hispanic','Hispanic-HISPANIC',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:hiw','Hispanic White-HIW',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:i','American Indian-I',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:in','Indian-IN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:indian','Indian-INDIAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:m','Middle Eastern-M',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:mid.eastern','Middle Eastern-MID EASTERN',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:mr','Multiracial-MR',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:multi','Multiracial-MULTI',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:na','Native American-NA',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:na.esk','Eskimo-NA ESK',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:nat. am.','Native American-NAT AM',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:navajo','Navajo-NAVAJO',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:ni','Native American-NI',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:nv','Navajo-NV',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:o','Other-O',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:or','Oriental-OR',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:oriental','Oriental-ORIENTAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:other','Other-OTHER',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:r','Not Recorded-R',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:refused','Not Recorded-REFUSED',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:u','Not Recorded-U',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:unk','Not Recorded-UNK',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:w','White-W',NULL,NULL,NULL,NULL,NULL,NULL,NULL
	UNION ALL SELECT 'VISIT_DIMENSION','RACE_CD','DEM|RACE:white','White-WHITE',NULL,NULL,NULL,NULL,NULL,NULL,NULL
