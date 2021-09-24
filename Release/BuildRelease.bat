@echo off
SETLOCAL EnableDelayedExpansion
set zip="C:\Program Files\7-Zip\7z.exe"

mkdir CQ2
cd CQ2
mkdir Database
mkdir WebService
copy ..\..\CQ2Documentation.docx .\
copy ..\..\LICENSE.md .\
copy ..\..\README.md .\

copy ..\..\WebService\* .\Webservice\


pushd "..\..\Database"
call CreateScripts.bat
popd

copy ..\..\Database\CreateAccount.sql .\Database\CreateAccount.sql
copy ..\..\Database\CreateFunctionsProcedures.sql .\Database\CreateFunctionsProcedures.sql
copy ..\..\Database\CreateOptionalObjects.sql .\Database\CreateOptionalObjects.sql
copy ..\..\Database\CreateTablesViews.sql .\Database\CreateTablesViews.sql

mkdir Database\Demodata
copy ..\..\Database\Demodata\* .\Database\Demodata
cd ..
call %zip% a -tzip CQ2.zip CQ2