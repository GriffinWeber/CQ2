/*
This script creates a user for the CQ2 API to use to access the database. This user has the minimum necessary permissions to run CQ2
This user does not have sufficient permissions to update the data in CQ2 or perform other administrative tasks.

Before running this script change the password on line 17 to a more secure value. 

For some installations of CQ2 further modifications may be needed to this script. 
These modifications are:
	1. Grant select permission to any additional ontology tables referenced in any ontology table_access table 
	2. Grant select permission to any additional tables referenced in any workplace_access tables.
	3. Modify schema names if ontology, crc and workplace cells are placed in non-standard schemas.
	4. Replicate all lines related to a specific schema when when schemas are replicated for additional projects.
*/

USE [master]
GO
CREATE LOGIN [CQ2] WITH PASSWORD=N'Password1234', DEFAULT_DATABASE=[CQ2], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [CQ2]
GO
CREATE USER [CQ2] FOR LOGIN [CQ2] WITH DEFAULT_SCHEMA=[dbo]
GO
GRANT EXEC ON HIVE.uspGetResponse TO CQ2
GRANT EXEC ON ONT.uspGetResponse TO CQ2
GRANT EXEC ON ONT.uspRunOperation TO CQ2
GRANT EXEC ON CRC.uspGetResponse TO CQ2
GRANT EXEC ON CRC.uspRunQueryInstance TO CQ2
GRANT EXEC ON CRC.uspRunQueryInstanceQM TO CQ2
GRANT EXEC ON CRC.uspRunQueryInstanceSubquery TO CQ2
GRANT EXEC ON CRC.uspRunQueryInstanceBreakdown TO CQ2
GRANT EXEC ON CRC.uspRunPSM TO CQ2
GRANT EXEC ON CRC.uspRunPDO TO CQ2
GRANT EXEC ON CRC.uspRunGetNameInfo TO CQ2
GRANT EXEC ON WORK.uspGetResponse TO CQ2
GRANT EXEC ON WORK.uspRunOperation TO CQ2
GRANT EXEC ON PM.uspGetAuthenticate TO CQ2
GRANT EXEC ON PM.uspGetResponse TO CQ2
GRANT EXEC ON PM.uspGetServices TO CQ2
GO

GRANT SELECT ON HIVE.ONT_DB_LOOKUP TO CQ2
GRANT SELECT ON HIVE.CRC_DB_LOOKUP TO CQ2
GRANT SELECT ON HIVE.WORK_DB_LOOKUP TO CQ2
GRANT SELECT ON ONT.TABLE_ACCESS TO CQ2
GRANT SELECT ON ONT.i2b2 TO CQ2 /** All tables referenced in [ONT].[TABLE_ACCESS] need read access - ONT.i2b2 is the only table in a default install **/

GRANT SELECT ON [CRC].[CODE_LOOKUP] TO CQ2
GRANT SELECT ON [CRC].[CONCEPT_DIMENSION] TO CQ2
GRANT SELECT ON [CRC].[CQ2_CONCEPT_PATH] TO CQ2
GRANT SELECT ON [CRC].[CQ2_CONCEPT_PATH_CODE] TO CQ2
GRANT SELECT ON [CRC].[CQ2_FACT_COUNTS_CONCEPT] TO CQ2
GRANT SELECT ON [CRC].[CQ2_FACT_COUNTS_CONCEPT_PATIENT] TO CQ2
GRANT SELECT ON [CRC].[CQ2_FACT_COUNTS_PATH] TO CQ2
GRANT SELECT ON [CRC].[CQ2_FACT_COUNTS_PATH_PATIENT] TO CQ2
GRANT SELECT ON [CRC].[CQ2_PARAMS] TO CQ2
GRANT SELECT ON [CRC].[CQ2_SKETCH_PATH15x256] TO CQ2
GRANT SELECT ON [CRC].[CQ2_SKETCH_PATH8x256] TO CQ2
GRANT SELECT ON [CRC].[CQ2_SKETCH_PATIENT] TO CQ2
GRANT SELECT ON [CRC].[ENCOUNTER_MAPPING] TO CQ2
GRANT SELECT ON [CRC].[MODIFIER_DIMENSION] TO CQ2
GRANT SELECT ON [CRC].[OBSERVATION_FACT] TO CQ2
GRANT SELECT ON [CRC].[PATIENT_DIMENSION] TO CQ2
GRANT SELECT ON [CRC].[PATIENT_MAPPING] TO CQ2
GRANT SELECT ON [CRC].[PDO_OUTPUT_SET_METADATA] TO CQ2
GRANT SELECT ON [CRC].[PROVIDER_DIMENSION] TO CQ2
GRANT SELECT ON [CRC].[QT_ANALYSIS_PLUGIN] TO CQ2
GRANT SELECT ON [CRC].[QT_ANALYSIS_PLUGIN_RESULT_TYPE] TO CQ2
GRANT SELECT ON [CRC].[QT_BREAKDOWN_PATH] TO CQ2
GRANT SELECT ON [CRC].[QT_PATIENT_ENC_COLLECTION] TO CQ2
GRANT INSERT ON [CRC].[QT_PATIENT_ENC_COLLECTION] TO CQ2
GRANT UPDATE ON [CRC].[QT_PATIENT_ENC_COLLECTION] TO CQ2
GRANT SELECT ON [CRC].[QT_PATIENT_SET_COLLECTION] TO CQ2
GRANT INSERT ON [CRC].[QT_PATIENT_SET_COLLECTION] TO CQ2
GRANT UPDATE ON [CRC].[QT_PATIENT_SET_COLLECTION] TO CQ2
GRANT SELECT ON [CRC].[QT_PDO_QUERY_MASTER] TO CQ2
GRANT SELECT ON [CRC].[QT_PRIVILEGE] TO CQ2
GRANT SELECT ON [CRC].[VISIT_DIMENSION] TO CQ2

GRANT SELECT ON [WORK].[WORKPLACE] TO CQ2 /** All tables referenced in [WORK].[WORKPLACE_ACCESS] need read/write access - WORK.WOKPLACE is the only table in a default install **/
GRANT INSERT ON [WORK].[WORKPLACE] TO CQ2
GRANT UPDATE ON [WORK].[WORKPLACE] TO CQ2




