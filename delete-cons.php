<?php
$db = new SQLite3("hosp.db");
$db->exec("DELETE FROM exames WHERE id_consulta = " . $_POST["id_consulta"]);
$db->exec("DELETE FROM consultas WHERE id_consulta = " . $_POST["id_consulta"]);
$db->close();
header("Location: /consulta.php");
