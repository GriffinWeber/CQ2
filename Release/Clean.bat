
set DB_NAME=CQ2
sqlcmd -S . -d master -E -Q "if exists (select * from sysdatabases where [name] = '%DB_NAME%') begin ALTER DATABASE [%DB_NAME%] SET SINGLE_USER WITH ROLLBACK IMMEDIATE; DROP DATABASE [%DB_NAME%] end"
sqlcmd -S . -d master -E -Q "DROP LOGIN %DB_NAME%"

rmdir /s/Q CQ2
rmdir /s/Q BuildDatabase\tmp
del CQ2.zip