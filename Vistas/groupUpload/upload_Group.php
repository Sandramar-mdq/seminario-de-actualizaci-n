<?php

include_once( "./database.php");


$json_body = file_get_contents('php://input');
$object = json_decode($json_body);

$group_id = $object->group_id;
$group_name = $object->group_name;
$group_descrip = $object->group_descrip;

try
{
	//Todo tipo de validación de información, debe ser realizada aquí de manera obligatoria
	//ANTES de enviar el comando SQL al motor de base de datos.

	$SQLStatement = $connection->prepare("CALL `upload_group`(:group_id, :group_name, :group_descrip)");
	$SQLStatement->bindParam( ':group_id', $group_id );
	$SQLStatement->bindParam( ':group_name', $group_name );
	$SQLStatement->bindParam( ':group_descrip', $group_descrip );
	$SQLStatement->execute();

	$status = array( status=>'ok', description=>'Grupo Modificado Satisfactoriamente!' );

    echo json_encode($status);
}
catch( PDOException $connectionException )
{
    $status = array( status=>'db-error (create.php', description=>$connectionException->getMessage() );
    echo json_encode($status);
    die();
}

?>