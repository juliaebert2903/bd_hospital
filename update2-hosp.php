<?php
$db = new SQLite3("hosp.db");
foreach ($_POST as $key => $value) {
  $db->exec("UPDATE hospital SET " . $key . " = '" . $value . "' WHERE cnpj =" . $_POST["cnpj"]);
}
$db->close();
header("Location: /hospital.php");
