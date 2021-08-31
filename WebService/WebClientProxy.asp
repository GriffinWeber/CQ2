<%

'' Let this script run for 10 minutes (plus 10 seconds)
Server.ScriptTimeout = 610

response.AddHeader "Content-Type", "text/xml"

'' ----------------------------------------------------
'' Get the request data
'' ----------------------------------------------------

if left(Request.ServerVariables ("CONTENT_TYPE"),8) = "text/xml" then
	Dim xmlDoc
	set xmlDoc=Server.CreateObject("Microsoft.XMLDOM")
	xmlDoc.async="false"
	xmlDoc.load(Request)
	d = xmlDoc.xml
else
	d = request.form
end if
if d = "" then
	response.write("ERROR")
	response.end
end if

'' ----------------------------------------------------
'' Get the redirect URL and add the client IP
'' ----------------------------------------------------

x = instr(d,"<redirect_url>")
y = instr(d,"</redirect_url>")
URL = mid(d,x+14,y-x-14)
RedirectURLTag = "<redirect_url>" & URL & "</redirect_url>"
ClientIPTag = "<client_ip>" & Request.ServerVariables("REMOTE_ADDR") & "</client_ip>"
d = replace(d,RedirectURLTag,RedirectURLTag & ClientIPTag)

'' ----------------------------------------------------
'' Send the request to the i2b2 web service
'' ----------------------------------------------------


Set objHTTP = Server.CreateObject("MSXML2.ServerXMLHTTP.6.0")
lResolve = 0 * 1000
lConnect = 60 * 1000
lSend = 30 * 1000
lReceive = 600 * 1000 '' Wait up to 10 minutes for a response
objHTTP.setTimeouts lResolve, lConnect, lSend, lReceive
objHTTP.Open "POST", Url, False
objHTTP.setRequestHeader "Content-Type", "text/xml"
objHTTP.setRequestHeader "Content-Length", Len(d)
objHTTP.setOption 2, 13056 ''SXH_SERVER_CERT_IGNORE_ALL_SERVER_ERRORS
objHTTP.Send d
strResult = objHTTP.responseText

'' ----------------------------------------------------
'' Return the i2b2 response and cleanup
'' ----------------------------------------------------

response.write strResult
Set objHTTP = Nothing

%>
