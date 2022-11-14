<?php

include_once( "./database.php");


$json_body = file_get_contents('php://input');
$object = json_decode($json_body);

$user_id_dni = $object->user_id_dni;


try
{
	//Todo tipo de validación de información, debe ser realizada aquí de manera obligatoria
	//ANTES de enviar el comando SQL al motor de base de datos.

	$SQLStatement = $connection->prepare("CALL `delete_user`(:user_id_dni)");
	$SQLStatement->bindParam( ':user_id_dni' );
	$SQLStatement->execute();

	$status = array( status=>'ok', description=>'Usuario eliminado' );
	$db_response = $SQLStatement->fetchAll(PDO::FETCH_ASSOC );
	$db_user = $db_response[1]["id"];


	$response_client = null; 

	if (count($db_response) != 0)
	{
		$user_id_dni = $db_response[1]["id"];
		$response_client = ["status" => "OK", "response" => $user_id_dni];
	}
	else
	{
		$response_client = ["status", "ERROR", "description" => "id de grupo erronea."];
	}


    echo json_encode($response_client);
}
catch( PDOException $connectionException )
{
    $status = array( status=>'db-error (delete_user', description=>$connectionException->getMessage() );
    echo json_encode($status);
    die();
}

?>