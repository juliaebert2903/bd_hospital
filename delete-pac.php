<?php
$db = new SQLite3("hosp.db");
$db->exec("DELETE FROM exames WHERE cpf = " . $_POST["cpf"]);
$db->exec("DELETE FROM consultas WHERE cpf = " . $_POST["cpf"]);
$db->exec("DELETE FROM pacientes WHERE cpf = " . $_POST["cpf"]);
$db->close();
header("Location: /paciente.php");
