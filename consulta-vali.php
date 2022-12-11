<?php

$invalidos = 0;
if (!isset($_POST["id_consulta"])) {
    print_r('Erro1');
	$invalidos++;
} else {
	if (!preg_match("#^[0-9]+$#", $_POST["id_consulta"])) {
        print_r('Erro2');
		$invalidos++;
	}
}
if (!isset($_POST["dt_consulta"])) {
    print_r('Erro3');
	$invalidos++;
} else {
	if (!preg_match("#^(0?[0-9]{4})-(0?[0-9]{2})-(0?[0-9]{2})$#", $_POST["dt_consulta"])) {
        print_r('Erro4');
		$invalidos++;
	}
}
if (!isset($_POST["hora"])) {
    print_r('Erro5');
	$invalidos++;
} else {
	if (!preg_match("#^([01]?[0-9]|2[0-3])(:[0-5]?[0-9]){1,2}$#", $_POST["hora"])) {
        print_r('Erro6');
		$invalidos++;
	}
}
if (!isset($_POST["diagnostico"])) {
    print_r('Erro7');
	$invalidos++;
} else {
	if (!preg_match("#^[a-zA-Z0-9\s]+#", $_POST["diagnostico"])) {
        print_r('Erro8');
		$invalidos++;
	}
}
if (!isset($_POST["crm"])) {
    print_r('Erro9');
	$invalidos++;
} else {
	if (!preg_match("#^[0-9]{6}$#", $_POST["crm"])) {
        print_r('Erro10');
		$invalidos++;
	}
}
if (!isset($_POST["cpf"])) {
    print_r('Erro11');
    header('Location: /create-cons.php');
	$invalidos++;
} else {
    if (!preg_match("#^[0-9]{9}-[0-9]{2}$#", $_POST["cpf"])) {
        print_r('Erro12');
		$invalidos++;
	}
}

if ($invalidos == 0) {
	//ec<?php
    $db = new SQLite3("hosp.db");
    $keys = implode(",", array_keys($_POST));
    $values = implode("','", array_values($_POST));
    $db->exec("INSERT INTO consultas (" . $keys . ") VALUES ('" . $values . "')");
    $db->close();  
    header('Location: /consulta.php');
} 