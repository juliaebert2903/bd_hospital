<?php
$db = new SQLite3("hosp.db");
$db->exec("DELETE FROM medicos_especialidades WHERE id_especialidade = " . $_POST["id_especialidade"]);
// echo $db->changes() . " excluído com sucesso!";
$db->close();
header("Location: /med-esp.php");
