<?php
$db = new SQLite3("hosp.db");
foreach ($_POST as $key => $value) {
  $db->exec("UPDATE exames SET " . $key . " = '" . $value . "' WHERE id_exame =" . $_POST["id_exame"]);
}
$db->close();
header("Location: /exame.php");
