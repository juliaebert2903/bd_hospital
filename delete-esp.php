<?php
$db = new SQLite3("hosp.db");
$db->exec("DELETE FROM medicos_especialidades WHERE id_especialidade = " . $_POST["id_especialidade"]);
$db->exec("DELETE FROM especialidades WHERE id_especialidade = " . $_POST["id_especialidade"]);

$db->close();
header("Location: /especialidade.php");
