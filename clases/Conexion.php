<?php



    $servidor= "b6k45kz2tfov8k3gm3lb-mysql.services.clever-cloud.com";
    $usuario= "uaonxvhriuzrnhqp";
    $password = "vAK0fRKcphsgN4apfb5D";
    $base= "b6k45kz2tfov8k3gm3lb";

	$mysqli = new mysqli($servidor, $usuario,$password,$base);
	$connection = mysqli_connect($servidor, $usuario,$password,$base) or die("Error " . mysqli_error($connection));
	
	if($mysqli->connect_error){
		echo "Nuestro sitio presenta fallas....";
		die('Error en la conexion' . $mysqli->connect_error);
		exit();	
	}
 $connect = new PDO("mysql:host=b6k45kz2tfov8k3gm3lb-mysql.services.clever-cloud.com;dbname=b6k45kz2tfov8k3gm3lb", "uaonxvhriuzrnhqp", "vAK0fRKcphsgN4apfb5D");

if (!mysqli_set_charset($mysqli, "utf8")) {
        printf("Error cargando el conjunto de caracteres utf8: %s\n", mysqli_error($mysqli));
        exit();
    } else {
        printf("");
    }

    
	

?>