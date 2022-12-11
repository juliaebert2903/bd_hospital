<?php
$db = new SQLite3("hosp.db");
foreach ($_POST as $key => $value) {
  $db->exec("UPDATE pacientes SET " . $key . " = '" . $value . "' WHERE cpf =" . $_POST["cpf"]);
}
$db->close();
header("Location: /paciente.php"); 
