set zip="C:\Program Files\7-Zip\7z.exe"
call %zip% x ..\CQ2.zip -otmp\ -r

set DB_NAME=CQ2
sqlcmd -S . -d master -v YourProfilesServerName="." DatabaseName="%DB_NAME%" -E -i SQL_Scripts\CreateDatabase.sql 
sqlcmd -S . -d "%DB_NAME%" -E -i "SQL_Scripts\CreateSchema.sql"
sqlcmd -S . -d "%DB_NAME%" -E -i "tmp\CQ2\Database\CreateTablesViews.sql"
sqlcmd -S . -d "%DB_NAME%" -E -i "tmp\CQ2\Database\CreateFunctionsProcedures.sql"
sqlcmd -S . -d "%DB_NAME%" -E -i "tmp\CQ2\Database\CreateOptionalObjects.sql"

sqlcmd -S . -d "%DB_NAME%" -E -i "tmp\CQ2\Database\Demodata\DefaultData.sql"
sqlcmd -S . -d "%DB_NAME%" -E -i "tmp\CQ2\Database\Demodata\DemoOntologyPart1.sql"
sqlcmd -S . -d "%DB_NAME%" -E -i "tmp\CQ2\Database\Demodata\DemoOntologyPart2.sql"

sqlcmd -S . -d "%DB_NAME%" -E -i "SQL_Scripts\LoadConceptDimension.sql"

sqlcmd -S . -d %DB_NAME% -E -Q "EXEC CRC.uspUpdateStep1CreateDataTables"

sqlcmd -S . -d "%DB_NAME%" -E -i "tmp\CQ2\Database\Demodata\DemoDataPatientVisit.sql"
sqlcmd -S . -d "%DB_NAME%" -E -i "tmp\CQ2\Database\Demodata\DemoDataModifierProvider.sql"
sqlcmd -S . -d "%DB_NAME%" -E -i "tmp\CQ2\Database\Demodata\DemoDataFact.sql"

sqlcmd -S . -d %DB_NAME% -E -Q "EXEC [CRC].[uspUpdateStep2LoadDataTables]"
sqlcmd -S . -d %DB_NAME% -E -Q "EXEC CRC.uspUpdateStep3IndexDataTables"
sqlcmd -S . -d %DB_NAME% -E -Q "EXEC CRC.uspUpdateStep4CreateCQ2Tables"
sqlcmd -S . -d %DB_NAME% -E -Q "EXEC CRC.uspUpdateStep5SwapTables"
sqlcmd -S . -d %DB_NAME% -E -Q "EXEC CRC.uspUpdateStep6DropOldTables"

sqlcmd -S . -d %DB_NAME% -E -Q "INSERT INTO CRC.PATIENT_MAPPING SELECT CAST(PATIENT_NUM AS VARCHAR(50)), 'HIVE', PATIENT_NUM, 'A', 'demo', NULL, NULL, NULL, NULL, NULL, NULL FROM CRC.PATIENT_DIMENSION"
sqlcmd -S . -d %DB_NAME% -E -Q "INSERT INTO CRC.ENCOUNTER_MAPPING SELECT CAST(ENCOUNTER_NUM AS VARCHAR(50)), 'HIVE', 'demo', ENCOUNTER_NUM, CAST(PATIENT_NUM AS VARCHAR(50)), 'HIVE', 'A', NULL, NULL, NULL, NULL, NULL, NULL FROM CRC.VISIT_DIMENSION"

sqlcmd -S . -d "%DB_NAME%" -E -i "tmp\CQ2\Database\CreateAccount.sql"

REM sqlcmd -S . -d %DB_NAME% -E -Q "update PM.PM_CELL_DATA set URL = Case when Cell_ID = 'CRC' then 'http://localhost/CQ2/?/QueryToolService/' when CELL_ID = 'ONT' then 'http://localhost/CQ2/?/OntologyService/' when CELL_ID = 'WORK' THEN 'http://localhost/CQ2/?/WorkplaceService/' else '' END"

sqlcmd -S . -d %DB_NAME% -E -Q "update PM.PM_CELL_DATA set URL = Case when Cell_ID = 'CRC' then 'http://localhost/i2b2ServerProxy/CQ2ServiceProxy.php/QueryToolService/' when CELL_ID = 'ONT' then 'http://localhost/i2b2ServerProxy/CQ2ServiceProxy.php/OntologyService/' when CELL_ID = 'WORK' THEN 'http://localhost/i2b2ServerProxy/CQ2ServiceProxy.php/WorkplaceService/' else '' END"