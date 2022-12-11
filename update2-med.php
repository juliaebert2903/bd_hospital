<?php
$db = new SQLite3("hosp.db");
foreach ($_POST as $key => $value) {
  $db->exec("UPDATE medicos SET " . $key . " = '" . $value . "' WHERE crm =" . $_POST["crm"]);
}
$db->close();
header("Location: /medico.php");
