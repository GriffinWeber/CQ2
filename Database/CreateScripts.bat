del CreateFunctionsProcedures.sql

echo --********************************************************************* >> CreateFunctionsProcedures.sql
echo --********************************************************************* >> CreateFunctionsProcedures.sql
echo --**** Create all functions  >> CreateFunctionsProcedures.sql
echo --*********************************************************************  >> CreateFunctionsProcedures.sql
echo --*********************************************************************  >> CreateFunctionsProcedures.sql
echo. >> CreateFunctionsProcedures.sql
type Schema\HIVE\fnDate2Str.UserDefinedFunction.sql >> CreateFunctionsProcedures.sql
type Schema\HIVE\fnHasUserRole.UserDefinedFunction.sql >> CreateFunctionsProcedures.sql
type Schema\HIVE\fnSketchEstimate.UserDefinedFunction.sql >> CreateFunctionsProcedures.sql
type Schema\HIVE\fnStr2Bit.UserDefinedFunction.sql >> CreateFunctionsProcedures.sql
type Schema\HIVE\fnStr2BitDefault.UserDefinedFunction.sql >> CreateFunctionsProcedures.sql
type Schema\HIVE\fnXMLValue.UserDefinedFunction.sql >> CreateFunctionsProcedures.sql

echo --********************************************************************* >> CreateFunctionsProcedures.sql
echo --********************************************************************* >> CreateFunctionsProcedures.sql
echo --**** Create all procedures  >> CreateFunctionsProcedures.sql
echo --*********************************************************************  >> CreateFunctionsProcedures.sql
echo --*********************************************************************  >> CreateFunctionsProcedures.sql

type Schema\CRC\uspGetResponse.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\CRC\uspRunGetNameInfo.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\CRC\uspRunPDO.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\CRC\uspRunPSM.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\CRC\uspRunQueryInstance.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\CRC\uspRunQueryInstanceBreakdown.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\CRC\uspRunQueryInstanceQM.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\CRC\uspRunQueryInstanceSubquery.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\CRC\uspUpdateAllSteps.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\CRC\uspUpdateStep1CreateDataTables.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\CRC\uspUpdateStep2LoadDataTables.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\CRC\uspUpdateStep3IndexDataTables.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\CRC\uspUpdateStep4CreateCQ2Tables.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\CRC\uspUpdateStep5SwapTables.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\CRC\uspUpdateStep6DropOldTables.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\HIVE\uspGetCellSchema.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\HIVE\uspGetMessageHeader.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\HIVE\uspGetNewID.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\HIVE\uspGetResponse.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\HIVE\uspGetResponse_PHP.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\HIVE\uspGetResponseHeader.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\HIVE\uspGetStandardResponse.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\ONT\uspGetResponse.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\ONT\uspRunOperation.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\PM\uspConvertToToken.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\PM\uspGetAuthenticate.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\PM\uspGetResponse.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\PM\uspGetServices.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\PM\uspRegister.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\WORK\uspGetResponse.StoredProcedure.sql >> CreateFunctionsProcedures.sql
type Schema\WORK\uspRunOperation.StoredProcedure.sql >> CreateFunctionsProcedures.sql


del CreateOptionalObjects.sql
type Schema\dbo\x.Table.sql >> CreateOptionalObjects.sql
type Schema\dbo\uspGetSqlDropObjects.StoredProcedure.sql >> CreateOptionalObjects.sql
type Schema\dbo\uspGetSqlFullSchema.StoredProcedure.sql >> CreateOptionalObjects.sql
type Schema\dbo\uspGetSqlTableData.StoredProcedure.sql >> CreateOptionalObjects.sql
type Schema\dbo\uspGetSqlTableDataAll.StoredProcedure.sql >> CreateOptionalObjects.sql
type Schema\dbo\uspGetSqlTableSchema.StoredProcedure.sql >> CreateOptionalObjects.sql



del CreateTablesViews.sql

