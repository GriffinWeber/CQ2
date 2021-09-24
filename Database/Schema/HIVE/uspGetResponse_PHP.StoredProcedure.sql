SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [HIVE].[uspGetResponse_PHP]
	@Service VARCHAR(100) = NULL,
	@Operation VARCHAR(100) = NULL,
	@Request NVARCHAR(MAX) = NULL,
	@UserID VARCHAR(50) = NULL,
	@IPAddress VARCHAR(50) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Declare variables
	DECLARE @MessageID INT
	DECLARE @Cell VARCHAR(100)
	DECLARE @CellSchema VARCHAR(100)
	DECLARE @DomainID VARCHAR(50)
	DECLARE @ProjectID VARCHAR(50)
	DECLARE @RequestXML XML
	DECLARE @ResponseXML XML
	DECLARE @RequestType VARCHAR(100)
	DECLARE @ErrorNumber INT
	DECLARE @ErrorSeverity INT
	DECLARE @ErrorState INT
	DECLARE @ErrorProcedure VARCHAR(1000)
	DECLARE @ErrorLine INT
	DECLARE @ErrorMessage VARCHAR(4000)
	DECLARE @sql NVARCHAR(MAX)

	-- Log request (removing password)
	INSERT INTO HIVE.MessageLog(UserID, Service, Operation, RequestDate, IPAddress, RequestXML)
		SELECT @UserID, @Service, @Operation, GetDate(), @IPAddress,
				(CASE WHEN Pos3 > Pos2 + 1 THEN STUFF(@Request,Pos2+1,Pos3-Pos2-1,'') ELSE @Request END)
			FROM (SELECT CHARINDEX('<password',@Request) Pos1) t1
			CROSS APPLY (SELECT (CASE WHEN Pos1 > 0 THEN CHARINDEX('>',@Request,Pos1+1) ELSE 0 END) Pos2) t2
			CROSS APPLY (SELECT (CASE WHEN Pos2 > 0 THEN CHARINDEX('<',@Request,Pos2+1) ELSE 0 END) Pos3) t3
	SELECT @MessageID = @@IDENTITY

	-- Convert request to XML
	BEGIN TRY
		SELECT @RequestXML = CAST(@Request AS XML)
	END TRY
	BEGIN CATCH
		-- Capture the error
		SELECT	@ErrorNumber = ERROR_NUMBER(),
				@ErrorSeverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE(),
				@ErrorProcedure = ERROR_PROCEDURE(),
				@ErrorLine = ERROR_LINE(),
				@ErrorMessage = ERROR_MESSAGE()
	END CATCH

	-- Get the domain and project
	SELECT	@DomainID = @RequestXML.value('/*[1]/message_header[1]/security[1]/domain[1]','varchar(50)'),
			@ProjectID = @RequestXML.value('/*[1]/message_header[1]/project_id[1]','varchar(50)')

	-- Get the cell and cell schema
	EXEC [HIVE].[uspGetCellSchema]	@Service = @Service,
									@DomainID = @DomainID,
									@UserID = @UserID,
									@ProjectID = @ProjectID,
									@Cell = @Cell OUTPUT,
									@CellSchema = @CellSchema OUTPUT

	-- Store the cell, schema, domain, and project to the message log
	UPDATE HIVE.MessageLog
		SET	Cell = @Cell,
			CellSchema = @CellSchema,
			DomainID = @DomainID,
			ProjectID = @ProjectID			
		WHERE MessageID = @MessageID

	-- Process request
	IF (@CellSchema IS NOT NULL) AND (@RequestXML IS NOT NULL)
	BEGIN
		BEGIN TRY
			SELECT @sql = 'EXEC '+CAST(@CellSchema AS NVARCHAR(MAX))+'.uspGetResponse @Service, @Operation, @RequestXML, @UserID, @RequestTypeOUT OUTPUT, @ResponseXMLOUT OUTPUT'
			EXEC sp_executesql @sql,
								N'@Service VARCHAR(100), @Operation VARCHAR(100), @RequestXML XML, @UserID VARCHAR(50), @RequestTypeOUT VARCHAR(100) OUTPUT, @ResponseXMLOUT XML OUTPUT',
								@Service = @Service, 
								@Operation = @Operation, 
								@RequestXML = @RequestXML, 
								@UserID = @UserID,
								@RequestTypeOUT = @RequestType OUTPUT,
								@ResponseXMLOUT = @ResponseXML OUTPUT
		END TRY
		BEGIN CATCH
			-- Capture the error
			SELECT	@ErrorNumber = ERROR_NUMBER(),
					@ErrorSeverity = ERROR_SEVERITY(),
					@ErrorState = ERROR_STATE(),
					@ErrorProcedure = ERROR_PROCEDURE(),
					@ErrorLine = ERROR_LINE(),
					@ErrorMessage = ERROR_MESSAGE()
		END CATCH
	END
	
	-- Store the result
	UPDATE HIVE.MessageLog
		SET	ResponseDate = GetDate(),
			DurationMS = DateDiff(ms,RequestDate,GetDate()),
			ErrorNumber = @ErrorNumber,
			ErrorSeverity = @ErrorSeverity,
			ErrorState = @ErrorState,
			ErrorProcedure = @ErrorProcedure,
			ErrorLine = @ErrorLine,
			ErrorMessage = @ErrorMessage,
			RequestType = @RequestType,
			ResponseXML = CAST(@ResponseXML AS NVARCHAR(MAX))
		WHERE MessageID = @MessageID
			
	-- Return the response message
	SELECT 0 ErrorNumber, 1 AddFormatting, replace(replace(replace(cast(@ResponseXML as nvarchar(max)), '&gt;', '>'), '&lt;', '<'), '&amp;', '&') ResponseXML
	
END
GO
