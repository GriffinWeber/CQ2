SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetSqlTableData]
	@TABLE_SCHEMA VARCHAR(1000) = 'DBO',
	@TABLE_NAME VARCHAR(1000)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @sql NVARCHAR(MAX)

	SELECT @sql = 'SELECT CAST(('+char(10)
			+'SELECT ''INSERT INTO ['+@TABLE_SCHEMA+'].['+@TABLE_NAME+']''+char(10)+char(9)+SUBSTRING(('+char(10)
			+'SELECT char(9)+''UNION ALL SELECT ''+' + SUBSTRING((
				SELECT '+'',''+'
					+'ISNULL(''''''''+'
					+(CASE WHEN DATA_TYPE IN ('VARCHAR','NVARCHAR','CHAR','NCHAR','TEXT','NTEXT') 
						--THEN 'REPLACE('+COLUMN_NAME+','''''''','''''''''''')' 
						THEN 'REPLACE(CAST('+COLUMN_NAME+' AS NVARCHAR(MAX)),'''''''','''''''''''')' 
						ELSE 'CAST('+COLUMN_NAME+' AS NVARCHAR(MAX))'  END)
					+'+'''''''',''NULL'')'
				FROM INFORMATION_SCHEMA.COLUMNS c
				WHERE c.TABLE_SCHEMA = @TABLE_SCHEMA AND c.TABLE_NAME = @TABLE_NAME
				ORDER BY ORDINAL_POSITION
				FOR XML PATH(''), TYPE
			).value('.','VARCHAR(MAX)'),6,999999)
			+'+char(10)'+char(10)
			+'FROM ['+@TABLE_SCHEMA+'].['+@TABLE_NAME+']'+char(10)
			+'FOR XML PATH(''''), TYPE'+char(10)
			+').value(''.'',''VARCHAR(MAX)''),12,999999)) AS XML) SQL'+char(10)

	EXEC sp_executesql @sql

END
GO
