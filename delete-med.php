<?php
$db = new SQLite3("hosp.db");
$db->exec("DELETE FROM exames WHERE crm = " . $_POST["crm"]);
$db->exec("DELETE FROM consultas WHERE crm = " . $_POST["crm"]);
$db->exec("DELETE FROM medicos_especialidades WHERE crm = " . $_POST["crm"]);
$db->exec("DELETE FROM medicos WHERE crm = " . $_POST["crm"]);
// echo $db->changes() . " excluído com sucesso!";
$db->close();
header("Location: /medico.php");
