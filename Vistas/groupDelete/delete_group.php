<?php

include_once( "./database.php");


$json_body = file_get_contents('php://input');
$object = json_decode($json_body);

$group_id = $object->group_id;


try
{
	//Todo tipo de validación de información, debe ser realizada aquí de manera obligatoria
	//ANTES de enviar el comando SQL al motor de base de datos.

	$SQLStatement = $connection->prepare("CALL `delete_group`(:group_id)");
	$SQLStatement->bindParam( ':group_id' );
	$SQLStatement->execute();

	$status = array( status=>'ok', description=>'Usuario eliminado' );
	$db_response = $SQLStatement->fetchAll(PDO::FETCH_ASSOC );
	$db_user = $db_response[1]["id"];


	$response_client = null; 

	if (count($db_response) != 0)
	{
		$id_user = $db_response[1]["id"];
		$response_client = ["status" => "OK", "response" => $id_user];
	}
	else
	{
		$response_client = ["status", "ERROR", "description" => "id de grupo erronea."];
	}


    echo json_encode($response_client);
}
catch( PDOException $connectionException )
{
    $status = array( status=>'db-error (login.php', description=>$connectionException->getMessage() );
    echo json_encode($status);
    die();
}

?>