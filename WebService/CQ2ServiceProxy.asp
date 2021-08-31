<%
Server.ScriptTimeout = 600

'' ----------------------------------------------------
'' Open database connection
'' ----------------------------------------------------

set conn = Server.CreateObject("ADODB.Connection")
conn.open "Driver={SQL Server};Server=***SERVERNAME***;Database=***DATABASENAME***;Uid=***USERID***;Pwd=***PASSWORD***"
conn.CommandTimeout = 600
set rs = Server.CreateObject("ADODB.RecordSet")

'' ----------------------------------------------------
'' Get the request message from the form data
'' ----------------------------------------------------

If Left(Request.ServerVariables ("CONTENT_TYPE"),8) = "text/xml" Then
	Dim xmlDoc
	Set xmlDoc=Server.CreateObject("Microsoft.XMLDOM")
	xmlDoc.async="false"
	xmlDoc.load(Request)
	RequestStr = xmlDoc.xml
Else
	RequestStr = Request.Form
End If

'' ----------------------------------------------------
'' Get the client IP address
'' ----------------------------------------------------

ClientIPStart = instr(RequestStr,"<client_ip>")
ClientIPEnd = instr(RequestStr,"</client_ip>")
if (ClientIPStart > 0) and (ClientIPEnd > ClientIPStart) then
	ClientIP = mid(RequestStr,ClientIPStart+11,ClientIPEnd-ClientIPStart-11)
end if
if ClientIP = "" then
	ClientIP = Request.ServerVariables("REMOTE_ADDR")
end if

'' ----------------------------------------------------
'' Get the service and operation from the query string
'' ----------------------------------------------------

RestPath = Split(Request.ServerVariables("QUERY_STRING"),"/")
If ubound(RestPath) >= 1 Then
	Service = RestPath(1)
End If
If ubound(RestPath) >= 2 Then
	Operation = RestPath(2)
End If

'' ----------------------------------------------------
'' Authenticate
'' ----------------------------------------------------

Authenticated = 0
If RequestStr <> "" Then
	SQL = "exec PM.uspGetAuthenticate @Request = " & cs(RequestStr) & ", @IPAddress = " & cs(ClientIP)
	RS.Open SQL, Conn, 1, 1
	If Not RS.EOF Then
		ErrorNumber = CLng(RS("Error"))
		Authenticated = CLng(RS("Authenticated"))
		Username = RS("Username")
		Password = RS("Password")
		TryCustomAuthenticate = CLng(RS("TryCustomAuthenticate"))
	End If
	RS.Close
	If TryCustomAuthenticate <> 0 Then
		CustomAuthenticated = False
		''Put custom authentication code here (set CustomAuthenticated=True if authenticated)
		If CustomAuthenticated Then
			SQL = "exec PM.uspConvertToToken @Request = " & cs(RequestStr) & ", @UserID = " & cs(Username) & ", @IPAddress = " & cs(ClientIP)
			RS.Open SQL, Conn, 1, 1
			If Not RS.EOF Then
				RequestStr = RS("RequestWithToken")
				Authenticated = 1
			End If
			RS.Close
		End If
	End If
End If
If Authenticated <> 1 Then
	Response.Write "<ns2:response xmlns:ns2=""http://www.i2b2.org/xsd/hive/msg/1.1/"" xmlns:ns4=""http://www.i2b2.org/xsd/cell/pm/1.1/"" xmlns:ns3=""http://www.i2b2.org/xsd/hive/msg/version/"" xmlns:tns=""http://ws.pm.i2b2.harvard.edu""><message_header><i2b2_version_compatible>1.1</i2b2_version_compatible><hl7_version_compatible>2.4</hl7_version_compatible><sending_application><application_name>PM Cell</application_name><application_version>1.601</application_version></sending_application><sending_facility><facility_name>i2b2 Hive</facility_name></sending_facility><receiving_application><application_name>PM Cell</application_name><application_version>1.601</application_version></receiving_application><receiving_facility><facility_name>i2b2 Hive</facility_name></receiving_facility><datetime_of_message>2012-02-21T20:19:50.732Z</datetime_of_message><message_control_id><message_num>0t24RR6mE87f55Af4RbdP</message_num><instance_num>1</instance_num></message_control_id><processing_id><processing_id>P</processing_id><processing_mode>I</processing_mode></processing_id><accept_acknowledgement_type>AL</accept_acknowledgement_type><application_acknowledgement_type>AL</application_acknowledgement_type><country_code>US</country_code><project_id>undefined</project_id></message_header><response_header><result_status><status type=""ERROR"">Username or password does not exist</status></result_status></response_header></ns2:response>"
	Response.End
End If

'' ----------------------------------------------------
'' Get the response message from the database
'' ----------------------------------------------------

ErrorNumber = -1
If RequestStr <> "" Then
	SQL = "exec HIVE.uspGetResponse @Service = " & cs(Service) & ", @Operation = " & cs(Operation) & ", @Request = " & cs(RequestStr) & ", @UserID = " & cs(Username) & ", @IPAddress = " & cs(ClientIP)
	RS.Open SQL, Conn, 1, 1
	If Not RS.EOF Then
		ErrorNumber = CLng(RS("ErrorNumber"))
		If ErrorNumber = 0 Then
			ResponseXML = RS("ResponseXML")
			AddFormatting = CLng(RS("AddFormatting"))
		End If
	End IF
	RS.Close
End If

'' ----------------------------------------------------
'' Return the response message
'' ----------------------------------------------------

If ErrorNumber = 0 Then
	If AddFormatting = 1 Then
		Set XML = server.createobject("Microsoft.XMLDOM")
		XML.async = false
		xml.loadXML ResponseXML
		DisplayNodes xml.childNodes(0), 0
	Else
		Response.Write ResponseXML
	End If
End If

'' ----------------------------------------------------
'' Function:cs - Add quotes to strings for SQL
'' ----------------------------------------------------

Function cs(TempStr)
	cs = "'" & Replace(TempStr,"'","''") & "'"
End Function

'' ----------------------------------------------------
'' Sub:DisplayNodes - Add whitespace to XML
'' ----------------------------------------------------

Sub DisplayNodes(Node,Indent)
	IndentStr = ""
	For i = 0 To Indent-1
		IndentStr = IndentStr & VbTab
	Next
	Attributes = ""
	For i = 0 To Node.Attributes.Length - 1
		Attributes = Attributes & " " & Node.Attributes(i).Name & "=""" & Node.Attributes(i).Value & """"
	Next
	If Node.hasChildNodes Then
		If Node.childNodes(0).nodeName = "#text" Then
			Response.Write IndentStr & "<" & Node.nodeName & Attributes & ">"
			Response.Write Node.childNodes(0).nodeValue
			Response.Write "</" & Node.nodeName & ">" & VbCrLf
		Else
			Response.Write IndentStr & "<" & Node.nodeName & Attributes & ">" & VbCrLf
			For i = 0 To Node.childNodes.length - 1
				DisplayNodes Node.childNodes(i), Indent+1
			Next
			Response.Write IndentStr & "</" & Node.nodeName & ">" & VbCrLf
		End If
	Else
		Response.Write IndentStr & "<" & Node.nodeName & Attributes & ">"
		Response.Write Node.nodeValue
		Response.Write "</" & Node.nodeName & ">" & VbCrLf
	End If
End Sub

%>



