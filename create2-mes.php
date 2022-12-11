<?php
$db = new SQLite3("hosp.db");
$keys = implode(",", array_keys($_POST));
$values = implode("','", array_values($_POST));
$db->exec("INSERT INTO medicos_especialidades (" . $keys . ") VALUES ('" . $values . "')");
$db->close();
header("Location: /med-esp.php");
