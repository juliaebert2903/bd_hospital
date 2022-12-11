<?php
$db = new SQLite3("hosp.db");
$keys = implode(",", array_keys($_POST));
$values = implode("','", array_values($_POST));
$db->exec("INSERT INTO exames (" . $keys . ") VALUES ('" . $values . "')");
$db->close();
header("Location: /exame.php");
