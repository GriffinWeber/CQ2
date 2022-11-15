<?php

/*  Harvard Medical School
 *  DBMI
 *  Weberlab
 *
 *  Developed by James B. Norman
 *
 *  For classic ASP replacment of i2b2 server proxy of restful URLs
 *
 */

//echo phpinfo();  //For debugging your insall
//Debug your php sql sever dll install, you need to have sqlsrv in your PHP Stream
//Registered PHP Streams	php, file, glob, data, http, ftp, zip, compress.zlib, https, ftps, phar, sqlsrv

//Edit this function for your database connection string parameters
function getdbconfig(){
    return '{
        "database": {
        "host": "127.0.0.1",
        "user": "CQ2",
        "password": "**************",
        "dbname": "CQ2"
           }
      }';
}


//Make sure that this is a POST request.
header('Content-type: application/xml');

if(strcasecmp($_SERVER['REQUEST_METHOD'], 'POST') != 0){
    //If it isn't a POST, send back a 405 Method Not Allowed header.
    header($_SERVER["SERVER_PROTOCOL"]." 405 Method Not Allowed", true, 405);
    exit;
}

//Get the raw POST data from PHP's input stream.
//This raw data should contain XML.
$postData = trim(file_get_contents('php://input'));

$rawxml = new SimpleXMLElement($postData);

//Use internal errors for better error handling.
libxml_use_internal_errors(true);

//If the XML could not be parsed properly.
if($rawxml === false) {
    //Send a 400 Bad Request error.
    header($_SERVER["SERVER_PROTOCOL"]." 400 Bad Request", true, 400);
    //Print out details about the error and kill the script.
    foreach(libxml_get_errors() as $xmlError) {
        echo $xmlError->message . "\n";
    }
    echo "XML coult not be parsed";
    exit;
}

$authdata = new auth_data;
$authdata->Request = (string)$rawxml->asXML();
$authdata->IPAddress = (string)$rawxml->message_header->proxy->client_ip;
$authreturndata = authenticate($authdata);

if($authreturndata->authenticated<>1){
	//echo "sorry";
    echo auth_err_msg();
    die();
}

$clienturl = explode('/', $_SERVER['REQUEST_URI']);


//build the input to the response function;
$response_data = new response_data;
$response_data->IPAddress = (string)$authdata->IPAddress;
$response_data->Service = (string)$clienturl[count($clienturl) - 2];
$response_data->Operation = (string)$clienturl[count($clienturl) - 1];
$response_data->Request = $rawxml->asXML();
$response_data->UserID = (string)$authreturndata->username;
header($_SERVER["SERVER_PROTOCOL"]." 200 OK", true, 200);
echo getresponse($response_data);

die();

