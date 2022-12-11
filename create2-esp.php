<?php
$db = new SQLite3("hosp.db");
$keys = implode(",", array_keys($_POST));
$values = implode("','", array_values($_POST));
$db->exec("INSERT INTO especialidades (" . $keys . ") VALUES ('" . $values . "')");
$db->close();
header("Location: /especialidade.php");
