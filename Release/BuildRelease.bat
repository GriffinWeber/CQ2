REM @echo off
SETLOCAL EnableDelayedExpansion
set zip="C:\Program Files\7-Zip\7z.exe"

cd ..
SET AREYOUSURE=N
:PROMPT
SET /P AREYOUSURE=This will reset your GIT clone, do you want to continue? (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO SKIPCLEAN

	git clean --force -d -x
	git reset --hard
	git pull
:SKIPCLEAN

echo CQ2 Release Build Tool > Release/build_details.txt
echo %date% %time% >> Release/build_details.txt
git rev-parse HEAD >> Release/build_details.txt
cd Release

mkdir CQ2
cd CQ2
copy ..\build_details.txt build_details.txt
mkdir Database
mkdir WebService
copy ..\..\CQ2Documentation.docx .\
copy ..\..\LICENSE.md .\
copy ..\..\README.md .\

copy ..\..\WebService\CQ2ServiceProxy.php .\Webservice\CQ2ServiceProxy.php


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