<?php
$db = new SQLite3("hosp.db");
foreach ($_POST as $key => $value) {
  $db->exec("UPDATE consultas SET " . $key . " = '" . $value . "' WHERE id_consulta =" . $_POST["id_consulta"]);
}
$db->close();
header("Location: /consulta.php");