function getresponse(response_data $rsp_data){

    $dbconfig = json_decode(getdbconfig());
    $connectionInfo = array( "Database"=>$dbconfig->database->dbname, "UID"=>$dbconfig->database->user, "PWD"=>$dbconfig->database->password);
    $conn = sqlsrv_connect( $dbconfig->database->host, $connectionInfo);
    if( $conn === false )
    {
        $conn_err = "Could not connect.\n";
        $conn_err += "<pre>";
        $conn_err +=  print_r( sqlsrv_errors(), true);
        $conn_err += "</pre>";
        return $conn_err;
    }

    $tsql_callSP = "{call HIVE.uspGetResponse_PHP(?,?,?,?,?)}";

	$fixed = fix_xml($rsp_data->Request);

    $params = array(
        array($rsp_data->Service, SQLSRV_PARAM_IN),
        array($rsp_data->Operation, SQLSRV_PARAM_IN),
        array($fixed, SQLSRV_PARAM_IN),
        array($rsp_data->UserID, SQLSRV_PARAM_IN),
        array($rsp_data->IPAddress, SQLSRV_PARAM_IN)
    );

    /* Execute the query. */
    $stmt = sqlsrv_query( $conn, $tsql_callSP, $params);
    if( $stmt === false )
    {
        $err_msg += "Error in executing statement 3.\n";
        $err_msg += print_r( sqlsrv_errors(), true);
        return $err_msg;
    }

    $response = new response_return;
    while($row = sqlsrv_fetch_array($stmt,SQLSRV_FETCH_BOTH)){

		$response->ResponseXML = $row["ResponseXML"];
		$response->ErrorNumber = $row["ErrorNumber"];

	}

    /*Free the statement and connection.*/
    sqlsrv_free_stmt($stmt);
    sqlsrv_close($conn);

    if($response->ErrorNumber===0){
        return $response->ResponseXML;
	}else{
        return "Error in loading or getting response from HIVE.uspGetResponse";
	}
}
function authenticate(auth_data $authdata){
	$auth = new auth_return;
	$dbconfig = json_decode(getdbconfig());
	$connectionInfo = array( "Database"=>$dbconfig->database->dbname, "UID"=>$dbconfig->database->user, "PWD"=>$dbconfig->database->password);
    $conn = sqlsrv_connect( $dbconfig->database->host, $connectionInfo);
    if( $conn === false )
    {
        //$conn_err = "Could not connect.\n";
        //$conn_err += "<pre>";
        //$conn_err +=  print_r( sqlsrv_errors(), true);
        //$conn_err += "</pre>";

		$auth->auth_err_msg = print_r( sqlsrv_errors(), true);
        echo "<error>{$auth->auth_err_msg}</error>";
		die();



    }

    $callSP = "{call PM.uspGetAuthenticate(?,?)}";

	$fixed = fix_xml($authdata->Request);

    $params = array(
        array($fixed, SQLSRV_PARAM_IN),
        array($authdata->IPAddress, SQLSRV_PARAM_IN),
    );

    $stmt = sqlsrv_query($conn, $callSP, $params);
    if( $stmt === false )
    {
        $auth->auth_err_msg += "Error in executing statement 3.\n";
        $auth->auth_err_msg += print_r( sqlsrv_errors(), true);
    }
    while($row = sqlsrv_fetch_array($stmt,SQLSRV_FETCH_BOTH)){

		$auth->err_num = $row["Error"];
		$auth->authenticated = $row["Authenticated"];
		$auth->username = $row["Username"];
		$auth->password = $row["Password"];
		$auth->trycustomauthenticate = $row["TryCustomAuthenticate"];

	}

    if($auth->trycustomauthenticate !="0"){
		//Put custom auth code here.
	}

    /*Free the statement and connection.*/
    sqlsrv_free_stmt($stmt);
    sqlsrv_close($conn);

    return $auth;
}
function auth_err_msg(){
	$msg = "<ns2:response xmlns:ns2=\"http://www.i2b2.org/xsd/hive/msg/1.1/\" xmlns:ns4=\"http://www.i2b2.org/xsd/cell/pm/1.1/\" xmlns:ns3=\"http://www.i2b2.org/xsd/hive/msg/version/\" xmlns:tns=\"http://ws.pm.i2b2.harvard.edu\"><message_header><i2b2_version_compatible>1.1</i2b2_version_compatible><hl7_version_compatible>2.4</hl7_version_compatible><sending_application><application_name>PM Cell</application_name><application_version>1.601</application_version></sending_application><sending_facility><facility_name>i2b2 Hive</facility_name></sending_facility><receiving_application><application_name>PM Cell</application_name><application_version>1.601</application_version></receiving_application><receiving_facility><facility_name>i2b2 Hive</facility_name></receiving_facility><datetime_of_message>2012-02-21T20:19:50.732Z</datetime_of_message><message_control_id><message_num>0t24RR6mE87f55Af4RbdP</message_num><instance_num>1</instance_num></message_control_id><processing_id><processing_id>P</processing_id><processing_mode>I</processing_mode></processing_id><accept_acknowledgement_type>AL</accept_acknowledgement_type><application_acknowledgement_type>AL</application_acknowledgement_type><country_code>US</country_code><project_id>undefined</project_id></message_header><response_header><result_status><status type=\"ERROR\">Username or password does not exist</status></result_status></response_header></ns2:response>";
	return $msg;
}
function fix_xml(string $data){
    $temp = new SimpleXMLElement($data);
    $dom = dom_import_simplexml($temp);
    return (string)$dom->ownerDocument->saveXML($dom->ownerDocument->documentElement);

}
class auth_return{
	public $err_num = "";
	public $authenticated = "";
    public $username = "";
    public $password ="";
    public $trycustomauthenticate = "";
    public $auth_err_msg = "";
}
class auth_data{
    public $Request = "";
    public $IPAddress ="";
}
class response_data{
	public $Service="";
    public $Operation="";
    public $Request="";
    public $UserID = "";
    public $IPAddress = "";
}
class response_return{
    public $ErrorNumber="";
    public $ResponseXML ="";
}


