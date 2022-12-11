<?php
$db = new SQLite3("hosp.db");
foreach ($_POST as $key => $value) {
  $db->exec("UPDATE especialidades SET " . $key . " = '" . $value . "' WHERE id_especialidade =" . $_POST["id_especialidade"]);
}
$db->close();
header("Location: /especialidade.php");
