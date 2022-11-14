<?php

include_once( "./database.php");


$json_body = file_get_contents('php://input');
$object = json_decode($json_body);

$user_id_dni = $object->user_id_dni;
$user_name = $object->user_name;
$user_descrip = $object->user_descrip;

try
{
	//Todo tipo de validación de información, debe ser realizada aquí de manera obligatoria
	//ANTES de enviar el comando SQL al motor de base de datos.

	$SQLStatement = $connection->prepare("CALL `upload_user`(:user_id_dni, :user_name, :user_descrip)");
	$SQLStatement->bindParam( ':user_id_dni', $user_id_dni );
	$SQLStatement->bindParam( ':user_name', $user_name );
	$SQLStatement->bindParam( ':user_descrip', $user_descrip );
	$SQLStatement->execute();

	$status = array( status=>'ok', description=>'Usuario Modificado Satisfactoriamente!' );

    echo json_encode($status);
}
catch( PDOException $connectionException )
{
    $status = array( status=>'db-error (upload_user', description=>$connectionException->getMessage() );
    echo json_encode($status);
    die();
}

?>