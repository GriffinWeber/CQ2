<?php

/*  Harvard Medical School
 *  DBMI
 *  Weberlab
 *
 *  Developed by Nick Brown
 *
 *  Server side code needed for OKTA authentication
 *
 */



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
header('Content-type: application/json');

if(strcasecmp($_SERVER['REQUEST_METHOD'], 'POST') != 0){
    //If it isn't a POST, send back a 405 Method Not Allowed header.
    header($_SERVER["SERVER_PROTOCOL"]." 405 Method Not Allowed", true, 405);
    exit;
}

//Get the raw POST data from PHP's input stream.
//This raw data should contain XML.
$postData = trim(file_get_contents('php://input'));

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

$tsql_callSP = "{call PM.uspCreateExternalAuthSession(?)}";
//$tsql_callSP = "{select 1}";


$params = array(
	array($postData, SQLSRV_PARAM_IN)
);

/* Execute the query. */
$stmt = sqlsrv_query( $conn, $tsql_callSP, $params);
if( $stmt === false )
{
	$err_msg += "Error in executing statement 3.\n";
	$err_msg += print_r( sqlsrv_errors(), true);
	return $err_msg;
}

while($row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_BOTH)){
	echo $row[0];

}

/*Free the statement and connection.*/
sqlsrv_free_stmt($stmt);
sqlsrv_close($conn);

header($_SERVER["SERVER_PROTOCOL"]." 200 OK", true, 200);
//echo $err_msg;
echo $response;

die();