echo --********************************************************************* >> CreateTablesViews.sql
echo --********************************************************************* >> CreateTablesViews.sql
echo --**** Create all tables  >> CreateTablesViews.sql
echo --*********************************************************************  >> CreateTablesViews.sql
echo --*********************************************************************  >> CreateTablesViews.sql

type Schema\CRC\CODE_LOOKUP.Table.sql >> CreateTablesViews.sql
type Schema\CRC\CONCEPT_DIMENSION.Table.sql >> CreateTablesViews.sql
type Schema\CRC\CQ2_CONCEPT_PATH.Table.sql >> CreateTablesViews.sql
type Schema\CRC\CQ2_CONCEPT_PATH_CODE.Table.sql >> CreateTablesViews.sql
type Schema\CRC\CQ2_FACT_COUNTS_CONCEPT.Table.sql >> CreateTablesViews.sql
type Schema\CRC\CQ2_FACT_COUNTS_CONCEPT_PATIENT.Table.sql >> CreateTablesViews.sql
type Schema\CRC\CQ2_FACT_COUNTS_PATH.Table.sql >> CreateTablesViews.sql
type Schema\CRC\CQ2_FACT_COUNTS_PATH_PATIENT.Table.sql >> CreateTablesViews.sql
type Schema\CRC\CQ2_PARAMS.Table.sql >> CreateTablesViews.sql
type Schema\CRC\CQ2_SKETCH_PATH15x256.Table.sql >> CreateTablesViews.sql
type Schema\CRC\CQ2_SKETCH_PATH8x256.Table.sql >> CreateTablesViews.sql
type Schema\CRC\CQ2_SKETCH_PATIENT.Table.sql >> CreateTablesViews.sql
type Schema\CRC\ENCOUNTER_MAPPING.Table.sql >> CreateTablesViews.sql
type Schema\CRC\MODIFIER_DIMENSION.Table.sql >> CreateTablesViews.sql
type Schema\CRC\OBSERVATION_FACT.Table.sql >> CreateTablesViews.sql
type Schema\CRC\OBSERVATION_FACT_ORIG.Table.sql >> CreateTablesViews.sql
type Schema\CRC\PATIENT_DIMENSION.Table.sql >> CreateTablesViews.sql
type Schema\CRC\PATIENT_DIMENSION_ORIG.Table.sql >> CreateTablesViews.sql
type Schema\CRC\PATIENT_MAPPING.Table.sql >> CreateTablesViews.sql
type Schema\CRC\PDO_OUTPUT_SET_METADATA.Table.sql >> CreateTablesViews.sql
type Schema\CRC\PROVIDER_DIMENSION.Table.sql >> CreateTablesViews.sql
type Schema\CRC\QT_ANALYSIS_PLUGIN.Table.sql >> CreateTablesViews.sql
type Schema\CRC\QT_ANALYSIS_PLUGIN_RESULT_TYPE.Table.sql >> CreateTablesViews.sql
type Schema\CRC\QT_BREAKDOWN_PATH.Table.sql >> CreateTablesViews.sql
type Schema\CRC\QT_QUERY_STATUS_TYPE.Table.sql >> CreateTablesViews.sql
type Schema\CRC\QT_QUERY_MASTER.Table.sql >> CreateTablesViews.sql
type Schema\CRC\QT_QUERY_INSTANCE.Table.sql >> CreateTablesViews.sql
type Schema\CRC\QT_QUERY_RESULT_TYPE.Table.sql >> CreateTablesViews.sql
type Schema\CRC\QT_QUERY_RESULT_INSTANCE.Table.sql >> CreateTablesViews.sql
type Schema\CRC\QT_PATIENT_ENC_COLLECTION.Table.sql >> CreateTablesViews.sql
type Schema\CRC\QT_PATIENT_SET_COLLECTION.Table.sql >> CreateTablesViews.sql
type Schema\CRC\QT_PDO_QUERY_MASTER.Table.sql >> CreateTablesViews.sql
type Schema\CRC\QT_PRIVILEGE.Table.sql >> CreateTablesViews.sql
type Schema\CRC\QT_QUERY_RESULT_SKETCH.Table.sql >> CreateTablesViews.sql
type Schema\CRC\QT_XML_RESULT.Table.sql >> CreateTablesViews.sql
type Schema\CRC\VISIT_DIMENSION.Table.sql >> CreateTablesViews.sql
type Schema\CRC\VISIT_DIMENSION_ORIG.Table.sql >> CreateTablesViews.sql
type Schema\HIVE\AuthenticateLog.Table.sql >> CreateTablesViews.sql
type Schema\HIVE\CRC_ANALYSIS_JOB.Table.sql >> CreateTablesViews.sql
type Schema\HIVE\CRC_DB_LOOKUP.Table.sql >> CreateTablesViews.sql
type Schema\HIVE\ErrorLog.Table.sql >> CreateTablesViews.sql
type Schema\HIVE\IM_DB_LOOKUP.Table.sql >> CreateTablesViews.sql
type Schema\HIVE\MessageLog.Table.sql >> CreateTablesViews.sql
type Schema\HIVE\ONT_DB_LOOKUP.Table.sql >> CreateTablesViews.sql
type Schema\HIVE\SERVICE_LOOKUP.Table.sql >> CreateTablesViews.sql
type Schema\HIVE\WORK_DB_LOOKUP.Table.sql >> CreateTablesViews.sql
type Schema\ONT\I2B2.Table.sql >> CreateTablesViews.sql
type Schema\ONT\ONT_PROCESS_STATUS.Table.sql >> CreateTablesViews.sql
type Schema\ONT\SCHEMES.Table.sql >> CreateTablesViews.sql
type Schema\ONT\TABLE_ACCESS.Table.sql >> CreateTablesViews.sql
type Schema\PM\PM_APPROVALS.Table.sql >> CreateTablesViews.sql
type Schema\PM\PM_APPROVALS_PARAMS.Table.sql >> CreateTablesViews.sql
type Schema\PM\PM_CELL_DATA.Table.sql >> CreateTablesViews.sql
type Schema\PM\PM_CELL_PARAMS.Table.sql >> CreateTablesViews.sql
type Schema\PM\PM_GLOBAL_PARAMS.Table.sql >> CreateTablesViews.sql
type Schema\PM\PM_HIVE_DATA.Table.sql >> CreateTablesViews.sql
type Schema\PM\PM_HIVE_PARAMS.Table.sql >> CreateTablesViews.sql
type Schema\PM\PM_PROJECT_DATA.Table.sql >> CreateTablesViews.sql
type Schema\PM\PM_PROJECT_PARAMS.Table.sql >> CreateTablesViews.sql
type Schema\PM\PM_PROJECT_REQUEST.Table.sql >> CreateTablesViews.sql
type Schema\PM\PM_PROJECT_USER_PARAMS.Table.sql >> CreateTablesViews.sql
type Schema\PM\PM_PROJECT_USER_ROLES.Table.sql >> CreateTablesViews.sql
type Schema\PM\PM_ROLE_REQUIREMENT.Table.sql >> CreateTablesViews.sql
type Schema\PM\PM_USER_DATA.Table.sql >> CreateTablesViews.sql
type Schema\PM\PM_USER_LOGIN.Table.sql >> CreateTablesViews.sql
type Schema\PM\PM_USER_PARAMS.Table.sql >> CreateTablesViews.sql
type Schema\PM\PM_USER_SESSION.Table.sql >> CreateTablesViews.sql
type Schema\WORK\WORKPLACE.Table.sql >> CreateTablesViews.sql
type Schema\WORK\WORKPLACE_ACCESS.Table.sql >> CreateTablesViews.sql

type Schema\CRC\vwCQ2_ConceptDimension.View.sql >> CreateTablesViews.sql
type Schema\CRC\vwCQ2_Ontology.View.sql >> CreateTablesViews.sql