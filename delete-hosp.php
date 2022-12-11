<?php
$db = new SQLite3("hosp.db");
$db->exec("DELETE FROM medico WHERE cnpj = " . $_POST["cnpj"]);
$db->exec("DELETE FROM hospital WHERE cnpj = " . $_POST["cnpj"]);
$db->close();
header("Location: /hospital.php");
