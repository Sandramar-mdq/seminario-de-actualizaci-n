<?php

include_once( "./database.php");


$json_body = file_get_contents('php://input');
$object = json_decode($json_body);

$user_id_dni = $object->user_id_dni;
$user_pass = $object->user_pass;
$user_name = $object->user_name;

try
{
	//Todo tipo de validación de información, debe ser realizada aquí de manera obligatoria
	//ANTES de enviar el comando SQL al motor de base de datos.

	$SQLStatement = $connection->prepare("CALL `insert_user`(:user_id_dni, :user_name, :user_pass)");
	$SQLStatement->bindParam( ':user_id_dni', $user_id_dni );
	$SQLStatement->bindParam( ':user_name', $user_name );
	$SQLStatement->bindParam( ':user_pass', $user_pass );
	$SQLStatement->execute();

	$status = array( status=>'ok', description=>'Usuario Creado Satisfactoriamente!' );

    echo json_encode($status);
}
catch( PDOException $connectionException )
{
    $status = array( status=>'db-error (insert_user', description=>$connectionException->getMessage() );
    echo json_encode($status);
    die();
}

?>